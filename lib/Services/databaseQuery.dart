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
  String _orderVal;
  List<String> field = [];
  List<String> value = [];

  DatabaseQuery({this.listName, this.field, this.value}) {
    this._orderVal = field[0];
  }

  Future<List<FoodListModel>> getFood(BuildContext context) async {
    await Hive.openBox('foodlist');
    final _box = Hive.box('foodlist');
    List<dynamic> _gfoodList = await _box.get(listName);

    print('getfood');
    if (_gfoodList == null) {
      Query q =
          recQuery(field, value, _ref.where('description', isGreaterThan: ''))
              .orderBy('description')
              .limit(5);
      QuerySnapshot snapshot = await q.getDocuments();
      List<FoodListModel> queryList =
          await DatabaseService().listFromSnapshot(snapshot);

      _lastDocument = queryList[queryList.length - 1].description;
      print("$_lastDocument");

      return queryList;
    } else {
      print("from data");
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
      Query q =
          recQuery(field, value, _ref.where('description', isGreaterThan: ''))
              .startAfter([_lastDocument])
              .orderBy('description')
              .limit(2);
      QuerySnapshot snapshot = await q.getDocuments();
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
  Query recQuery(List<String> _field, List<String> _value, Query q) {
    Query _query = q;
    if (_field.isEmpty) {
      print(_query.toString());
      return _query;
    } else {
      _query =
          _query.where(_field.removeLast(), isEqualTo: _value.removeLast());
      return recQuery(_field, _value, _query);
    }
  }
}
