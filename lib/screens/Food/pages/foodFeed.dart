import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/components/Every_Situation.dart';
import 'package:moodish_mvp/screens/Food/components/foodMood.dart';
import 'package:moodish_mvp/screens/Food/pages/explore.dart';

class FoodFeed extends StatefulWidget {
  @override
  _FoodFeedState createState() => _FoodFeedState();
}

class _FoodFeedState extends State<FoodFeed> {
  final Map<int, Widget> logowidgets = const <int, Widget>{
    0: Text('Feed'),
    1: Text('Explore'),
  };

  int grpValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
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
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                  // color: Colors.blue[200],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Top 10 for Your Mood',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: 60,
                              child: Text(
                                'Happy',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                            ),
                            SizedBox(width: 5)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height:350,

                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (BuildContext context,int index){
                                return Mood_Food(image: 'assets/Chocolate.jpg', descrip1: 'food', descrip2: 'desc');
                              }
                            ),
                          ),
                        ),
                        Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                width: 120.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                  // color: Colors.blue[200],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'My Feed',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
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
                                title: 'All',
                                // isActive: true,
                                index: 0,
                                stIndex: 0,
                                press: (){

                                },
                              ),
                              EverySituation(
                                title: 'Recipe',
                                // isActive: false,
                                index: 1,
                                stIndex: 1,
                                press: (){},
                              ),
                              EverySituation(
                                title: 'Polls',
                                // isActive: false,
                                index: 2,
                                stIndex: 2,
                                press: (){},
                              ),
                              EverySituation(
                                title: 'Food For Thought',
                                // isActive: false,
                                index: 3,
                                stIndex: 3,
                                press: (){},
                              ),
                            ],
                          ),
                        )
                      ]
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

