import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

class FoodFeed extends StatefulWidget {
  @override
  _FoodFeedState createState() => _FoodFeedState();
}

class _FoodFeedState extends State<FoodFeed> {
  bool _getFoodCalled = false;
  bool _loadingData= false;
  bool loadingData1 = false;
  bool loadingData2 = false;
  DatabaseQuery _dq = DatabaseQuery(listName: "0");
  int indx = 1;
  @override
  void initState() {
    super.initState();
    print("inti");
    if (!_getFoodCalled) {
      _dq.getFood(field: ['taste'], value: ['Sweet']).then((future) {
        BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "0"));
        setState(() {
          _getFoodCalled = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
          child: Stack(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 300,
                child: BlocConsumer<FoodBloc, Map<String, List<FoodListModel>>>(
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
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: foodList["0"].length + 1,
                        itemBuilder: (BuildContext context, index) {
                          if (foodList["0"].length != index && foodList.isNotEmpty)
                            return Mood_Food(
                              image: 'assets/Chocolate.jpg',
                              descrip1: foodList["0"][index].description,
                              descrip2: foodList["0"][index].foodName,
                            );
                          else {
                            return !_loadingData && foodList.length>0
                                ? Center(
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 30,
                                          color: !_loadingData
                                              ? Colors.blue[300]
                                              : Colors.black,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _loadingData = true;
                                          });
                                          await _dq.getMoreFood(
                                              field: ['taste'],
                                              value: ['Sweet']).then((future) {
                                            BlocProvider.of<FoodBloc>(context)
                                                .add(FoodEvent.add(future, "0"));
                                            setState(() {
                                              _loadingData = false;
                                            });
                                          });
                                        }),
                                  )
                                : Center(
                                    child: SpinKitFadingCircle(
                                        color: Colors.blue[300], size: 30.0),
                                  );
                          }
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

              Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
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
                        'Top 10 for Your Mood',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 60,
                  child: Text('Happy',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(width: 5)
              ],
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
                  GestureDetector(
                    child: Feeed(
                      title: 'All',
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
          ]),
      Column(
        children: <Widget>[
          // if (indx == 0)
          // Expanded( child: AllTabs()),

          if (indx == 1)
            Container(height: 430, child: RecipeTab()),

          if (indx == 2)
            Container(height: 300, child: PollTabs()),

          if (indx == 3)
            Container(height: 450, child: FoodftTab()),
        ],
      ),
        
            ],
          )
        ],
      ),
    );
  }
}
