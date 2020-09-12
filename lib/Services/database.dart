import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/Services/storage.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/models/name.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';

class DatabaseService {
  final CollectionReference userName =
      Firestore.instance.collection('Username');

/* ///////////////////////////////////////////////////// save prefernce /////////////// */

  Future<void> checkPreference() async {
    Box box = await Hive.openBox('preferenceBox');
    DocumentSnapshot userPref = await  userName.document(await Authenticate().returnUid()).get();
    String deter = await userPref.data["deter"];
    print(deter);
    List<String> cuisine = await userPref.data['cuisine'];
    print(cuisine);
    box.put('deter', deter);
    box.put('preference',cuisine);

  }

  Future<void> savePreference() async {
    Box box = await Hive.openBox('preferenceBox');
    String deter = await box.get('deter');
    List<String> cuisine = await box.get('preference'); 
    userName.document(await Authenticate().returnUid()).setData({"cuisine":cuisine,"deter":deter},merge: true);
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
        Firestore.instance.collection(collection).document(sr_no);

    if (food != null) {
      String uid = await Authenticate().returnUid();
      Map<String, dynamic> _food = {};

      _food = {
        'foodName': food.foodName,
        'meal_type': food.meal_type,
        'deter': food.deter
      };

      Firestore.instance
          .collection("username")
          .document("$uid")
          .collection("data")
          .document("${food.mood}")
          .setData({food.sr_no: _food}, merge: true);
    }
    return documentReference.setData({
      field: FieldValue.increment(1) /* atomically increments data by 1 */
    }, merge: true).catchError((onError) => print(onError));
  }
/* ////////////////////////////////////////////////////////////////////// USERNAMEMETHODS ////////////////////////////////////////////////////////// */

  Future<void> updateUserData({String uid, String email, String name}) async {
    return await userName.document(uid).setData({'name': name, 'email': email});
  }

  /* user data edit function for eg:- func(field:'name',value:'xyz')  then name field is update in db */
  Future<void> editUserData({String field, String value}) async {
    return await userName
        .document(await Authenticate().returnUid())
        .setData({field: value}, merge: true);
  }

  /* used to display name and email in profile */
  Future<Map<String, String>> returnUser() async {
    Map<String, String> _data = {};
    DocumentSnapshot user =
        await userName.document(await Authenticate().returnUid()).get();
    user.data.forEach((key, value) {
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

  Future<List<RestListModel>> listfromSnapshot(QuerySnapshot snapshot) async {
    return Future.wait(snapshot.documents.map((doc) async {
      Map<String, dynamic> _docdata = doc.data;
      //code to get images and info related to resturants in future


      return RestListModel(
        restname: _docdata["Restaurant_Name"] ?? '',
        restcuisine: _docdata["Cuisines"] ?? '',
        costForTwo: _docdata["Cost_for_two(Rs.)"] ?? '',
        hrs: _docdata["Operational_hours"] ?? '',
        features: _docdata["Features"] ??'',
        homeDelivery: _docdata["Home_Delivery"] ?? '',
        addnoutlet: _docdata["Additional_outlet_count"] ?? '',
        location: _docdata["Restaurant_Location"] ?? '',
        rating: _docdata["Rating"] ?? '',
        avgRating: _docdata["Rating_Category"] ?? '',
      );
    }).toList());
  }

/* ////////////////////////////////////////////////////////////////////// FOODLISTMETHODS ////////////////////////////////////////////////////////// */

  /* get fooddocument from sr_no */
  Future<DocumentSnapshot> documentFrmSrno({String sr_no}) async {
    return await Firestore.instance.collection('food').document(sr_no).get();
  }

  Future<List<FoodListModel>> searchDocuments({dynamic data}) async {}

  /* converts snapshot from db into foodListModel */
  Future<List<FoodListModel>> listFromSnapshot(QuerySnapshot snapshot) async {
    /* Future wait is used to make sure each iteration
      of the map is awaited by the code */
    return Future.wait(snapshot.documents.map((doc) async {
      Map<String, dynamic> _docData = doc.data;
      /* convert image name to url from storage */
      String _url = await Storage().getUrl(_docData["image"]);

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
      _ingredients.add(_docData["ingredients"]);
      /* converting step1,step2..... to List of preparation */
      while (_docData["ingredient $i"] != null) {
        _ingredients.add(_docData["ingredient $i"]);

        ++i;
      }
      /* might look overwhelming but just 
      initialized constructor of FoodListModel */
      return FoodListModel(
          foodName: _docData["food_item"] ?? '',
          deter: _docData["deter"] ?? '',
          cuisine:
              "${_docData['cuisine'][0].toUpperCase()}${_docData['cuisine'].substring(1)}" ??
                  '',
          meal_type: _docData["meal_type"] ?? '',
          images: _url ?? '',
          description: _docData["description"] ?? '',
          recipe: _docData["recipe"] ?? '',
          ingredients: _ingredients ?? '',
          servings: _docData["serving"] ?? '',
          time: _docData["time"] ?? '',
          nutrients: _docData["nutrients"] ?? '',
          taste: _docData["taste"] ?? '',
          situation: _docData["situation"] ?? '',
          preparation: _preparation ?? '',
          calories: _docData["calories"] ?? '',
          fat: _docData["fat"] ?? '',
          carbohydrates: _docData["carbohydrates"] ?? '',
          protein: _docData["protein"] ?? '',
          mood: _docData["mood"] ?? '',
          restaurants: _docData["restaurants"] ?? '',
          delivery: _docData["delivery"] ?? '',
          sr_no: _docData["sr_no"] ?? '');
      // like: _docData["like"] ?? 0);
    }).toList());
  }

  /* //////////////////////////////////////////////////// POLL METHOD///////////////////////////////////// */

  Future<void> likePoll({String sr_no, String opt, int like}) async {
    DocumentReference _poll =
        Firestore.instance.collection('polls').document(sr_no);
    _poll.setData({opt: like}, merge: true);
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
