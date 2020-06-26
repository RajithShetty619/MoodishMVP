import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';

import 'database.dart';

class DatabaseQuery {
  String _lastDocument;
  bool dataExists = true;
  final CollectionReference _ref = Firestore.instance.collection('0');

  Future<bool> getFood(BuildContext context) async {
    await Hive.openBox('foodlist');
    final _box = Hive.box('foodlist');
    List<dynamic> _gfoodList = await _box.get('0');
    if (_gfoodList == null) {
      print('getfood');
      Query q = _ref
          .where("Description", isGreaterThan: " ")
          .orderBy('Description')
          .limit(10);
      QuerySnapshot snapshot = await q.getDocuments();
      List<FoodListModel> queryList =
          DatabaseService().listFromSnapshot(snapshot);
      BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(queryList));

      print("$_lastDocument" + "doc");
      _lastDocument = queryList[queryList.length - 1].description;
    } else {
      List<FoodListModel> _foodList = _gfoodList.cast<FoodListModel>();
      BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(_foodList));

      print("$_lastDocument" + "doc");
      _lastDocument = _foodList[_foodList.length - 1].description;
    }
    return true;
  }

  Future<bool> getMoreFood(BuildContext context) async {
    print("getMoreFood");
    if (dataExists) {
      print("getFood");

      Query q = _ref
          .where("Description", isGreaterThan: " ")
          .startAfter([_lastDocument])
          .orderBy('Description')
          .limit(5);
      QuerySnapshot snapshot = await q.getDocuments();
      List<FoodListModel> queryList =
          DatabaseService().listFromSnapshot(snapshot);
      BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(queryList));

      _lastDocument = queryList[queryList.length - 1].description;

      if (snapshot.documents.length == 0) {
        dataExists = false;
        print("no data");
      }
    }
    return false;
  }
}
