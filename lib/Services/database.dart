import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/Services/storage.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/models/name.dart';

class DatabaseService {
  final CollectionReference userName =
      Firestore.instance.collection('Username');

  final CollectionReference polls = Firestore.instance.collection('polls');

  Future<void> updateUserData({String uid, String email, String name}) async {
    return await userName.document(uid).setData({'name': name, 'email': email});
  }
/* 
  Future<void> setPreference() async {
    return await userName.document
  } */

  Future<List<String>> returnUser() async {
    List<String> _data = [];
    DocumentSnapshot user =
        await userName.document(await Authenticate().returnUid()).get();
    _data.add(user.data['name']);
    _data.add(user.data['email']);
    return _data;
  }

  Future<List<FoodListModel>> listFromSnapshot(QuerySnapshot snapshot) async {
    return Future.wait(snapshot.documents.map((doc) async {
      Map<String, dynamic> _docData = doc.data;
      String _url = await Storage().getUrl(_docData["image"]);
      List<String> _preparation = [];
      List<String> _ingredients = [];
      int i = 2;
      _preparation.add(await _docData["preparation"]);

      while (_docData["step$i"] != null) {
        _preparation.add(await _docData["step$i"]);
        i++;
      }
      i = 2;

      _ingredients.add(await _docData["ingredients"]);

      while (await _docData["ingredient$i"] != null) {
        _ingredients.add(await _docData["ingredient$i"]);
        ++i;
      }
      print(_preparation);
      print(_ingredients);

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
      );
    }).toList());
  }
}
/* 
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
