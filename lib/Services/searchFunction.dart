import 'package:http/http.dart';
import 'package:moodish_mvp/Services/storage.dart';
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
    return _list;
  }

  Future<List<FoodListModel>> listFromSnapshot(List<dynamic> snapshot) async {
    /* Future wait is used to make sure each iteration
      of the map is awaited by the code */
    return Future.wait(snapshot.map((doc) async {
      dynamic _docData = doc;
      print(_docData);
      print("////////////////////////////////////////////////////");
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
          sr_no: _docData["sr_no"] ?? '');
    }).toList());
  }
}
