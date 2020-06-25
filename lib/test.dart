import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/database.dart'; 
import 'package:moodish_mvp/screens/Food/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart'; 
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'models/foodListModel.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box<FoodListModel>>(
      future: Hive.openBox<FoodListModel>('foodList'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold();
        }
        return BlocProvider<FoodBloc>(
          create: (context) => FoodBloc(),
          child: Scaffold(
            body: FoodList(),
          ),
        );
      },
    );
  }
}

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  bool loadingData = false;
  bool dataExists = true;
  // List<DocumentSnapshot> foodList = [];
  final CollectionReference _ref = Firestore.instance.collection('0');
  String _lastDocument;
  ScrollController _scrollController = ScrollController();

  getFood() async {
    setState(() {
      loadingData = true;
    });
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
      setState(() {
        print("$_lastDocument" + "doc");
        loadingData = false;
        _lastDocument = queryList[queryList.length - 1].description;
      });
    } else {
      List<FoodListModel> _foodList = _gfoodList.cast<FoodListModel>();
      BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(_foodList));
      setState(() {
        print("$_lastDocument" + "doc");
        loadingData = false;
        _lastDocument = _foodList[_foodList.length - 1].description;
      });
    }
  }

  getMoreFood() async {
    print("getMoreFood");
    if (dataExists && !loadingData) {
      setState(() {
        loadingData = true;
      });
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

      setState(() {
        loadingData = false;
        _lastDocument = queryList[queryList.length - 1].description;
      });
      if (snapshot.documents.length == 0) {
        dataExists = false;
        print("no data");
      }
    }
  }

  @override
  void initState()  {
    super.initState(); 
    getFood();

    _scrollController.addListener(() {
      double _maxScroll = _scrollController.position.maxScrollExtent;
      double _currentScroll = _scrollController.position.pixels;
      double _delta = MediaQuery.of(context).size.height * .25;

      if (_maxScroll - _currentScroll < _delta && loadingData == false) {
        getMoreFood();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodBloc, List<FoodListModel>>(
      buildWhen: (List<FoodListModel> previous, List<FoodListModel> current) {
        return true;
      },
      listenWhen: (List<FoodListModel> previous, List<FoodListModel> current) {
        if (current.length > previous.length) {
          return true;
        }
        return false;
      },
      builder: (context, foodList) {
        return Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: foodList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(foodList[index].description),
                    ),
                  );
                },
              ),
            ),
            if (loadingData)
              Container(
                color: Colors.brown[100],
                child: Center(
                  child: SpinKitChasingDots(
                    color: Colors.brown,
                    size: 50.0,
                  ),
                ),
              )
          ],
        );
      },
      listener: (BuildContext context, foodList) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Added!')),
        );
      },
    );
  }
}
