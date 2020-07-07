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

// import 'package:intl/intl.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
  Explore(key) : super(key: key);
}

class _ExploreState extends State<Explore> with AutomaticKeepAliveClientMixin {
  bool keepAlive = false;

  Future doAsyncStuff() async {
    keepAlive = true;
    updateKeepAlive();
    // Keeping alive...

    await Future.delayed(Duration(seconds: 10));

    keepAlive = false;
    updateKeepAlive();
    // Can be disposed whenever now.
  }

  @override
  bool get wantKeepAlive => keepAlive;

  int indx = 0;

  int _selected = 1;

  ScrollController _scrollController = ScrollController();
  ScrollController _scrollController1 = ScrollController();
  ScrollController _scrollController2 = ScrollController();
  bool _getFoodCalled = false;
  bool loadingData = false;
  bool loadingData1 = false;
  bool loadingData2 = false;
  DatabaseQuery _dq = new DatabaseQuery(listName: "0",field: ['taste'],value: ['Sweet']);

  @override
  void initState() {
    super.initState();
    doAsyncStuff();
    print("inti");
    if (!_getFoodCalled) {
      _dq.getFood(context).then((future) {
        BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "0"));
        setState(() {
          _getFoodCalled = true;
        });
      });
    }
    // _scrollController.addListener(() {
    //   double _maxScroll = _scrollController.position.maxScrollExtent;
    //   double _currentScroll = _scrollController.position.pixels;
    //   double _delta = MediaQuery.of(context).size.height * .25;
    //   if (_maxScroll - _currentScroll < _delta && loadingData == false) {
    //     print("scrool");
    //     loadingData = true;
    //     _dq.getMoreFood(context).then((future) {
    //       BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "0"));
    //       setState(() {
    //         loadingData = false;
    //       });
    //     });
    //     print(loadingData);
    //   }
    // });
    _scrollController1.addListener(() {
      double _maxScroll = _scrollController1.position.maxScrollExtent;
      double _currentScroll = _scrollController1.position.pixels;
      double _delta = MediaQuery.of(context).size.height * .25;
      if (_maxScroll - _currentScroll < _delta && loadingData1 == false) {
        print("scrool");
        loadingData1 = true;
        _dq.getMoreFood(context).then((future) {
          BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "0"));
          setState(() {
            loadingData1 = false;
          });
        });
        print(loadingData1);
      }
    });
    // _scrollController2.addListener(() {
    //   double _maxScroll = _scrollController2.position.maxScrollExtent;
    //   double _currentScroll = _scrollController2.position.pixels;
    //   double _delta = MediaQuery.of(context).size.height * .25;
    //   if (_maxScroll - _currentScroll < _delta && loadingData2 == false) {
    //     print("scrool");
    //     loadingData2 = true;
    //     _dq.getMoreFood(context).then((future) {
    //       BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "0"));
    //       setState(() {
    //         loadingData2 = false;
    //       });
    //     });
    //     print(loadingData2);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // DateTime now = DateTime.now();
    // String day = DateFormat('MMMMEEEEd').format(now);
    super.build(context);
    return Container(
      child: SafeArea(
        child: new Stack(
          children: <Widget>[
            // CurvedShape(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 8.0),
                      //       child: Text(
                      //         'Hello Username,\n Hungry yet?',
                      //         style: TextStyle(
                      //           fontSize: 25,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 20,
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
                            Expanded(
                              child: BlocConsumer<FoodBloc,
                                  Map<String, List<FoodListModel>>>(
                                buildWhen: (Map<String, List<FoodListModel>>
                                        previous,
                                    Map<String, List<FoodListModel>> current) {
                                      final _box = Hive.box('foodlist');
                                       _box.put( "0", current["0"] );
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
                                          controller: _scrollController1,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: foodList["0"].length,
                                          itemBuilder: (BuildContext context,
                                               index) {
                                            return TodaySpecial(
                                              image: 'assets/img.jpg' ,
                                              descrip1:
                                                  foodList['0'][index].foodName,
                                              descrip2:
                                                  foodList['0'][index].cuisine,
                                            );
                                          },
                                        ),
                                      ),
                                      if (loadingData1)
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
                      SizedBox(height: 20),
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
                            MealType(
                                image: 'assets/img.jpg', types: 'breakfast'),
                            MealType(image: 'assets/img.jpg', types: 'lunch'),
                            MealType(image: 'assets/img.jpg', types: 'snacks'),
                            MealType(image: 'assets/img.jpg', types: 'dinner'),
                          ],
                        ),
                        // child: BlocConsumer<FoodBloc,Map<String, List<FoodListModel>>>(
                        //   buildWhen: (Map<String, List<FoodListModel>> previous,
                        //       Map<String, List<FoodListModel>> current) {
                        //     return true;
                        //   },
                        //   listenWhen: (Map<String, List<FoodListModel>> previous,
                        //       Map<String, List<FoodListModel>> current) {
                        //     if (current.length > previous.length) {
                        //       return true;
                        //     }
                        //     return false;
                        //   },
                        //   builder: (BuildContext context, foodList) {
                        //     return Row(
                        //       children: <Widget>[
                        //         Expanded(
                        //           child: ListView.builder(
                        //             controller: _scrollController2,
                        //             scrollDirection: Axis.horizontal,
                        //             itemCount: foodList["0"].length,
                        //             itemBuilder: (BuildContext context,int index) {
                        //               return General(
                        //                 image: 'assets/img1.jpg',
                        //                 title: foodList['0'][index].foodName,
                        //                 desc: foodList['0'][index].cuisine
                        //               );
                        //             },
                        //           ),
                        //         ),
                        //         if (loadingData2)
                        //           Container(
                        //             color: Colors.brown[100],
                        //             child: Center(
                        //               child: SpinKitChasingDots(
                        //                 color: Colors.brown,
                        //                 size: 50.0,
                        //               ),
                        //             ),
                        //           )
                        //       ],
                        //     );
                        //   },
                        //   listener: (context, foodList) {
                        //     Scaffold.of(context).showSnackBar(
                        //       SnackBar(content: Text('Added!')),
                        //     );
                        //   },
                        // ),
                        // ListView.builder(
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: 5,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return General(
                        //         image: 'assets/img1.jpg', title: 'food', desc: 'description'
                        //       );
                        //     }),
                      ),
                      SizedBox(height: 20),
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
                                    title: "bitter",
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
                                  child: EveryTaste(
                                    title: "sweet",
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
                                  child: EveryTaste(
                                    title: "salty",
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
                                  child: EveryTaste(
                                    title: "sour",
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
                                GestureDetector(
                                  child: EveryTaste(
                                    title: "umami",
                                    // isActive: true,
                                    index: indx,
                                    stIndex: 4,
                                    press: () {},
                                  ),
                                  onTap: () {
                                    setState(() {
                                      indx = 4;
                                    });
                                  },
                                ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 20),
                      Container(
                        // color: Colors.grey[300],
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, index) {
                              return FoodEveryTaste(
                                  image: 'assets/img.jpg',
                                  title: 'food1',
                                  desc: 'description');
                            }),
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
                                    title: 'Happy',
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
                                    title: 'sad',
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
                                    title: 'Happy',
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
                                  child: EverySituation(
                                    title: 'Happy',
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
                                GestureDetector(
                                  child: EverySituation(
                                    title: 'Happy',
                                    // isActive: true,
                                    index: indx,
                                    stIndex: 4,
                                    press: () {},
                                  ),
                                  onTap: () {
                                    setState(() {
                                      indx = 4;
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
                                Expanded(
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: foodList["0"].length,
                                    itemBuilder:
                                        (BuildContext context,  index) {
                                      return FoodEverySituation(
                                        image: 'assets/Coffee.jpg',
                                        title: foodList['0'][index].foodName,
                                        desc: foodList['0'][index].foodDeter,
                                      );
                                      // return Card(
                                      //   margin: EdgeInsets.symmetric(
                                      //       vertical: 5, horizontal: 10),
                                      //   elevation: 2.0,
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.all(8.0),
                                      //     child: Text(
                                      //         foodList['0'][index].description),
                                      //   ),
                                      // );
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
