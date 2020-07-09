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


  Future<List<FoodListModel>> getFood({List<String> field,List<dynamic> value,int limit=5,int check=0}) async {
  
    List<String> _field = field;
    List<dynamic> _value = value; 
    await Hive.openBox(listName);
    final _box = Hive.box(listName);
    List<dynamic> _gfoodList = await _box.get(listName);
    print('getfood');
    
    if (_gfoodList == null || check==0) {
      Query _finalQuery = _ref.where('description',isGreaterThan: '');

    if(_gfoodList!=null)
      _lastDocument = _gfoodList.cast<FoodListModel>()[_gfoodList.length-1].description;
      
      if (_value[_value.length - 1].runtimeType != String) {
        dynamic _v = _value.removeLast();
        print(_v);
        _finalQuery = _finalQuery.where(_field.removeLast(), whereIn: _v);
      }

      _finalQuery = 
          recQuery(_field, _value, _finalQuery).startAfter([_lastDocument]).orderBy('description').limit(limit);

      QuerySnapshot snapshot = await _finalQuery.getDocuments();
      List<FoodListModel> queryList =
          await DatabaseService().listFromSnapshot(snapshot);

      _lastDocument = queryList[queryList.length - 1].description; 

      await _box.put(listName,queryList);

      return queryList;

    } else {
      print("from data");
      List<FoodListModel> _foodList = _gfoodList.cast<FoodListModel>();  

      return _foodList;
    }
  }

  Future<List<FoodListModel>> getMoreFood({List<String> field,List<dynamic> value}) async {
    List<String> _field = field;
    List<dynamic> _value = value; 
    List<dynamic> _gfoodList=[];
    final _box = Hive.box(listName);
    _gfoodList  = await _box.get(listName);
    _lastDocument = _gfoodList.cast<FoodListModel>()[_gfoodList.length-1].description;

    if (dataExists) {
      print("getMoreFood"); 
      Query _finalQuery = _ref.where('description',isGreaterThan: '') ;

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
      ;
      await _box.put(listName,_gfoodList+queryList);

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
