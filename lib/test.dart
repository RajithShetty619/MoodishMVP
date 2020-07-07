import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/Services/storage.dart';
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
    return FutureBuilder<Box>(
      future: Hive.openBox('foodlist'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return BlocProvider<FoodBloc>(
            create: (context) => FoodBloc(),
            child: Scaffold(
              body: FoodList(),
            ),
          );
        }
        return Scaffold();
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
  final CollectionReference _ref = Firestore.instance.collection('food');
  String _lastDocument;
  ScrollController _scrollController = ScrollController();

  getFood({String listName, List<String> field, List<String> value}) async {
    setState(() {
      loadingData = true;
    });
    String _orderVal = field[0];
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

    final _box = Hive.box('foodlist');
    List<dynamic> _gfoodList = await _box.get(listName);
    if (_gfoodList == null) { 
      

      Query q =
          recQuery(field, value, _ref.where('description', isGreaterThan: ''))
              .orderBy('description')
              .limit(10);
       
      QuerySnapshot snapshot = await q.getDocuments();
      List<FoodListModel> queryList =
          await DatabaseService().listFromSnapshot(snapshot);
      BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(queryList, "0"));
      setState(() {
        print("$_lastDocument" + "doc");
        loadingData = false;
        _lastDocument = queryList[queryList.length - 1].description;
      });
    } else {
      List<FoodListModel> _foodList = _gfoodList.cast<FoodListModel>();
      BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(_foodList, "0"));
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

      Query q = _ref
          .where("Description", isGreaterThan: " ")
          .startAfter([_lastDocument])
          .orderBy('Description')
          .limit(5);
      QuerySnapshot snapshot = await q.getDocuments();
      List<FoodListModel> queryList =
          await DatabaseService().listFromSnapshot(snapshot);
      BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(queryList, "0"));

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
  void initState() {
    super.initState();
    getFood(listName: "0", field: ['cuisine'], value: ['indian']);

    _scrollController.addListener(() {
      double _maxScroll = _scrollController.position.maxScrollExtent;
      double _currentScroll = _scrollController.position.pixels;
      double _delta = MediaQuery.of(context).size.height * .25;

      if (_maxScroll - _currentScroll < _delta && loadingData == false) {
        // getMoreFood();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodBloc, Map<String, List<FoodListModel>>>(
      buildWhen: (Map<String, List<FoodListModel>> previous,
          Map<String, List<FoodListModel>> current) {
        return true;
      },
      listenWhen: (Map<String, List<FoodListModel>> previous,
          Map<String, List<FoodListModel>> current) {
        if (current.length > previous.length) {
          return true;
        }
        return false;
      },
      builder: (context, foodList) {
        List<String> urlList = Storage().listUrl(foodList["0"]);
        return Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: foodList["0"].length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    elevation: 2.0,
                    child: Column(
                      children: <Widget>[
                        Text(foodList["0"][index].foodName),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                              imageUrl: foodList["0"][index].images,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  height: 200.0,
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      )),
                                );
                              }),
                        ),
                      ],
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
/* Image.network(
                        urlList[index],
                        fit: BoxFit.fill,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        },
                      ), */
