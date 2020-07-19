import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/components/Every_Situation.dart';
import 'package:moodish_mvp/screens/Food/components/Every_Taste.dart';
import 'package:moodish_mvp/screens/Food/components/Food_Situation.dart';
import 'package:moodish_mvp/screens/Food/components/Food_Taste.dart';
import 'package:moodish_mvp/screens/Food/components/MealType.dart';
import 'package:moodish_mvp/screens/Food/components/TodaySpecial.dart';
import 'package:moodish_mvp/screens/Food/components/foodBG.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';

import 'package:intl/intl.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  bool keepAlive = false;

  /* index used for situation */
  int indx = 0;
  /* index used for taste */
  int indxT = 0; 
  /* dont remember mohit look into it :) */
  int _selected = 1;
  bool _getFoodCalled = false; 

  /* constructor initialised with list name  */
  DatabaseQuery _dq = DatabaseQuery(listName: "0");
  DatabaseQuery _dqtsp = DatabaseQuery(listName: "tsp");
  DatabaseQuery _dqsituation0 = DatabaseQuery(listName: "s0");
  DatabaseQuery _dqsituation1 = DatabaseQuery(listName: "s1");
  DatabaseQuery _dqsituation2 = DatabaseQuery(listName: "s2");
  DatabaseQuery _dqtaste0 = DatabaseQuery(listName: "t0");
  DatabaseQuery _dqtaste1 = DatabaseQuery(listName: "t1");
  DatabaseQuery _dqtaste2 = DatabaseQuery(listName: "t2");

  @override
  void initState() {
    super.initState();
    /* check to run it only once */
    if (!_getFoodCalled) {
      checkDate().then((check) {
        _dqtsp.getFood(
            field: ['cuisine'], value: ['indian'], check: check).then((future) {
          BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "tsp"));
        });
        _dqtaste0.getFood(
            field: ['taste'],
            value: getValue("t0"),
            limit: 7,
            check: check).then((future) {
          BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "t0"));
        });
        _dqtaste1.getFood(
            field: ['taste'],
            value: getValue("t1"),
            limit: 7,
            check: check).then((future) {
          BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "t1"));
        });
       /*  _dqtaste2.getFood(
            field: ['taste'],
            value: getValue("t2"),
            limit: 7,
            check: check).then((future) {
          BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "t2"));
        }); */
        _dqsituation0.getFood(
            field: ['situation'],
            value: getValue("s0"),
            limit: 7,
            check: check).then((future) {
          BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "s0"));
        });
        _dqsituation1.getFood(
            field: ['situation'],
            value: getValue("s1"),
            limit: 7,
            check: check).then((future) {
          BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "s1"));
        });
        _dqsituation2.getFood(
            field: ['situation'],
            value: getValue("s2"),
            limit: 7,
            check: check).then((future) {
          BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "s2"));
        });
      });
      setState(() {
        _getFoodCalled = true;
      });
    }
  }

  /* this function returns 0 if app opened on new day
    and zero if opened on the same day used to update data daily */
  Future<int> checkDate() async {
    Box _box = await Hive.openBox("date");
    String saveDate = await _box.get("date");
    DateTime now = DateTime.now();
    String date = DateFormat('EEE, M/d/y').format(now);
    if (date == saveDate) {
      return 0 ; //change to zero for testing purpose
    } else {
      _box.put("date", date);
      return 0;
    }
  }

  /* used to get value associated with list  */
  List<dynamic> getValue(String _list) {
    switch (_list) {
      case 't0':
        return [
          ["Savory"]
        ];
        break;
      case 't1':
        return [
          ["Sweet"]
        ];
        break;
      // case 't2':
      //   return [["Salty"]];
      //   break;
      case 's0':
        return [
          ["At Home"]
        ];
        break;
      case 's1':
        return [
          ["Romantic"]
        ];
        break;
      case 's2':
        return [
          ["Easy"]
        ];
        break;
      default:
        return ["Savory"];
    }
  }

  bool _loadingData = false;
  @override
  Widget build(BuildContext context) {
    // DateTime now = DateTime.now();
    // String day = DateFormat('MMMMEEEEd').format(now);
    return Container(
      child: SafeArea(
        child: new Stack(
          children: <Widget>[
            CurvedShape(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 380,
                        // color: Colors.blue,
                        child: Row(
                          children: <Widget>[
                            RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 7),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Today's Special",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            /* todays special list display widget */
                            Expanded(
                              child: BlocConsumer<FoodBloc,
                                  Map<String, List<FoodListModel>>>(
                                buildWhen: (Map<String, List<FoodListModel>>
                                        previous,
                                    Map<String, List<FoodListModel>> current) {
                                  return true;
                                },
                                listenWhen: (Map<String, List<FoodListModel>>
                                        previous,
                                    Map<String, List<FoodListModel>> current) {
                                  if (current.length > previous.length) {
                                    return true;
                                  }
                                  return false;
                                },
                                builder: (BuildContext context, foodList) {
                                  return Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: foodList["tsp"].length + 1,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            if (foodList["tsp"].length != index)
                                              return TodaySpecial(
                                                foodList: foodList["tsp"][index],
                                              );
                                            else {
                                              return !_loadingData
                                                  ? Center(
                                                      child: IconButton(
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            size: 30,
                                                            color: !_loadingData
                                                                ? Colors
                                                                    .blue[300]
                                                                : Colors.black,
                                                          ),
                                                          onPressed: () async {
                                                            setState(() {
                                                              _loadingData =
                                                                  true;
                                                            });
                                                            await _dqtsp
                                                                .getMoreFood(
                                                                    field: [
                                                                  'taste'
                                                                ],
                                                                    value: [
                                                                  'Sweet'
                                                                ]).then(
                                                                    (future) {
                                                              BlocProvider.of<
                                                                          FoodBloc>(
                                                                      context)
                                                                  .add(FoodEvent
                                                                      .add(
                                                                          future,
                                                                          "tsp"));
                                                              setState(() {
                                                                _loadingData =
                                                                    false;
                                                              });
                                                            });
                                                          }),
                                                    )
                                                  : Center(
                                                      child:
                                                          SpinKitFadingCircle(
                                                              color: Colors
                                                                  .blue[300],
                                                              size: 30.0),
                                                    );
                                            }
                                          },
                                        ),
                                      ), 
                                    ],
                                  );
                                },
                                listener: (context, foodList) {
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Added!')),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      /*  SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          width: 220.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(15),
                            // color: Colors.blue[200],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Browse By Meal Type',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        // color: Colors.grey[300],
                        height: 180,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            MealType(image: 'assets/img.jpg', types: 'breakfast'),
                            MealType(image: 'assets/img.jpg', types: 'lunch'),
                            MealType(image: 'assets/img.jpg', types: 'snacks'),
                            MealType(image: 'assets/img.jpg', types: 'dinner'),
                          ],
                        ),
                      ),
                      SizedBox(height: 20), */
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          width: 220.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(15),
                            // color: Colors.blue[200],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Food for Every Taste',
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
                            GestureDetector(
                              child: EveryTaste(
                                title: "Savoury",
                                // isActive: true,
                                index: indxT,
                                stIndex: 0,
                                press: () {},
                              ),
                              onTap: () {
                                setState(() {
                                  indxT = 0;
                                });
                              },
                            ),
                            GestureDetector(
                              child: EveryTaste(
                                title: "Sweet",
                                // isActive: true,
                                index: indxT,
                                stIndex: 1,
                                press: () {},
                              ),
                              onTap: () {
                                setState(() {
                                  indxT = 1;
                                });
                              },
                            ),
                            /* GestureDetector(
                              child: EveryTaste(
                                title: "Salty",
                                // isActive: true,
                                index: indxT,
                                stIndex: 2,
                                press: () {},
                              ),
                              onTap: () {
                                setState(() {
                                  indxT = 2;
                                });
                              },
                            ), */
                          ],
                        ),
                      ),
                      // SizedBox(height: 20),
                      Container(
                        // color: Colors.grey[300],
                        height: 300,
                        child: BlocConsumer<FoodBloc,
                            Map<String, List<FoodListModel>>>(
                          buildWhen: (Map<String, List<FoodListModel>> previous,
                              Map<String, List<FoodListModel>> current) {
                            return true;
                          },
                          listenWhen:
                              (Map<String, List<FoodListModel>> previous,
                                  Map<String, List<FoodListModel>> current) {
                            if (current.length > previous.length) {
                              return true;
                            }
                            return false;
                          },
                          builder: (BuildContext context, foodList) {
                            return Row(
                              children: <Widget>[
                                DataListView(foodList: foodList['t$indxT']),
                              ],
                            );
                          },
                          listener: (context, foodList) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Added!')),
                            );
                          },
                          // child: ListView.builder(
                          //   scrollDirection: Axis.horizontal,
                          //   itemCount: 5,
                          //   itemBuilder: (BuildContext context,int index) {
                          //     return FoodEverySituation(
                          //       image: 'assets/img.jpg',
                          //       title: 'food1',
                          //       desc: 'description'
                          //     );
                          //   }
                          // ),
                        ),

                        // child: ListView(
                        //   scrollDirection: Axis.horizontal,
                        //   children: <Widget>[
                        //     FoodEveryTaste(
                        //         image: 'assets/img.jpg',
                        //         title: 'food1',
                        //         desc: 'description'),
                        //     FoodEveryTaste(
                        //         image: 'assets/img.jpg',
                        //         title: 'food2',
                        //         desc: 'description'),
                        //     FoodEveryTaste(
                        //         image: 'assets/img.jpg',
                        //         title: 'food3',
                        //         desc: 'description'),
                        //     FoodEveryTaste(
                        //         image: 'assets/img.jpg',
                        //         title: 'food4',
                        //         desc: 'description'),
                        //   ],
                        // ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          width: 270.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(15),
                            // color: Colors.blue[200],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Food for Every Situation',
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
                            GestureDetector(
                              child: EverySituation(
                                title: 'At Home',
                                // isActive: true,
                                index: indx,
                                stIndex: 0,
                                press: () {},
                              ),
                              onTap: () {
                                setState(() {
                                  indx = 0;
                                });
                              },
                            ),
                            GestureDetector(
                              child: EverySituation(
                                title: 'Romantic',
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
                              child: EverySituation(
                                title: 'Easy',
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
                          ],
                        ),
                      ),
                      Container(
                        height: 300,
                        child: BlocConsumer<FoodBloc,
                            Map<String, List<FoodListModel>>>(
                          buildWhen: (Map<String, List<FoodListModel>> previous,
                              Map<String, List<FoodListModel>> current) {
                            return true;
                          },
                          listenWhen:
                              (Map<String, List<FoodListModel>> previous,
                                  Map<String, List<FoodListModel>> current) {
                            if (current.length > previous.length) {
                              return true;
                            }
                            return false;
                          },
                          builder: (BuildContext context, foodList) {
                            return Row(
                              children: <Widget>[
                                DataListView(foodList: foodList['s$indx']),
                              ],
                            );
                          },
                          listener: (context, foodList) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Added!')),
                            );
                          },
                          // child: ListView.builder(
                          //   scrollDirection: Axis.horizontal,
                          //   itemCount: 5,
                          //   itemBuilder: (BuildContext context,int index) {
                          //     return FoodEverySituation(
                          //       image: 'assets/img.jpg',
                          //       title: 'food1',
                          //       desc: 'description'
                          //     );
                          //   }
                          // ),
                        ),
                        // child: ListView(
                        //   scrollDirection: Axis.horizontal,
                        //   children: <Widget>[
                        //     FoodEverySituation(
                        //         image: 'assets/img.jpg',
                        //         title: 'food1',
                        //         desc: 'description'),
                        //     FoodEverySituation(
                        //         image: 'assets/img.jpg',
                        //         title: 'food2',
                        //         desc: 'description'),
                        //     FoodEverySituation(
                        //         image: 'assets/img.jpg',
                        //         title: 'food3',
                        //         desc: 'description'),
                        //     FoodEverySituation(
                        //         image: 'assets/img.jpg',
                        //         title: 'food4',
                        //         desc: 'description'),
                        //   ],
                        // ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mood({String title, int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            Text(title,
                style: index == _selected
                    ? TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)
                    : TextStyle(color: Colors.grey[400], fontSize: 18)),
            index == _selected
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 3,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class DataListView extends StatelessWidget {
  const DataListView({
    Key key,
    @required this.foodList,
  }) : super(key: key);

  final List<FoodListModel> foodList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foodList.length,
        itemBuilder: (BuildContext context, index) {
          print(foodList[index].foodName);
          return FoodEveryTaste(
            foodList: foodList[index],
          );
        },
      ),
    );
  }
}

class CurvedShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      child: CustomPaint(
        painter: CurvePainter(),
      ),
    );
  }
}
