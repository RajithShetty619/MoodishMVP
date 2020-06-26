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
import 'package:moodish_mvp/test.dart';

// import 'package:intl/intl.dart';

class FoodHome extends StatefulWidget {
  @override
  _FoodHomeState createState() => _FoodHomeState();
}

class _FoodHomeState extends State<FoodHome> {
  ScrollController _scrollController = ScrollController();
  bool _getFoodCalled = false;
  bool loadingData = false;
  @override
  void initState() {
    super.initState(); 
    if (!_getFoodCalled) {
      DatabaseQuery()
          .getFood(context)
          .then((future) => _getFoodCalled = future);
    }
    _scrollController.addListener(() {
      double _maxScroll = _scrollController.position.maxScrollExtent;
      double _currentScroll = _scrollController.position.pixels;
      double _delta = MediaQuery.of(context).size.height * .25;

      if (_maxScroll - _currentScroll < _delta && loadingData == false) {
        loadingData = true;
        DatabaseQuery()
            .getMoreFood(context)
            .then((future) => loadingData = future);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // DateTime now = DateTime.now();
    // String day = DateFormat('MMMMEEEEd').format(now);

    return Scaffold(
      // backgroundColor: Colors.grey[100],
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[100],
      //   elevation: 0,
      //   brightness: Brightness.light,
      //   // title: Text(
      //   //   'Hello Username,\nHungry yet?',
      //   //     style: TextStyle(
      //   //       fontSize: 20,
      //   //       color: Colors.indigo[600],
      //   //       fontWeight: FontWeight.bold,
      //   //   ),
      //   // ),
      // ),
      body: Container(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Hello Username,\nHungry yet?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                                      'Today`s Special',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return TodaySpecial(
                                          image: 'assets/img.jpg',
                                          descrip1: 'food 0',
                                          descrip2: 'desc');
                                    }),
                                //     TodaySpecial(
                                //         image: 'assets/img.jpg',
                                //         descrip1: 'food 1',
                                //         descrip2: 'description'),
                                //     TodaySpecial(
                                //         image: 'assets/img.jpg',
                                //         descrip1: 'food 2',
                                //         descrip2: 'description'),
                                //     TodaySpecial(
                                //         image: 'assets/img.jpg',
                                //         descrip1: 'food 3',
                                //         descrip2: 'description'),
                                //     TodaySpecial(
                                //         image: 'assets/img.jpg',
                                //         descrip1: 'food 4',
                                //         descrip2: 'description'),
                                //   ],
                                // ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            height: 30,
                            width: 220,
                            color: Colors.grey[350],
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Browse By Meal Type',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          // color: Colors.grey[300],
                          height: 200,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return MealType(
                                    image: 'assets/img.jpg',
                                    types: 'breakfast');
                              }),
                          // child: ListView(
                          //   scrollDirection: Axis.horizontal,
                          //   children: <Widget>[
                          //     MealType(
                          //         image: 'assets/img.jpg', types: 'breakfast'),
                          //     MealType(image: 'assets/img.jpg', types: 'lunch'),
                          //     MealType(
                          //         image: 'assets/img.jpg', types: 'snacks'),
                          //     MealType(
                          //         image: 'assets/img.jpg', types: 'dinner'),
                          //   ],
                          // ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            height: 30,
                            width: 220,
                            color: Colors.grey[350],
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Food for Every Taste',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              EveryTaste(
                                title: 'Happy',
                                isActive: true,
                                press: () {},
                              ),
                              EveryTaste(
                                title: 'Happy',
                                isActive: false,
                                press: () {},
                              ),
                              EveryTaste(
                                title: 'Happy',
                                isActive: false,
                                press: () {},
                              ),
                              EveryTaste(
                                title: 'Happy',
                                isActive: false,
                                press: () {},
                              ),
                              EveryTaste(
                                title: 'Happy',
                                isActive: false,
                                press: () {},
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
                              itemBuilder: (BuildContext context, int index) {
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
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            height: 30,
                            width: 250,
                            color: Colors.grey[350],
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Food for Every Situation',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              EverySituation(
                                title: 'Happy',
                                isActive: true,
                                press: () {},
                              ),
                              EverySituation(
                                title: 'Happy',
                                isActive: false,
                                press: () {},
                              ),
                              EverySituation(
                                title: 'Happy',
                                isActive: false,
                                press: () {},
                              ),
                              EverySituation(
                                title: 'Happy',
                                isActive: false,
                                press: () {},
                              ),
                              EverySituation(
                                title: 'Happy',
                                isActive: false,
                                press: () {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 300,
                          child: BlocConsumer<FoodBloc,Map<String, List<FoodListModel>>>(
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
                              return Column(
                                children: <Widget>[
                                  Expanded(
                                    child: ListView.builder(
                                      controller: _scrollController,
                                      scrollDirection: Axis.vertical,
                                      itemCount: foodList["0"].length,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          elevation: 2.0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                foodList['0'][index].description),
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
