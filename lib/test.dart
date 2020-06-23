import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/screens/Food/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';
import 'package:provider/provider.dart'; 
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<FoodBloc>(create: (context)=>FoodBloc(),
      child: Scaffold(body: FoodList(),),
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
  DocumentSnapshot _lastDocument;
  ScrollController _scrollController = ScrollController();

  getFood() async {
    setState(() {
      loadingData = true;
    });
    Query q = _ref.where("Description",isGreaterThan: " " ).orderBy('Description').limit(10);
    QuerySnapshot snapshot = await q.getDocuments();
    BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(snapshot.documents));
    setState(() {
      print("$_lastDocument" + "doc");
      loadingData = false;
      _lastDocument = snapshot.documents[snapshot.documents.length-1];
    });
  }

  getMoreFood() async {
    print("getMoreFood");
    if (dataExists && !loadingData) {
      setState(() {
        loadingData = true;
      });
      print("getFood");

      Query q = _ref.where("Description",isGreaterThan: " " ).startAfter([_lastDocument.data["Description"]]).orderBy('Description').limit(5);
      QuerySnapshot snapshot = await q.getDocuments();
      BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(snapshot.documents));
      setState(() {
        loadingData = false;
        _lastDocument = snapshot.documents[snapshot.documents.length-1];
      });
      if (snapshot.documents.length == 0) {
        dataExists = false;
        print("no data");
      }
    }
  }

  @override
  void initState() { 
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

    return BlocConsumer<FoodBloc, List<DocumentSnapshot>>(
        buildWhen:
            (List<DocumentSnapshot> previous, List<DocumentSnapshot> current) {
          return true;
        },
        listenWhen:
            (List<DocumentSnapshot> previous, List<DocumentSnapshot> current) {
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
                        child: Text(foodList[index].data["Description"]),
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
          },);
  }
}
