import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens//Restaurants/booking.dart';
import 'package:moodish_mvp/screens//Restaurants/dineout.dart';
import 'package:moodish_mvp/screens//Restaurants/pickup.dart';
import 'package:moodish_mvp/screens//Restaurants/toprated.dart';

class Restaurant extends StatefulWidget {
  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.blueAccent]
                          )
                        ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment(0.0, 0.0),
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Hungry, Pradyum?',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Icon(Icons.location_on),
                            ),
                            SizedBox(width: 5.0,),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                'Mumbai, Maharashtra',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
//                          color: Colors.white,
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child:  Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  height: 200.0,
                                  width: 150.0,
                                  child: RaisedButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return DineOut();
                                        }));

                                      },
                                      color: Colors.deepPurpleAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20.0)),
                                      child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(top: 20.0),
                                                child: Icon(
                                                  Icons.restaurant,
                                                  size: 75,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  'Dineout',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Container(
                                                  child: Text(
                                                    '10+ Options',
                                                    style: TextStyle(color: Colors.white),
                                                  ))
                                            ],
                                          )))),
                            ],
                          )),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                          height: 200.0,
                          width: 150.0,
                          child: RaisedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return Booking();
                                }));
                              },
                              color: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(top: 20.0),
                                        child: Icon(
                                          Icons.calendar_today,
                                          size: 125.0,
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Booking',
                                          style: TextStyle(
                                              fontSize: 20.0, color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                          child: Text(
                                            '9+ Options',
                                            style: TextStyle(color: Colors.white),
                                          ))
                                    ],
                                  )))),
                    ),
                    SizedBox(width: 10.0,)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Flexible(
                      flex: 1,
                      child: Container(
                          padding: EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Container(
                                  height: 200.0,
                                  width: 150.0,
                                  child: RaisedButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return PickUp();
                                        }));
                                      },
                                      color: Colors.redAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20.0)),
                                      child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(top: 20.0),
                                                child: Icon(
                                                  Icons.location_on,
                                                  size: 125.0,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  'Pick Up',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Container(
                                                  child: Text(
                                                    '12+ Options',
                                                    style: TextStyle(color: Colors.white),
                                                  ))
                                            ],
                                          )))),
                            ],
                          )),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                          height: 200.0,
                          width: 150.0,
                          child: RaisedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return TopRated();
                                }));
                              },
                              color: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(top: 20.0),
                                        child: Icon(
                                          Icons.stars,
                                          size: 125.0,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Top Rated',
                                          style: TextStyle(
                                              fontSize: 20.0, color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                          child: Text(
                                            '5+ Options',
                                            style: TextStyle(color: Colors.white),
                                          ))

                                    ],
                                  )))),
                    ),
                    SizedBox(width: 10.0,)

                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    ));
  }
}
