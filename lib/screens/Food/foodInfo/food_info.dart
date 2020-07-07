import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/foodDelivery.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/foodabout.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/foodrecipe.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/restaurantTab.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/tabs_info.dart';

class Food_Info extends StatefulWidget {
  @override
  _Food_InfoState createState() => _Food_InfoState();
}

class _Food_InfoState extends State<Food_Info> {
  int indx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                if (index == 0)
                  Column(
                    children: <Widget>[
                      Container(
                        height: 300.0,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)),
                          image: DecorationImage(
                              image: AssetImage('assets/Coffee.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Tiramisu',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\u20B9400',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Divider(
                          thickness: 2.0,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          f_desc(title: 'Hello'),
                          f_desc(title: 'Hello'),
                          f_desc(title: 'Hello'),
                          f_desc(title: 'Hello'),
                          
                          SizedBox(
                            width: 5.0,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Indian-Cheap-10 mins',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              child: PageTab(
                                title: 'about',
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
                              child: PageTab(
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
                              child: PageTab(
                                title: 'Restaurants',
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
                              child: PageTab(
                                title: 'Delivery',
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
                      if (indx == 0)
                        Container(height: 700, child: FoodAbout()),
                      if (indx == 1)
                        Container(height: 800, child: FoodRecipe()),
                      if (indx == 2)
                        Container(height: 800, child: RestaurantTab()),
                      if (indx == 3)
                        Container(height: 800, child: FoodDelivery()),
                    ],
                  ), //whatever gets repeated using index write down here
              ],
            );
          },
        ),
      ),
    );
  }
  Widget f_desc ({title}){
    return  GestureDetector(
              onTap: () {}, //category
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            );
  }
}
