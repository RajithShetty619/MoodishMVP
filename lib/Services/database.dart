import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/Services/storage.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';

class DatabaseService {
  final CollectionReference userName =
      FirebaseFirestore.instance.collection('Username');

/* /////////////////////////////////////////// rating&& reviews  /////////////////////////////////// */

  Future<void> restRating({String sr_no, String review, double rating}) async {
    if (review != null) {
      dynamic user = await Authenticate().returnUser();
      await FirebaseFirestore.instance
          .collection("restaurants")
          .doc(sr_no)
          .collection("review")
          .doc(user.uid)
          .set({
        "author_name": user.email,
        "rating": rating.toString(),
        "text": review
      });
    }
  }

///////////////////////////////////////////////////// save prefernce ///////////////

  Future<void> checkPreference() async {
    Box box = await Hive.openBox('preferenceBox');
    DocumentSnapshot userPref =
        await userName.doc(await Authenticate().returnUid()).get();
    String deter = await userPref.data()["deter"];
    print(deter);
    dynamic cuisine = await userPref.data()['cuisine'];
    print(cuisine);
    box.put('deter', deter);
    box.put('preference', cuisine);
  }

  Future<void> savePreference() async {
    Box box = await Hive.openBox('preferenceBox');
    String deter = await box.get('deter');
    List<String> cuisine = await box.get('preference');
    userName
        .doc(Authenticate().returnUid())
        .set({"cuisine": cuisine, "deter": deter}, SetOptions(merge: true));
  }

/* ///////////////////////////////////////////////////// Transaction //////////////////////////////////////////////////////////////////////// */
/* simple document increment method 
    collection is the name of collection in the db for eg food,facts,polls;
    sr_no is the document id number inside collection
    field is category you want to update 
    for eg:- in polls db has fields aLike ,bLike etc // MOHIT dhyan rakh ki models ke andar inke value int hai 
*/
  Future<void> likeTransction({
    String collection,
    String sr_no,
    String field,
    FoodListModel food,
  }) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection(collection).doc(sr_no);

    if (food != null) {
      String uid = Authenticate().returnUid();

      await FirebaseFirestore.instance
          .collection("Username")
          .doc("$uid")
          .collection("data")
          .doc("${food.sr_no}")
          .set({
        "foodName": food.foodName,
        "deter": food.deter,
        "cuisine": food.cuisine,
        "meal_type": food.meal_type,
        "images": food.images,
        "description": food.description,
        "recipe": food.recipe,
        "ingredients": food.ingredients,
        "servings": food.servings,
        "time": food.time,
        "nutrients": food.nutrients,
        "taste": food.taste,
        "situation": food.situation,
        "preparation": food.preparation,
        "calories": food.calories,
        "fat": food.fat,
        "carbohydrates": food.carbohydrates,
        "protein": food.protein,
        "mood": food.mood,
        "restaurants": food.restaurants,
        "delivery": food.delivery,
        "sr_no": food.sr_no,
        "timestamp": FieldValue.serverTimestamp()
      }, SetOptions(merge: true));
    }
    await documentReference.set({
      field: FieldValue.increment(1) /* atomically increments data by 1 */
    }, SetOptions(merge: true)).catchError((onError) => print(onError));
  }

  Future<void> disLikeTransction({
    String collection,
    String sr_no,
    String field,
    FoodListModel food,
  }) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection(collection).doc(sr_no);

    if (food != null) {
      String uid = Authenticate().returnUid();

      await FirebaseFirestore.instance
          .collection("Username")
          .doc("$uid")
          .collection("data")
          .doc("${food.sr_no}")
          .delete();
    }
    await documentReference.set({
      field: FieldValue.increment(-1) /* atomically increments data by 1 */
    }, SetOptions(merge: true)).catchError((onError) => print(onError));
  }
/* ////////////////////////////////////////////////////////////////////// USERNAMEMETHODS ////////////////////////////////////////////////////////// */

  Future<void> updateUserData({String uid, String email, String name}) async {
    return await userName.doc(uid).set({'name': name, 'email': email});
  }

  /* user data edit function for eg:- func(field:'name',value:'xyz')  then name field is update in db */
  Future<void> editUserData({String field, String value}) async {
    return await userName
        .doc(await Authenticate().returnUid())
        .set({field: value}, SetOptions(merge: true));
  }

  /* used to display name and email in profile */
  Future<Map<String, dynamic>> returnUser() async {
    Map<String, dynamic> _data = {};
    DocumentSnapshot user =
        await userName.doc(await Authenticate().returnUid()).get();
    user.data().forEach((key, value) {
      _data.putIfAbsent(key, () => value);
    });
    return _data;
  }

/* ////////////////////////////////////////////////////////////////////////  upload PHOTOMETHOD///////////////////////////////////////////////////// */

  Future uploadPhoto(File image) async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('user/' + await Authenticate().returnUid() + '/profilePhoto/');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    print('File Uploaded');
  }

  Future<String> downloadPhoto() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('user/' + await Authenticate().returnUid() + '/profilePhoto/');
    String _url = await storageReference.getDownloadURL();
    return _url;
  }

/* ////////////////////////////////////////////////////////////////////// ResturantListMETHODS ////////////////////////////////////////////////////////// */

  Future<List<RestListModel>> getRestFromList(List<String> list) async {
    list = list
        .map((e) => e
            .split(" ")
            .map((str) => '${str[0].toUpperCase()}${str.substring(1)}')
            .join(" "))
        .toList();
    List<String> data = [];
    for (int i = 0; i < 5; i++) {
      data.add(list[i]);
    }
    print(data);
    CollectionReference _ref =
        FirebaseFirestore.instance.collection('restaurants');
    Query q = _ref.where("Restaurant_Name", whereIn: data);
    QuerySnapshot snapshot = await q.get();
    print(snapshot.docs);
    List<RestListModel> _rest =
        await DatabaseService().listfromSnapshot(snapshot);
    return _rest;
  }

  Future<List<RestListModel>> listfromSnapshot(QuerySnapshot snapshot) async {
    return Future.wait(snapshot.docs.map((doc) async {
      Map<String, dynamic> _docdata = doc.data();
      //code to get images and info related to resturants in future

      return RestListModel(
          restaurant_Name: _docdata["Restaurant_Name"] ?? '',
          cuisines: _docdata["Cuisines"] ?? '',
          operational_after_Midnight:
              _docdata["Operational_after_Midnight"] ?? '',
          features: _docdata["Features"] ?? '',
          restaurant_Location: _docdata["Restaurant_Location"] ?? '',
          international_phone_number:
              _docdata["international_phone_number"] ?? '',
          rating: _docdata["rating"].toString() ?? '',
          website: _docdata["website"] ?? '',
          photo_url: _docdata["photo_url"] ?? '',
          reviews: _docdata["reviews"] ?? null,
          restaurant_Type: _docdata["Restaurant_Type"] ?? '',
          sr_no: _docdata["sr_no"] ?? '',
          address: _docdata["address"] ?? '');
    }).toList());
  }

/* ////////////////////////////////////////////////////////////////////// FOODLISTMETHODS ////////////////////////////////////////////////////////// */

  /* get fooddocument from sr_no */
  Future<DocumentSnapshot> documentFrmSrno({String sr_no}) async {
    return await FirebaseFirestore.instance.collection('food').doc(sr_no).get();
  }

  /* converts snapshot from db into foodListModel */
  Future<List<FoodListModel>> listFromSnapshot(QuerySnapshot snapshot) async {
    /* Future wait is used to make sure each iteration
      of the map is awaited by the code */
    return Future.wait(snapshot.docs.map((doc) async {
      Map<String, dynamic> _docData = doc.data();
      /* convert image name to url from storage */
      String _url = await Storage().getUrl(_docData["food_item"]);

      List<String> _preparation = [];
      List<String> _ingredients = [];
      int i = 2;
      /* done coz first step is named preparation for some reason */
      _preparation.add(_docData["preparation"]);
      /* converting step1,step2..... to List of preparation */

      while (_docData["step $i"] != null) {
        _preparation.add(_docData["step $i"]);
        i++;
      }
      /* initialized */
      i = 2;
      /* same reason as preparation */
      _ingredients.add(_docData["ingredient"]);
      /* converting step1,step2..... to List of preparation */
      while (_docData["ingredient $i"] != null) {
        _ingredients.add(_docData["ingredient $i"]);

        ++i;
      }
      List<String> _restaurants = [];
      try {
        _restaurants = (jsonDecode(_docData["restaurants"]) as List<dynamic>)
            .cast<String>();
      } catch (e) {
        _restaurants = [];
      }

      /* might look overwhelming but just 
      initialized constructor of FoodListModel */
      return FoodListModel(
          foodName: _docData["food_item"] ?? '',
          deter: _docData["deter"] ?? '',
          cuisine: _docData["cuisine"] ?? '',
          meal_type: _docData["mealtype"] ?? '',
          images: _url ?? '',
          description: _docData["description"] ?? '',
          recipe: _docData["recipe"] ?? '',
          ingredients: _ingredients ?? '',
          servings: _docData["serving"] ?? '',
          time: _docData["timing"] ?? '',
          nutrients: _docData["nutrients"] ?? '',
          taste: _docData["taste"] ?? '',
          situation: _docData["situation"] ?? '',
          preparation: _preparation ?? '',
          calories: _docData["calories"] ?? '',
          fat: _docData["fats"] ?? '',
          carbohydrates: _docData["carbohydrates"] ?? '',
          protein: _docData["proteins"] ?? '',
          mood: _docData["mood"] ?? '',
          delivery: _docData["delivery"] ?? '',
          sr_no: _docData["sr_no"] ?? '',
          restaurants: _restaurants ?? []);
    }).toList());
  }

  /* //////////////////////////////////////////////////// POLL METHOD///////////////////////////////////// */

  Future<void> likePoll({String sr_no, String opt, int like}) async {
    DocumentReference _poll =
        FirebaseFirestore.instance.collection('polls').doc(sr_no);
    _poll.set({opt: like}, SetOptions(merge: true));
  }
}

/* //////////////////////////////////////////////////// THIS_THAT METHOD///////////////////////////////////// */

//   Future<void> like_this_that({String option,String like}) async {
//     print(''+ option);
//     DocumentReference _that = Firestore.instance.collection('this_that')
//   }
/* example of Database Snapshot single DocumentSnapshot looks like this 
            "mood": "anger",
            "food_item": "American Pork Barbecue",
            "recipe": "The meat is pulled or chopped into moist strands, dressed with some remaining \"mop\" (the vinegar-and-red-pepper basting sauce), and mixed with cracklings.",
            "preparation": "Cut roast into quarters. Mix brown sugar, salt, paprika and pepper; rub over meat. Place meat and onions in a 5-qt. slow cooker.",
            "step2": "In a small bowl, whisk vinegar, Worcestershire sauce, sugar and seasonings; pour over roast. Cook, covered, on low 6-8 hours or until meat is tender.",
            "step3": "Remove roast; cool slightly. Reserve 1-1/2 cups cooking juices; discard remaining juices. Skim fat from reserved juices. Shred pork with two forks. Return pork and reserved juices to slow cooker; heat through. Serve on buns with coleslaw.",
            "ingredients": "\\n 1 boneless pork shoulder butt roast (4 to 5 pounds)\\n",
            "ingredient 2": "2 tablespoons brown sugar\\n",
            "ingredient 3": "2 teaspoons salt\\n",
            "ingredient4": "1 teaspoon paprika\\n",
            "ingredient5": "1/2 teaspoon pepper\\n",
            "ingredient6": "2 medium onions, quartered\\n",
            "ingredient7": "3/4 cup cider vinegar\\n",
            "ingredient8": "4 teaspoons Worcestershire sauce\\n",
            "ingredient9": "1 tablespoon sugar\\n",
            "ingredient10": "1 tablespoon crushed red pepper flakes\\n",
            "ingredient11": "1 teaspoon garlic salt\\n",
            "ingredient12": "1 teaspoon ground mustard\\n",
            "ingredient13": "1/2 teaspoon cayenne pepper\\n",
            "ingredient14": "14 hamburger buns, split\\n",
            "ingredient15": "1-3/4 pounds deli coleslaw",
            "serving": "14 servings",
            "time": "Prep: 30 min. Cook: 6 hours",
            "calories": "453 calories",
            "fat": "22g fat (6g saturated fat)",
            "carbohydrates": "35g",
            "protein": "27g",
            "taste": "Savory",
            "situation": "At Home",
            "restaurants": "West Coast Grill , Airoli",
            "delivery": "Swiggy | Zomato",
            "cuisine": "american",
            "deter": "nonveg",
            "description": "The meat is pulled or chopped into moist strands, dressed with some remaining \"mop\" (the vinegar-and-red-pepper basting sauce), and mixed with cracklings.",
            "meal_type": "Maincourse",
            "image": "americanporkbarbeque.JPG" 
*/
