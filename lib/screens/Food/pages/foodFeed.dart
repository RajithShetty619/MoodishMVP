import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/components/Every_Situation.dart';
import 'package:moodish_mvp/screens/Food/components/foodMood.dart';
import 'package:moodish_mvp/screens/Food/components/maFeed.dart';
import 'package:moodish_mvp/screens/Food/myFeed/all.dart';
import 'package:moodish_mvp/screens/Food/myFeed/foodft.dart';
import 'package:moodish_mvp/screens/Food/myFeed/polls.dart';
import 'package:moodish_mvp/screens/Food/myFeed/recipe.dart';
import 'package:moodish_mvp/screens/Food/pages/explore.dart';

class FoodFeed extends StatefulWidget {
  @override
  _FoodFeedState createState() => _FoodFeedState();
}

class _FoodFeedState extends State<FoodFeed> {


  int indx = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  if(index==0)
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
                                  border: Border.all(
                                      color: Colors.black, width: 2),
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
                              child: Text('Happy',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            SizedBox(width: 5)
                          ],
                        ),
                        Padding(
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
                      if (indx == 0)
                      Column(
                        children: <Widget>[
                          ListView.builder(
                              itemCount: 8,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context , index){
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      shape:
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 300.0,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30.0),
                                              image: DecorationImage(
                                                  image: AssetImage('assets/Salty.jpg'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Container(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                       'Chips n Salt',
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold, fontSize: 22.0),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10.0),
                                                    child: Container(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text('Indian-Cheap-10 mins')),
                                                  ),
                                                  SizedBox(
                                                    height: 2.0,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                                                    child: Container(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text('Name')),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: FlatButton(
                                                  onPressed: () {},
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(20),
                                                    child: Container(
                                                      margin: EdgeInsets.all(8.0),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.black, width: 2),
                                                        borderRadius: BorderRadius.circular(300),
                                                      ),
                                                      // color: Colors.blue[300],
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons.arrow_forward,
                                                          color: Colors.black,
                                                          size: 30,
                                                        ),
                                                        onPressed: () {},
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                      
                      if(indx == 1)
                      Container(height: 430, child: RecipeTab()),

                      if(indx == 2)
                      Container(height: 300, child: PollTabs()),

                      if(indx == 3)
                      Container(height: 450, child: FoodftTab()),
                    ],
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
