import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart'; 
import 'package:hive/hive.dart';
import 'package:moodish_mvp/models/foodListModel.dart'; 
import 'database.dart';

class DatabaseQuery {
  String _lastDocument;
  bool dataExists = true;
  final CollectionReference _ref = Firestore.instance.collection('0');

  Future<List<FoodListModel>> getFood(BuildContext context) async {
    await Hive.openBox('foodlist');
    final _box = Hive.box('foodlist');
    List<dynamic> _gfoodList = await _box.get('0');
    
      print('getfood');
    if (_gfoodList == null) { 
      Query q = _ref
          .where("Description", isGreaterThan: " ")
          .orderBy('Description')
          .limit(5);
      QuerySnapshot snapshot = await q.getDocuments();
      List<FoodListModel> queryList =
          DatabaseService().listFromSnapshot(snapshot);
       
      _lastDocument = queryList[queryList.length - 1].description;
      print("$_lastDocument" + "doc");
      return queryList;

    } else {
      List<FoodListModel> _foodList = _gfoodList.cast<FoodListModel>(); 
      _lastDocument = _foodList[_foodList.length - 1].description;
      print("$_lastDocument" + "doc");
      
      return _foodList;
    } 
  }

  Future<List<FoodListModel>> getMoreFood(BuildContext context) async {
     
    if (dataExists) { 
      print("getMoreFood");
      print("$_lastDocument");
      Query q = _ref
          .where("Description", isGreaterThan: " ")
          .startAfter([_lastDocument])
          .orderBy('Description')
          .limit(2);
      QuerySnapshot snapshot = await q.getDocuments();
      List<FoodListModel> queryList =
          DatabaseService().listFromSnapshot(snapshot);  
      _lastDocument = queryList[queryList.length - 1].description; 
      if (snapshot.documents.length == 0) {
        dataExists = false;
        print("no data");
      }
      return queryList;
    } 
    else {
      return [];
    }
  }
}
