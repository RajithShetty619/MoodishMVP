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
  List<_Restaurants> rest = [
    _Restaurants(
        image: 'downtown_china.jpg',
        name: 'Downtown China',
        desc:
        'Casual Dining - Chinese, Thai, Asian, Seafood, Momos, Beverages, Desserts \nAndheri Lokhandwala, Andheri West'),
    _Restaurants(
        image: 'family_tree.jpg',
        name: 'Family Tree',
        desc:
        'Casual Dining - Biryani, Chinese, North Indian, Pizza, South Indian, Desserts \nGhatkopar East'),
    _Restaurants(
        image: 'frozen_bottle.jpg',
        name: 'Frozen Bottle',
        desc:
        'Beverage Shop, Dessert Parlor - Beverages, Desserts, Ice Cream \nMatunga East'),
    _Restaurants(
        image: 'irish_house.png',
        name: 'The Irish House',
        desc: 'Pub, Casual Dining - European, American \nLower Parel'),
    _Restaurants(
        image: 'Mainland_China.jpg',
        name: 'Mainland China',
        desc:
        'Casual Dining - Chinese, Asian, Sushi, Japanese, Thai \nSakinaka'),
    _Restaurants(
        image: 'pop_tates.jpg',
        name: 'Pop Tates',
        desc:
        'Bar, Casual Dining - Continental, Chinese, Italian, Beverages \nLower Parel'),
    _Restaurants(
        image: 'tipsy_gipsy.jpg',
        name: 'Tipsy Gipsy',
        desc:
        'Bar, Casual Dining - Continental, Mediterranean, Italian \nVeera Desai Area'),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: SafeArea(
      child: Stack(
        children: <Widget>[
          Column(
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
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
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
                                                      size: 75.0,
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
                                              size: 75.0,
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
                                                      size: 75.0,
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
                                              size: 75.0,
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
                    SizedBox(height: 10.0,),
                    Text('Top Restaurants :',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                      textAlign: TextAlign.left,),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: rest.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Card(
                                child: ListTile(
                                  onTap: () {
                                    debugPrint('tappeed');
                                  },
                                  leading: CircleAvatar(
                                    backgroundImage:
                                    AssetImage('assets/${rest[index].image}'),
                                  ),
                                  title: Text(rest[index].name),
                                  subtitle: Text(rest[index].desc),
                                )));
                      },
                    )

                  ],
                ),
              )

            ],
          )
        ],

      ),
    ),
      );
  }
}

class _Restaurants {
  String image;
  String name;
  String desc;

  _Restaurants({this.image, this.name, this.desc});
}