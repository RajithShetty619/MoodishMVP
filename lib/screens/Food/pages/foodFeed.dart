import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/components/Every_Situation.dart';
import 'package:moodish_mvp/screens/Food/components/foodMood.dart';
import 'package:moodish_mvp/screens/Food/components/maFeed.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';
import 'package:moodish_mvp/screens/Food/myFeed/all.dart';
import 'package:moodish_mvp/screens/Food/myFeed/foodft.dart';
import 'package:moodish_mvp/screens/Food/myFeed/polls.dart';
import 'package:moodish_mvp/screens/Food/myFeed/recipe.dart';
import 'package:moodish_mvp/screens/Food/bloc/foodBloc.dart';

import 'package:intl/intl.dart';
import 'package:moodish_mvp/screens/Restaurants/mood.dart';

class FoodFeed extends StatefulWidget {
  final int number;
  final String mood;

  FoodFeed({Key key, this.mood, this.number}) : super(key: key);

  @override
  _FoodFeedState createState() => _FoodFeedState();
}

class _FoodFeedState extends State<FoodFeed> {
  int numbr;
  bool _getFoodCalled = false;
  bool loadingData1 = false;
  bool loadingData2 = false;
  DatabaseQuery _dq = DatabaseQuery(listName: "0");
  DatabaseQuery _dqtaste2 = DatabaseQuery(listName: "t2");
  int indx = 1;
  @override
  void initState() {
    super.initState();
    if (!_getFoodCalled) {
      print(widget.mood);
      print("////////////////////////");
      checkDate().then((check) {
        _dq.getFood(
            field: ['mood'],
            value: [widget.mood],
            limit: 10,
            check: check).then((future) {
          BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "0"));
        });
        _dqtaste2.getFood(
            field: ['cuisine'],
            value: ['indian'],
            limit: 7,
            check: check).then((future) {
          BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "t2"));
        });
      });
      setState(() {
        _getFoodCalled = true;
      });
    }

    Random random = new Random();
    int randomNumber = random.nextInt(3);
    print(
        '/////////////////////////////////////////////////////////////////////////////////');
    print(randomNumber);
    setState(() {
       numbr = randomNumber;
    });
  }

  Future<int> checkDate() async {
    Box _box = await Hive.openBox("date");
    String saveDate = await _box.get("date");
    DateTime now = DateTime.now();
    String date = DateFormat('EEE, M/d/y').format(now);
    if (date == saveDate) {
      return 0;
    } else {
      _box.put("date", date);
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: Container(
                        width: 250.0,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(15),
                          // color: Colors.blue[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Top 10 for Your Mood',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 30,
                        width: 60,
                        child: Center(
                          child: Text('Happy',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(width: 5)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 350,
                  child:
                      BlocConsumer<FoodBloc, Map<String, List<FoodListModel>>>(
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
                    builder: (BuildContext context, foodList) {
                      return Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: foodList["0"].length,
                          itemBuilder: (BuildContext context, index) {
                            return Mood_Food(
                              foodList: foodList["0"][index],
                            );
                          },
                        ),
                      );
                    },
                    listener: (context, foodList) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Added!')),
                      );
                    },
                  ),
                ),
              ),
              /*   Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 350,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return Mood_Food(
                                    image: 'assets/Chocolate.jpg',
                                    descrip1: 'food',
                                    descrip2: 'desc');
                              }),
                        ),
                      ), */
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  width: 120.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(15),
                    // color: Colors.blue[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'My Feed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // GestureDetector(
                    //   child: Feeed(
                    //     title: 'All',
                    //     // isActive: true,
                    //     index: indx,
                    //     stIndex: 0,
                    //     press: () {},
                    //   ),
                    //   onTap: () {
                    //     setState(() {
                    //       indx = 0;
                    //     });
                    //   },
                    // ),
                    GestureDetector(
                      child: Feeed(
                        title: 'Recipe',
                        // isActive: true,
                        index: indx,
                        stIndex: 1,
                        press: () {},
                      ),
                      onTap: () {
                        setState(() {
                          indx = 1;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Feeed(
                        title: 'Polls',
                        // isActive: true,
                        index: indx,
                        stIndex: 2,
                        press: () {},
                      ),
                      onTap: () {
                        setState(() {
                          indx = 2;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Feeed(
                        title: 'Food For Thought',
                        // isActive: true,
                        index: indx,
                        stIndex: 3,
                        press: () {},
                      ),
                      onTap: () {
                        setState(() {
                          indx = 3;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  // if (indx == 0)
                  // Expanded( child: AllTabs()),

                  if (indx == 1)
                    Container(
                      child: BlocConsumer<FoodBloc,
                          Map<String, List<FoodListModel>>>(
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
                        builder: (BuildContext context, foodList) {
                          return Container(
                            child: ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: foodList["t2"].length,
                              itemBuilder: (BuildContext context, index) {
                                return RecipeTab(
                                  foodList: foodList["t2"][index],
                                );
                              },
                            ),
                          );
                        },
                        listener: (context, foodList) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Added!')),
                          );
                        },
                      ),
                    ),

                  if (indx == 2)
                  // Container(child: YesNoTabs()),
                    Column(
                      children: <Widget>[
                        if (numbr == 0)
                          Container( child: YesNoTabs()),
                        if (numbr == 1)
                          Container( child: PollTabs()),
                        if (numbr == 2)
                          Container( child: This_ThatTabs()),
                      ],
                    ),

                  if (indx == 3)
                    Container( child: FoodftTab()),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

