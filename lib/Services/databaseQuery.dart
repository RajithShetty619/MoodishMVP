import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/models/factsModel.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/models/pollsModel.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'package:moodish_mvp/models/this_thatModel.dart';
import 'package:moodish_mvp/models/yesNo.dart';
import 'database.dart';

class DatabaseQuery {
  String _lastDocument;
  bool dataExists = true;
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('food');

  final CollectionReference rest =
      FirebaseFirestore.instance.collection('restaurants');

  final CollectionReference polls =
      FirebaseFirestore.instance.collection('polls');

  final CollectionReference this_that =
      FirebaseFirestore.instance.collection('this_that');

  final CollectionReference yesorno =
      FirebaseFirestore.instance.collection('yesorno');

  final CollectionReference facts =
      FirebaseFirestore.instance.collection('facts');

  final CollectionReference restaurants =
      FirebaseFirestore.instance.collection('restaurants');
  final String listName;
  DatabaseQuery({this.listName});

// // restaurant data query
  Future<List<RestListModel>> getRest({
    List<String> field,
    List<dynamic> value,
    int limit = 5,
    int check = 0,
  }) async {
    Query q = restaurants.orderBy("rating", descending: true).limit(10);
    QuerySnapshot snapshot = await q.get();
    return await DatabaseService().listfromSnapshot(snapshot);
  }

  Future<List<FoodListModel>> getFood({
    List<String> field,
    List<dynamic> value,
    int limit = 5,
    int check = 0,
    String mood,
    String deter,
  }) async {
    List<String> _field = field;
    List<dynamic> _value = value;
    /* gets previous list saved by the name */
    final _box = await Hive.openBox(listName + (mood ?? '') + (deter ?? ''));
    List<dynamic> _gfoodList = await _box.get(listName);

    /* condition satisfied when no list retrieved from memory
        or new list to be retrieved coz of next day has arrived */
    if (_gfoodList == null || check == 0) {
      Query _finalQuery = _ref.orderBy('description');
      /* last document to continue query from */
      if (_gfoodList != null) if (_gfoodList.length != 0)
        _lastDocument =
            _gfoodList.cast<FoodListModel>()[_gfoodList.length - 1].description;

      /* used if value has more than item for single field*/
      if (_value[_value.length - 1].runtimeType != String) {
        dynamic _v = _value.removeLast();
        _finalQuery = _finalQuery.where(_field.removeLast(), whereIn: _v);
      }
      /* used lastdocument */
      if (_lastDocument != null)
        _finalQuery = recQuery(_field, _value, _finalQuery)
            .startAfter([_lastDocument]).limit(limit);
      /* not used lastdocument */
      else
        _finalQuery = recQuery(_field, _value, _finalQuery).limit(limit);

      /* convert query into useable foodListModel */
      QuerySnapshot snapshot = await _finalQuery.get();
      List<FoodListModel> queryList =
          await DatabaseService().listFromSnapshot(snapshot);
      await _box.put(listName, queryList);
      if (queryList.length < 5) {
        await _box.put(listName, null);
        _finalQuery = _ref
            .orderBy('description')
            .where("deter", isEqualTo: "veg")
            .limit(limit);
        snapshot = await _finalQuery.get();
        queryList = await DatabaseService().listFromSnapshot(snapshot);
      }
      /* saving list for later use */
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
  Future<List<FoodListModel>> getMoreFood({
    List<String> field,
    List<dynamic> value,
    String mood,
    String deter,
  }) async {
    List<String> _field = field;
    List<dynamic> _value = value;
    List<dynamic> _gfoodList = [];
    final _box = await Hive.openBox(listName + (mood ?? '') + (deter ?? ''));
    _gfoodList = await _box.get(listName);
    _lastDocument =
        _gfoodList.cast<FoodListModel>()[_gfoodList.length - 1].description;

    if (dataExists) {
      print("getMoreFood");
      Query _finalQuery = _ref.orderBy('description');

      if (_value[_value.length - 1].runtimeType != String) {
        dynamic _v = _value.removeLast();
        _finalQuery = _finalQuery.where(_field.removeLast(), whereIn: _v);
      }

      _finalQuery = recQuery(_field, _value, _finalQuery)
          .startAfter([_lastDocument]).limit(4);

      QuerySnapshot snapshot = await _finalQuery.get();
      List<FoodListModel> queryList =
          await DatabaseService().listFromSnapshot(snapshot);
      _lastDocument = queryList[queryList.length - 1].description;
      if (snapshot.docs.length == 0) {
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
    dynamic last = _box.get(listName);
    /*  */
    Query q = polls.orderBy('value').startAfter([last]).limit(4);
    List<DocumentSnapshot> _snapshot =
        await q.get().then((value) => value.docs);
    if (_snapshot.length < 3) {
      q = polls.orderBy('value').limit(4);
      _snapshot = await q.get().then((value) => value.docs);
    }
    /* saving last poll to be displayed*/
    try {
      String _lastpoll = await _snapshot[_snapshot.length - 1].data()['value'];
      await _box.put(listName, _lastpoll);
    } catch (e) {
      await _box.put(listName, null);
    }

    /* list of polls is made and returned */
    return _snapshot.map((doc) {
      Map<String, dynamic> _docData = doc.data();
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

    Query t = this_that.orderBy('A').startAfter([end]).limit(4);
    List<DocumentSnapshot> _snapshot =
        await t.get().then((value) => value.docs);
    if (_snapshot.length < 3) {
      t = polls.orderBy('A').limit(4);
      _snapshot = await t.get().then((value) => value.docs);
    }
    // saving last this_that to be shown
    String _endthat = await _snapshot[_snapshot.length - 1].data()['A'];
    await _box.put('endthat', _endthat);

/* list of this_that is made and returned */
    return _snapshot.map((doc) {
      Map<String, dynamic> _docData = doc.data();
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

    Query y = yesorno.orderBy('Questions').startAfter([end]).limit(4);
    List<DocumentSnapshot> _snapshot =
        await y.get().then((value) => value.docs);
    if (_snapshot.length < 3) {
      y = yesorno.orderBy('Questions').limit(4);
      _snapshot = await y.get().then((value) => value.docs);
    }
    // saving last this_that to be shown
    String _end = await _snapshot[_snapshot.length - 1].data()['Questions'];
    await _box.put('end', _end);

/* list of this_that is made and returned */
    return _snapshot.map((doc) {
      Map<String, dynamic> _docData = doc.data();
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
    Query q = facts.orderBy('fact').startAfter([last]).limit(5);
    List<DocumentSnapshot> _snapshot =
        await q.get().then((value) => value.docs);

    /* saving last poll to be displayed*/
    try {
      String _lastfact = await _snapshot[_snapshot.length - 1].data()['fact'];
      await _box.put('lastfact', _lastfact);
    } catch (e) {
      await _box.put('lastfact', null);
    }

    /* list of polls is made and returned */
    return _snapshot.map((doc) {
      Map<String, dynamic> _docData = doc.data();
      return FactModel(
          factHeading: _docData['fact'],
          factStatment: _docData['factStatement']);
    }).toList();
  }

  Future<List<FoodListModel>> getLikedFood() async {
    String uid = Authenticate().returnUid();
    CollectionReference _ref = FirebaseFirestore.instance
        .collection('Username')
        .doc(uid)
        .collection("data");

    QuerySnapshot recent =
        await _ref.orderBy('timestamp', descending: true).limit(6).get();

    Future<List<FoodListModel>> listFromSnapshot(QuerySnapshot snapshot) async {
      /* Future wait is used to make sure each iteration
      of the map is awaited by the code */
      return Future.wait(snapshot.docs.map((doc) async {
        Map<String, dynamic> _docData = doc.data();
        /* convert image name to url from storage */

        List<String> _preparation = [];
        List<String> _ingredients = [];

        try {
          var data = (_docData["preparation"] as List<dynamic>).cast<String>();
          _preparation = data;
          data = (_docData["preparation"] as List<dynamic>).cast<String>();
          _ingredients = data;
        } catch (E) {
          print(E);
        }

        print(_preparation);
        print(_ingredients);
        return FoodListModel(
            foodName: _docData["foodName"] ?? '',
            deter: _docData["deter"] ?? '',
            cuisine:
                "${_docData['cuisine'][0].toUpperCase()}${_docData['cuisine'].substring(1)}" ??
                    '',
            meal_type: _docData["meal_type"] ?? '',
            images: _docData['images'] ?? '',
            description: _docData["description"] ?? '',
            recipe: _docData["recipe"] ?? '',
            ingredients: _ingredients ?? [],
            servings: _docData["serving"] ?? '',
            time: _docData["time"] ?? '',
            nutrients: _docData["nutrients"] ?? '',
            taste: _docData["taste"] ?? '',
            situation: _docData["situation"] ?? '',
            preparation: _preparation ?? [],
            calories: _docData["calories"] ?? '',
            fat: _docData["fat"] ?? '',
            carbohydrates: _docData["carbohydrates"] ?? '',
            protein: _docData["protein"] ?? '',
            mood: _docData["mood"] ?? '',
            delivery: _docData["delivery"] ?? '',
            sr_no: _docData["sr_no"] ?? '');
      }).toList());
    }

    List<FoodListModel> recentDocs = await listFromSnapshot(recent);

    return recentDocs;
  }
}
