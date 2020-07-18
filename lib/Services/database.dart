import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/Services/storage.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/models/name.dart';

class DatabaseService {
  final CollectionReference userName =
      Firestore.instance.collection('Username');

/* ////////////////////////////////////////////////////////////////////// USERNAMEMETHODS ////////////////////////////////////////////////////////// */

  Future<void> updateUserData({String uid, String email, String name}) async {
    return await userName.document(uid).setData({'name': name, 'email': email});
  }
  /* used to display name and email in profile */
  Future<List<String>> returnUser() async {
    List<String> _data = [];
    DocumentSnapshot user =
        await userName.document(await Authenticate().returnUid()).get();
    _data.add(user.data['name']);
    _data.add(user.data['email']);
    return _data;
  }

/* ////////////////////////////////////////////////////////////////////// FOODLISTMETHODS ////////////////////////////////////////////////////////// */

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
      _preparation.add(await _docData["preparation"]);
      /* converting step1,step2..... to List of preparation */
      while (_docData["step$i"] != null) {
        _preparation.add(await _docData["step$i"]);
        i++;
      }
      /* initialized */
      i = 2;
      /* same reason as preparation */
      _ingredients.add(await _docData["ingredients"]);

      /* converting step1,step2..... to List of preparation */ 
      while (await _docData["ingredient$i"] != null) {
        _ingredients.add(await _docData["ingredient$i"]);
        ++i;
      } 
      /* might look overwhelming but just 
      initialized constructor of FoodListModel */
      return FoodListModel(
        foodName: _docData["food_item"] ?? '',
        deter: _docData["deter"] ?? '',
        cuisine: _docData["cuisine"] ?? '',
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
        sr_no: _docData["sr_no"] ?? ''
      );
    }).toList());
  }

  /* //////////////////////////////////////////////////// POLL METHOD///////////////////////////////////// */

  Future<void> likePoll({String sr_no,String opt,String like}) async {
    print(sr_no+"  "+opt);
    DocumentReference _poll = Firestore.instance.collection('polls').document(sr_no);
    _poll.setData({opt:like});
  }
}

/* example of Database Snapshot single DocumentSnapshot looks like this 
 "mood": "anger",
            "food_item": "American Pork Barbecue",
            "recipe": "The meat is pulled or chopped into moist strands, dressed with some remaining \"mop\" (the vinegar-and-red-pepper basting sauce), and mixed with cracklings.",
            "preparation": "Cut roast into quarters. Mix brown sugar, salt, paprika and pepper; rub over meat. Place meat and onions in a 5-qt. slow cooker.",
            "step2": "In a small bowl, whisk vinegar, Worcestershire sauce, sugar and seasonings; pour over roast. Cook, covered, on low 6-8 hours or until meat is tender.",
            "step3": "Remove roast; cool slightly. Reserve 1-1/2 cups cooking juices; discard remaining juices. Skim fat from reserved juices. Shred pork with two forks. Return pork and reserved juices to slow cooker; heat through. Serve on buns with coleslaw.",
            "ingredients": "\\n 1 boneless pork shoulder butt roast (4 to 5 pounds)\\n",
            "ingredient2": "2 tablespoons brown sugar\\n",
            "ingredient3": "2 teaspoons salt\\n",
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
