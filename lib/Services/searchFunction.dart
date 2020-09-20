import 'package:http/http.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/Services/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:moodish_mvp/models/foodListModel.dart';

class SearchFunction {
  Future<List<FoodListModel>> search(String text) async {
    print("called");
    var data = await get(
        'https://us-central1-moodishtest.cloudfunctions.net/helloWorld?text=$text');
    var info = json.decode(data.body);

    List<dynamic> _passData = json.decode(info["results"]);
    List<FoodListModel> _list = await listFromSnapshot(_passData);
    await setRecent(_passData);
    return _list;
  }

  setRecent(List<dynamic> data) async {
    Future.wait(data.map((doc) async {
      await FirebaseFirestore.instance
          .collection('recent')
          .doc(doc['sr_no'])
          .set(doc);
      await FirebaseFirestore.instance
          .collection('recent')
          .doc(doc['sr_no'])
          .set({'timestamp': FieldValue.serverTimestamp()},
              SetOptions(merge: true));
    }));
  }

  Future<List<FoodListModel>> listFromSnapshot(List<dynamic> snapshot) async {
    /* Future wait is used to make sure each iteration
      of the map is awaited by the code */
    return Future.wait(snapshot.map((doc) async {
      dynamic _docData = doc;
      print(_docData);
      print("////////////////////////////////////////////////////");
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

  Future<List<FoodListModel>> recentSearch() async {
    QuerySnapshot recent = await FirebaseFirestore.instance
        .collection('recent')
        .orderBy('timestamp', descending: true)
        .limit(6)
        .get();
    List<FoodListModel> recentDocs =
        await DatabaseService().listFromSnapshot(recent);

    return recentDocs;
  }
}
