import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'database.dart';

class DatabaseQuery {
  String _lastDocument;
  bool dataExists = true;
  final CollectionReference _ref = Firestore.instance.collection('food');
  final String listName;  
  DatabaseQuery({this.listName});


  Future<List<FoodListModel>> getFood({List<String> field,List<dynamic> value}) async {
  
    List<String> _field = field;
    List<dynamic> _value = value;
    print(field );
    print(value);
    await Hive.openBox('foodlist');
    final _box = Hive.box('foodlist');
    List<dynamic> _gfoodList = await _box.get(listName);
    print('getfood');
    if (_gfoodList == null) {
      Query _finalQuery = _ref.where('description',isGreaterThan: '');

      if (_value[_value.length - 1].runtimeType != String) {
        dynamic _v = _value.removeLast();
        print(_v);
        _finalQuery = _finalQuery.where(_field.removeLast(), whereIn: _v);
      }

      _finalQuery = 
          recQuery(_field, _value, _finalQuery).orderBy('description').limit(5);

      QuerySnapshot snapshot = await _finalQuery.getDocuments();
      List<FoodListModel> queryList =
          await DatabaseService().listFromSnapshot(snapshot);

      _lastDocument = queryList[queryList.length - 1].description;
      print("$_lastDocument");
      print("$field");

      return queryList;
    } else {
      print("from data");
      List<FoodListModel> _foodList = _gfoodList.cast<FoodListModel>();
      _lastDocument = _foodList[_foodList.length - 1].description;
      print("$_lastDocument" + "doc");

      return _foodList;
    }
  }

  Future<List<FoodListModel>> getMoreFood({List<String> field,List<dynamic> value}) async {
    List<String> _field = field;
    List<dynamic> _value = value;
    print(_field);
    if (dataExists) {
      print("getMoreFood");
      print("$_lastDocument");
      Query _finalQuery = _ref.where('description',isEqualTo: '') ;

      if (_value[_value.length - 1].runtimeType != String) {
        dynamic _v = _value.removeLast();
        print(_v);
        _finalQuery = _finalQuery.where(_field.removeLast(), whereIn: _v);
      }

      _finalQuery = recQuery(_field, _value, _finalQuery)
          .startAfter([_lastDocument])
          .orderBy('description')
          .limit(2);

      QuerySnapshot snapshot = await _finalQuery.getDocuments();
      List<FoodListModel> queryList =
          await DatabaseService().listFromSnapshot(snapshot);
      _lastDocument = queryList[queryList.length - 1].description;
      if (snapshot.documents.length == 0) {
        dataExists = false;
        print("no data");
      }
      return queryList;
    } else {
      return [];
    }
  }

  //builds query
  Query recQuery(List<String> _field, List<dynamic> _value, Query q) {
    Query _query = q;
    if (_field.isEmpty) { 
      return _query;
    } else {
      _query =
          _query.where(_field.removeLast(), isEqualTo: _value.removeLast());
      return recQuery(_field, _value, _query);
    }
  }
}
