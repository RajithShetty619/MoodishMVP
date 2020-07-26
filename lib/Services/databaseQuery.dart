import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/models/factsModel.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/models/pollsModel.dart';
import 'package:moodish_mvp/models/this_thatModel.dart';
import 'package:moodish_mvp/models/yesNo.dart';
import 'database.dart';

class DatabaseQuery {
  String _lastDocument;
  bool dataExists = true;
  final CollectionReference _ref = Firestore.instance.collection('food');

  final CollectionReference polls = Firestore.instance.collection('polls');

  final CollectionReference this_that =
      Firestore.instance.collection('this_that');

  final CollectionReference yesorno = Firestore.instance.collection('yesorno');

  final CollectionReference facts = Firestore.instance.collection('facts');
  final String listName;
  DatabaseQuery({this.listName});

  Future<List<FoodListModel>> getFood(
      {List<String> field,
      List<dynamic> value,
      int limit = 5,
      int check = 0,
      String mood}) async {
    List<String> _field = field;
    List<dynamic> _value = value;
    /* gets previous list saved by the name */
    final _box = await Hive.openBox(listName + (mood ?? ''));
    List<dynamic> _gfoodList = await _box.get(listName);
    print('getfood');

    /* condition satisfied when no list retrieved from memory
        or new list to be retrieved coz of next day has arrived */
    if (_gfoodList == null || check == 0) {
      Query _finalQuery = _ref.where('description', isGreaterThan: '');
      /* last document to continue query from */
      if (_gfoodList != null) if (_gfoodList.length != 0)
        _lastDocument =
            _gfoodList.cast<FoodListModel>()[_gfoodList.length - 1].description;

      /* used if value has more than item for single field*/
      if (_value[_value.length - 1].runtimeType != String) {
        dynamic _v = _value.removeLast();
        print(_v);
        _finalQuery = _finalQuery.where(_field.removeLast(), whereIn: _v);
      }
      /* used lastdocument */
      if (_lastDocument != null)
        _finalQuery = recQuery(_field, _value, _finalQuery)
            .startAfter([_lastDocument])
            .orderBy('description')
            .limit(limit);
      /* not used lastdocument */
      else
        _finalQuery = recQuery(_field, _value, _finalQuery)
            .orderBy('description')
            .limit(limit);

      /* convert query into useable foodListModel */
      QuerySnapshot snapshot = await _finalQuery.getDocuments();
      List<FoodListModel> queryList =
          await DatabaseService().listFromSnapshot(snapshot);

      /* saving list for later use */
      await _box.put(listName, queryList);

      return queryList;
    }
    /* if got list readily from memory  */
    else {
      print("from data");
      List<FoodListModel> _foodList = _gfoodList.cast<FoodListModel>();
      return _foodList;
    }
  }

  /* almost same working as getFood exceot it add to and existing list */
  Future<List<FoodListModel>> getMoreFood(
      {List<String> field, List<dynamic> value}) async {
    List<String> _field = field;
    List<dynamic> _value = value;
    List<dynamic> _gfoodList = [];
    final _box = Hive.box(listName);
    _gfoodList = await _box.get(listName);
    _lastDocument =
        _gfoodList.cast<FoodListModel>()[_gfoodList.length - 1].description;

    if (dataExists) {
      print("getMoreFood");
      Query _finalQuery = _ref.where('description', isGreaterThan: '');

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

      await _box.put(listName, _gfoodList + queryList);

      return queryList;
    } else {
      return [];
    }
  }

  //builds query by stacking 'where(_field,_value)' statement behind each ohter
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

  Future<List<PollsModel>> getPoll() async {
    /* retrieving last polls for querying */
    Box _box = await Hive.openBox('polls');
    dynamic last = _box.get('lastpoll');
    /*  */
    Query q = polls
        .where('value', isGreaterThan: '')
        .startAfter([last])
        .orderBy('value')
        .limit(3);
    List<DocumentSnapshot> _snapshot =
        await q.getDocuments().then((value) => value.documents);

    /* saving last poll to be displayed*/
    try {
      String _lastpoll = await _snapshot[_snapshot.length - 1].data['value'];
      await _box.put('lastpoll', _lastpoll);
    } catch (e) {
      await _box.put('lastpoll', null);
    }

    /* list of polls is made and returned */
    return _snapshot.map((doc) {
      print(doc.data);
      Map<String, dynamic> _docData = doc.data;
      return PollsModel(
          question: _docData['value'],
          A: _docData['A'] ?? '',
          B: _docData['B'] ?? '',
          C: _docData['C'] ?? '',
          D: _docData['D'] ?? '',
          sr_no: _docData['sr_no'] ?? '',
          aLike: _docData['aLike'] ?? 0,
          bLike: _docData['bLike'] ?? 0,
          cLike: _docData['cLike'] ?? 0,
          dLike: _docData['dLike'] ?? 0);
    }).toList();
  }

  Future<List<This_thatModel>> getthis_that() async {
    Box _box = await Hive.openBox('this_that');
    dynamic end = _box.get('endthat');

    Query t = this_that
        .where('A', isGreaterThan: '')
        .startAfter([end])
        .orderBy('A')
        .limit(2);
    List<DocumentSnapshot> _snapshot =
        await t.getDocuments().then((value) => value.documents);
    // saving last this_that to be shown
    String _endthat = await _snapshot[_snapshot.length - 1].data['A'];
    await _box.put('endthat', _endthat);

/* list of this_that is made and returned */
    return _snapshot.map((doc) {
      print(doc.data);
      Map<String, dynamic> _docData = doc.data;
      return This_thatModel(
        A: _docData['A'],
        B: _docData['B'] ?? '',
        aLike: _docData['aLike'] ?? 0,
        bLike: _docData['bLike'] ?? 0,
      );
    }).toList();
  }

  Future<List<YesNoModel>> getYesno() async {
    Box _box = await Hive.openBox('yesorno');
    dynamic end = _box.get('end');

    Query y = yesorno
        .where('Questions', isGreaterThan: '')
        .startAfter([null])
        .orderBy('Questions')
        .limit(3);
    List<DocumentSnapshot> _snapshot =
        await y.getDocuments().then((value) => value.documents);
    // saving last this_that to be shown
    String _end = await _snapshot[_snapshot.length - 1].data['Questions'];
    await _box.put('end', _end);

/* list of this_that is made and returned */
    return _snapshot.map((doc) {
      print(doc.data);
      Map<String, dynamic> _docData = doc.data;
      return YesNoModel(
        Questions: _docData['Questions'],
        yes: _docData['yes'] ?? 0,
        no: _docData['no'] ?? 0,
      );
    }).toList();
  }

  Future<List<FactModel>> getFact() async {
    /* retrieving last polls for querying */
    Box _box = await Hive.openBox('fact');
    dynamic last = _box.get('lastfact');
    /*  */
    Query q = facts
        .where('fact', isGreaterThan: '')
        .startAfter([last])
        .orderBy('fact')
        .limit(5);
    List<DocumentSnapshot> _snapshot =
        await q.getDocuments().then((value) => value.documents);

    /* saving last poll to be displayed*/
    try {
      String _lastfact = await _snapshot[_snapshot.length - 1].data['fact'];
      await _box.put('lastfact', _lastfact);
    } catch (e) {
      await _box.put('lastfact', null);
    }

    /* list of polls is made and returned */
    return _snapshot.map((doc) {
      print(doc.data);
      Map<String, dynamic> _docData = doc.data;
      return FactModel(
          factHeading: _docData['fact'],
          factStatment: _docData['factStatement']);
    }).toList();
  }
}
