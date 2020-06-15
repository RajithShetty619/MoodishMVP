import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/components/Every_Situation.dart';
import 'package:moodish_mvp/screens/Food/components/Every_Taste.dart';
import 'package:moodish_mvp/screens/Food/components/Food_Situation.dart';
import 'package:moodish_mvp/screens/Food/components/Food_Taste.dart';
import 'package:moodish_mvp/screens/Food/components/MealType.dart';
import 'package:moodish_mvp/screens/Food/components/TodaySpecial.dart';

// import 'package:intl/intl.dart';


class FoodHome extends StatefulWidget {
  @override
  _FoodHomeState createState() => _FoodHomeState();
}

class _FoodHomeState extends State<FoodHome> {
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
      body: SafeArea(      
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Hello Username,\nHungry yet?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          SizedBox(height: 20,),
                          Container(
                            height: 380,
                            // color: Colors.blue,
                            child: Row(
                              children: <Widget>[
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 7),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('Today`s Special',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      TodaySpecial(image: 'assets/img.jpg', descrip1: 'food 1', descrip2: 'description'),
                                      TodaySpecial(image: 'assets/img.jpg', descrip1: 'food 2', descrip2: 'description'),
                                      TodaySpecial(image: 'assets/img.jpg', descrip1: 'food 3', descrip2: 'description'),
                                      TodaySpecial(image: 'assets/img.jpg', descrip1: 'food 4', descrip2: 'description'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
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
                          SizedBox(height: 20),
                          Container(
                            color: Colors.grey[300],
                            
                            height: 200,
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
                          SizedBox(height: 20),
                          Container(
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
                            color: Colors.grey[300],
                            
                            height: 300,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                FoodEveryTaste(image: 'assets/img.jpg', title: 'food1', desc: 'description'),
                                FoodEveryTaste(image: 'assets/img.jpg', title: 'food2', desc: 'description'),
                                FoodEveryTaste(image: 'assets/img.jpg', title: 'food3', desc: 'description'),
                                FoodEveryTaste(image: 'assets/img.jpg', title: 'food4', desc: 'description'),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
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
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                FoodEverySituation(image: 'assets/img.jpg', title: 'food1', desc: 'description'),
                                FoodEverySituation(image: 'assets/img.jpg', title: 'food2', desc: 'description'),
                                FoodEverySituation(image: 'assets/img.jpg', title: 'food3', desc: 'description'),
                                FoodEverySituation(image: 'assets/img.jpg', title: 'food4', desc: 'description'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}










