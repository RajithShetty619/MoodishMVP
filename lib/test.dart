import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:provider/provider.dart'; 
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<DocumentSnapshot>>.value(
      value: DatabaseQuery().foodQuery,
      child: Scaffold(
        body: FoodList(),
      ),
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
  List<DocumentSnapshot> foodList = [];
  final CollectionReference _ref = Firestore.instance.collection('data');
  DocumentSnapshot _lastDocument;
  ScrollController _scrollController = ScrollController();

  getFood() async {
    setState(() {
      loadingData = true;
    });
    Query q = _ref.orderBy("sr").limit(5);
    QuerySnapshot snapshot = await q.getDocuments();
    foodList = snapshot.documents;
    setState(() {
      _lastDocument = foodList[foodList.length - 1];
      print("$_lastDocument" + "doc");
      loadingData = false;
    });
  }

  getMoreFood() async {
    if (dataExists && !loadingData) {
      setState(() {
        loadingData = true;
      });
      print("getFood");
      Query q =
          _ref.orderBy("sr").startAfter([_lastDocument.data["sr"]]).limit(5);
      QuerySnapshot snapshot = await q.getDocuments();
      foodList.addAll(snapshot.documents);
      setState(() {
        loadingData = false;
        _lastDocument = foodList[foodList.length - 1];
      });
      if (snapshot.documents.length == 0) {
        dataExists = false;
        print("no data");
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
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
    // final foods = Provider.of<List<Food>>(context) ?? [];

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
                  child: Text(foodList[index].data["food_info"]),
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
  }
}
