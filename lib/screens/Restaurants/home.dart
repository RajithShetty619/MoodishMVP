import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Restaurants/booking.dart';
import 'package:moodish_mvp/screens/Restaurants/dineout.dart';
import 'package:moodish_mvp/screens/Restaurants/pickup.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/homepage.dart';
import 'package:moodish_mvp/screens/Restaurants/toprated.dart';
import 'package:geolocator/geolocator.dart';

class Restaurant extends StatefulWidget {
  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  List<_Restaurants> rest = [
    _Restaurants(
        image: 'downtown_china.jpg',
        image1: 'downtown_china1.jpg',
        image2: 'downtown_china2.png',
        name: 'Downtown China',
        desc:
            '\u27A4 Casual Dining - Chinese, Thai, Asian, Seafood, Momos, Beverages, Desserts \n\u2691 Andheri Lokhandwala, Andheri West'),
    _Restaurants(
        image: 'family_tree.jpg',
        image1: 'family_tree1.jpg',
        image2: 'family_tree2.png',
        name: 'Family Tree',
        desc:
            '\u27A4 Casual Dining - Biryani, Chinese, North Indian, Pizza, South Indian, Desserts \n\u2691 Ghatkopar East'),
    _Restaurants(
        image: 'frozen_bottle.jpg',
        image1: 'frozen_bottle1.jpg',
        image2: 'frozen_bottle2.png',
        name: 'Frozen Bottle',
        desc:
            '\u27A4 Beverage Shop, Dessert Parlor - Beverages, Desserts, Ice Cream \n\u2691 Matunga East'),
    _Restaurants(
        image: 'irish_house.png',
        image1: 'irish_house1.png',
        image2: 'irish_house2.png',
        name: 'The Irish House',
        desc:
            '\u27A4 Pub, Casual Dining - European, American \n\u2691 Lower Parel'),
    _Restaurants(
        image: 'Mainland_China.jpg',
        image1: 'Mainland_China.png',
        image2: 'Mainland_China2.jpg',
        name: 'Mainland China',
        desc:
            '\u27A4 Casual Dining - Chinese, Asian, Sushi, Japanese, Thai \n\u2691 Sakinaka'),
    _Restaurants(
        image: 'pop_tates.jpg',
        image1: 'pop_tates1.jpg',
        image2: 'pop_tates2.png',
        name: 'Pop Tates',
        desc:
            '\u27A4 Bar, Casual Dining - Continental, Chinese, Italian, Beverages \n\u2691 Lower Parel'),
    _Restaurants(
        image: 'tipsy_gipsy.jpg',
        image1: 'tipsy_gipsy1.jpg',
        image2: 'tipsy_gipsy2.jpg',
        name: 'Tipsy Gipsy',
        desc:
            '\u27A4 Bar, Casual Dining - Continental, Mediterranean, Italian \n\u2691 Veera Desai Area'),
    _Restaurants(
        image: 'burgerbrasserie.png',
        image1: 'burgerbrasserie1.png',
        image2: 'burgerbresserie2.png',
        name: 'Burger Brasserie',
        desc:
            '\u27A4 Quick Bites - Burger, Fast Food, Beverages \n\u2691 Andheri Lokhandwala, Andheri West'),
    _Restaurants(
        image: 'canto.png',
        image1: 'canto1.png',
        image2: 'canto2.png',
        name: 'Canto- Resto & Bar',
        desc:
            '\u27A4 Casual Dining, Bar - North Indian, Continental, Italian, Lebanese\n\u2691 Lower Parel'),
    _Restaurants(
        image: 'bayview.png',
        image1: 'bayview1.png',
        image2: 'bayview2.png',
        name: 'Bay View',
        desc:
            '\u27A4 Casual Dining - Seafood, North Indian, Chinese\n\u2691 Borivali West'),
    _Restaurants(
        image: 'blackolive.png',
        image1: 'blackolive1.png',
        image2: 'blackolive2.png',
        name: 'Black Olive',
        desc:
            '\u27A4 Healthy Food, Continental, Italian \n\u2691 Oshiwara, Andheri West'),
    _Restaurants(
        image: 'quessoristorante.png',
        image1: 'quessoristorante1.png',
        image2: 'quessoristorante2.png',
        name: 'Quesso Ristorante',
        desc:
            '\u27A4 Casual Dining, Bar - Continental, Mexican, Italian, Mediterranean, Thai, Desserts\n\u2691 Oshiwara, Andheri West'),
    _Restaurants(
        image: 'sevenkitchen.png',
        image1: 'sevenkitchen1.png',
        image2: 'sevenkitchen2.png',
        name: 'Seven Kitchen',
        desc:
            '\u27A4 Fine Dining - Chinese, North Indian, Italian, European, Desserts \n\u2691 Lower Parel'),
    _Restaurants(
        image: 'sincity.png',
        image1: 'sincity1.png',
        image2: 'sincity2.png',
        name: 'Sin City',
        desc:
            '\u27A4 Bar, Casual Dining - Continental, North Indian, Thai, Italian \n\u2691 Andheri Lokhandwala, Andheri West'),
    _Restaurants(
        image: 'silvercoin.png',
        image1: 'silvercoin1.png',
        image2: 'silvercoin2.png',
        name: 'Silver Coin',
        desc:
            '\u27A4 Casual Dining - Continental, North Indian, Chinese, Thai, Ice Cream, Beverages, South Indian, Seafood \n\u2691 Borivali West')
  ];
  Position _currentPosition;
  bool dialogShow = true;
  String location = 'Mumbai,Maharashtra';
  Geolocator geolocator = Geolocator();

  void initState() {
    super.initState();

    getCurrentLocation();
  }

  getCurrentLocation() async {
    geolocator.isLocationServiceEnabled();
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      _currentPosition = position;
    });
    print(position);
  }

  _getAddressFromLatLng() async {
    try {
      setState(() {
        location = 'Wait a Moment...';
      });
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];

      setState(() {
        location = "${place.subLocality},${place.locality}-${place.postalCode}";
      });
      print(location);
    } catch (e) {
      print(e);
    }
  }

  tempRestaurantDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext idcontext) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              height: 135,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'All the Restaurants used here are used as Dummy Data...',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        onPressed: () =>
                            Navigator.of(idcontext, rootNavigator: true).pop(),
                        child: Text('ok'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return dialogShow
        ? Scaffold(
            body: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'The Listed Resturants are for testing purposes only..',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              dialogShow = false;
                            });
                          },
                          child: Text('OK'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Container(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.location_on),
                              onPressed: () => _getAddressFromLatLng(),
                            ),
                            Text(location),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 37,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                              text: 'For Today',
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: []),
                        ),
                      ),
                    ),
                    Container(
                      height: 380,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: rest.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage(
                                    desc: rest[index].desc,
                                    imgName: rest[index].image,
                                    imgName1: rest[index].image1,
                                    imgName2: rest[index].image2,
                                    restName: rest[index].name,
                                  );
                                }));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Column(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            height: 200,
                                            width: 250,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20)),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/${rest[index].image}'),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            child: Container(
                                              height: 200,
                                              width: 250,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                    Colors.transparent,
                                                    Colors.transparent,
                                                    Colors.white
                                                  ])),
                                              child: Column(
                                                children: <Widget>[
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child: Icon(
                                                                Icons.av_timer,
                                                                color: Colors
                                                                    .black,
                                                                size: 28,
                                                              )),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Text(
                                                              '30mins',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors.black,
                                                            size: 28,
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          Text(
                                                            '4.5',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Align(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child: Icon(
                                                                Icons
                                                                    .library_books,
                                                                color: Colors
                                                                    .black,
                                                                size: 22,
                                                              )),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Text(
                                                              'Review',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        width: 250,
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              rest[index].name,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 250,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(rest[index].desc),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                              text: 'Categories',
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: []),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          getCategory('Dine_out.png', 'Dineout', context, 1),
                          SizedBox(
                            width: 10.0,
                          ),
                          getCategory('Booking.png', 'Booking', context, 2),
                          SizedBox(
                            width: 10.0,
                          ),
                          getCategory('Pickup.png', 'Pick Up', context, 3),
                          SizedBox(
                            width: 10.0,
                          ),
                          getCategory('Top_Rated.png', 'Top Rated', context, 4),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                              text: 'Top Restaurant',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                    text: '.',
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pinkAccent))
                              ]),
                        ),
                      ),
                    ),
                    Container(
                      height: 400,
                      child: restura(rest[0].image, rest[0].name, rest[0].desc,
                          rest, context, 1),
                    ),
                    Container(
                      height: 400,
                      child: restura(rest[1].image, rest[1].name, rest[1].desc,
                          rest, context, 2),
                    ),
                    Container(
                      height: 400,
                      child: restura(rest[2].image, rest[2].name, rest[2].desc,
                          rest, context, 3),
                    ),
                    Container(
                      height: 400,
                      child: restura(rest[3].image, rest[3].name, rest[3].desc,
                          rest, context, 4),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

class _Restaurants {
  String image;
  String image1;
  String image2;
  String name;
  String desc;

  _Restaurants({this.image, this.name, this.desc, this.image1, this.image2});
}

Widget getCategory(String imgName, String name, context, int tile) {
  return Column(
    children: <Widget>[
      InkWell(
        borderRadius: BorderRadius.circular(90),
        onTap: () {
          if (tile == 1)
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DineOut();
            }));
          if (tile == 2)
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Booking();
            }));
          if (tile == 3)
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PickUp();
            }));
          if (tile == 4)
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TopRated();
            }));
        },
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.orange, width: 2.0),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/${imgName}'), fit: BoxFit.cover)),
        ),
      ),
      Text(name),
    ],
  );
}

Widget restura(String imgName, String name, String desc,
    List<_Restaurants> rest, BuildContext context, int tile) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: GestureDetector(
      onTap: () {
        if (tile == 1)
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomePage(
              imgName1: rest[0].image1,
              imgName: rest[0].image,
              imgName2: rest[0].image2,
              restName: rest[0].name,
              desc: rest[0].desc,
            );
          }));
        if (tile == 2)
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomePage(
              imgName1: rest[1].image1,
              imgName: rest[1].image,
              imgName2: rest[1].image2,
              restName: rest[1].name,
              desc: rest[1].desc,
            );
          }));
        if (tile == 3)
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomePage(
              imgName1: rest[2].image1,
              imgName: rest[2].image,
              imgName2: rest[2].image2,
              restName: rest[2].name,
              desc: rest[2].desc,
            );
          }));
        if (tile == 4)
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomePage(
              imgName1: rest[3].image1,
              imgName: rest[3].image,
              imgName2: rest[3].image2,
              restName: rest[3].name,
              desc: rest[3].desc,
            );
          }));
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage('assets/${imgName}'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  child: Container(
                    height: 250,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
//                          stops: [.6,.5],
                            end: Alignment.centerRight,
                            colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.white,
                        ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.av_timer,
                                      color: Colors.black,
                                      size: 28,
                                    )),
                                SizedBox(
                                  height: 2,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '30mins',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.black,
                                  size: 28,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.library_books,
                                      color: Colors.black,
                                      size: 22,
                                    )),
                                SizedBox(
                                  height: 2,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Review',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(desc),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

//import 'package:flutter/material.dart';
//import 'package:moodish_mvp/screens//Restaurants/booking.dart';
//import 'package:moodish_mvp/screens//Restaurants/dineout.dart';
//import 'package:moodish_mvp/screens//Restaurants/pickup.dart';
//import 'package:moodish_mvp/screens//Restaurants/toprated.dart';
//import 'package:moodish_mvp/screens/Restaurants/restaurantCard/homepage.dart';
//
//class Restaurant extends StatefulWidget {
//  @override
//  _RestaurantState createState() => _RestaurantState();
//}
//
//class _RestaurantState extends State<Restaurant> {
//  List<_Restaurants> rest = [
//    _Restaurants(
//        image: 'downtown_china.jpg',
//        name: 'Downtown China',
//        desc:
//            'Casual Dining - Chinese, Thai, Asian, Seafood, Momos, Beverages, Desserts \nAndheri Lokhandwala, Andheri West'),
//    _Restaurants(
//        image: 'family_tree.jpg',
//        name: 'Family Tree',
//        desc:
//            'Casual Dining - Biryani, Chinese, North Indian, Pizza, South Indian, Desserts \nGhatkopar East'),
//    _Restaurants(
//        image: 'frozen_bottle.jpg',
//        name: 'Frozen Bottle',
//        desc:
//            'Beverage Shop, Dessert Parlor - Beverages, Desserts, Ice Cream \nMatunga East'),
//    _Restaurants(
//        image: 'irish_house.png',
//        name: 'The Irish House',
//        desc: 'Pub, Casual Dining - European, American \nLower Parel'),
//    _Restaurants(
//        image: 'Mainland_China.jpg',
//        name: 'Mainland China',
//        desc:
//            'Casual Dining - Chinese, Asian, Sushi, Japanese, Thai \nSakinaka'),
//    _Restaurants(
//        image: 'pop_tates.jpg',
//        name: 'Pop Tates',
//        desc:
//            'Bar, Casual Dining - Continental, Chinese, Italian, Beverages \nLower Parel'),
//    _Restaurants(
//        image: 'tipsy_gipsy.jpg',
//        name: 'Tipsy Gipsy',
//        desc:
//            'Bar, Casual Dining - Continental, Mediterranean, Italian \nVeera Desai Area'),
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: ListView.builder(
//        scrollDirection: Axis.vertical,
//        shrinkWrap: true,
//        itemCount: rest.length,
//        itemBuilder: (context, index) {
//          return Column(
//            children: <Widget>[
//              if (index == 0)
//                Column(children: <Widget>[
////                  RichText(
////                    text: TextSpan(
////                        text: 'Restaurants',
////                        style: TextStyle(
////                            fontWeight: FontWeight.bold,
////                            fontSize: 60,
////                            color: Colors.black
////                        ),
////                        children: [
////                          TextSpan(
////                              text: '.',
////                              style: TextStyle(
////                                  fontWeight: FontWeight.w500,
////                                  fontSize: 100,
////                                  color: Colors.pinkAccent
////                              )
////                          )
////                        ]
////                    ),
////                  ),
////                  SizedBox(height: 10.0,),
////                  SingleChildScrollView(
////                    scrollDirection: Axis.horizontal,
////                    child: Row(
////                      children: <Widget>[
////                        Column(
////                          children: <Widget>[
////                            Container(
////                              height: 80,
////                              width: 80,
////                              decoration: BoxDecoration(
////                                shape: BoxShape.circle,
////                                image: DecorationImage(
////                                  image: AssetImage('assets/Spicy.jpg'),
////                                    fit: BoxFit.cover,
////                                ),
////                                border: Border.all(color: Colors.pinkAccent,width: 2.0)
////                              ),
////                            ),
////                            SizedBox(height: 5.0,),
////                            Text('Spicy',
////                            style: TextStyle(
//////                              fontStyle: FontStyle.italic,
////                              fontWeight: FontWeight.bold
////                            ),)
////                          ],
////                        ),
////                        SizedBox(width: 10.0,),
////                        Column(
////                          children: <Widget>[
////                            Container(
////                              height: 80,
////                              width: 80,
////                              decoration: BoxDecoration(
////                                  shape: BoxShape.circle,
////                                  image: DecorationImage(
////                                    image: AssetImage('assets/Italian.jpg'),
////                                    fit: BoxFit.cover,
////                                  ),
////                                  border: Border.all(color: Colors.pinkAccent,width: 2.0)
////                              ),
////                            ),
////                            SizedBox(height: 5.0,),
////                            Text('Italian',
////                              style: TextStyle(
//////                              fontStyle: FontStyle.italic,
////                                  fontWeight: FontWeight.bold
////                              ),)
////                          ],
////                        ),
////                        SizedBox(width: 10.0,),
////                        Column(
////                          children: <Widget>[
////                            Container(
////                              height: 80,
////                              width: 80,
////                              decoration: BoxDecoration(
////                                  shape: BoxShape.circle,
////                                  image: DecorationImage(
////                                    image: AssetImage('assets/Coffee.jpg'),
////                                    fit: BoxFit.cover,
////                                  ),
////                                  border: Border.all(color: Colors.pinkAccent,width: 2.0)
////                              ),
////                            ),
////                            SizedBox(height: 5.0,),
////                            Text('Aromatic',
////                              style: TextStyle(
//////                              fontStyle: FontStyle.italic,
////                                  fontWeight: FontWeight.bold
////                              ),)
////                          ],
////                        ),
////                        SizedBox(width: 10.0,),
////                        Column(
////                          children: <Widget>[
////                            Container(
////                              height: 80,
////                              width: 80,
////                              decoration: BoxDecoration(
////                                  shape: BoxShape.circle,
////                                  image: DecorationImage(
////                                    image: AssetImage('assets/Beverage.jpg'),
////                                    fit: BoxFit.cover,
////                                  ),
////                                  border: Border.all(color: Colors.pinkAccent,width: 2.0)
////                              ),
////                            ),
////                            SizedBox(height: 5.0,),
////                            Text('Beverages',
////                              style: TextStyle(
//////                              fontStyle: FontStyle.italic,
////                                  fontWeight: FontWeight.bold
////                              ),)
////                          ],
////                        ),
////                        SizedBox(width: 10.0,),
////                        Column(
////                          children: <Widget>[
////                            Container(
////                              height: 80,
////                              width: 80,
////                              decoration: BoxDecoration(
////                                  shape: BoxShape.circle,
////                                  image: DecorationImage(
////                                    image: AssetImage('assets/Chocolate.jpg'),
////                                    fit: BoxFit.cover,
////                                  ),
////                                  border: Border.all(color: Colors.pinkAccent,width: 2.0)
////                              ),
////                            ),
////                            SizedBox(height: 5.0,),
////                            Text('Chocolate',
////                              style: TextStyle(
//////                              fontStyle: FontStyle.italic,
////                                  fontWeight: FontWeight.bold
////                              ),)
////                          ],
////                        ),
////                      ],
////                    ),
////                  ),
//                  SizedBox(height: 15.0,),
//                  Padding(
//                    padding: const EdgeInsets.all(10.0),
//                    child: TextField(
//                      autocorrect: true,
//                      style: TextStyle(color: Colors.white),
//                      decoration: InputDecoration(
//                        hintText: 'Where do you want to go?',
//                        hintStyle: TextStyle(color: Colors.white),
//                        prefixIcon: Icon(
//                          Icons.search,
//                          color: Colors.white,
//                        ),
//                        filled: true,
//                        fillColor: Colors.black,
//                        enabledBorder: OutlineInputBorder(
//                          borderRadius: BorderRadius.circular(30.0),
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                          borderRadius: BorderRadius.circular(30.0),
//                        ),
//                      ),
//                    ),
//                  ),
//                  Center(
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Icon(Icons.location_on),
//                        Text('Mumbai,Maharashtra')
//                      ],
//                    ),
//                  ),
////                  Container(
////                    decoration: BoxDecoration(
////                        gradient: LinearGradient(
////                            begin: Alignment.topCenter,
////                            end: Alignment.bottomCenter,
////                            colors: )),
////                    child: Column(
////                      children: <Widget>[
////                        SizedBox(height: 20.0,),
////                        Container(
////                          alignment: Alignment(0.0, 0.0),
////                          padding: EdgeInsets.only(top: 10.0),
////                          child: Text(
////                            'Hungry, Pradyum?',
////                            style: TextStyle(
////                                fontSize: 30.0,
////                                fontWeight: FontWeight.bold),
////                          ),
////                        ),
////                        SizedBox(
////                          height: 5.0,
////                        ),
////                        Center(
////                          child: Row(
////                            mainAxisAlignment: MainAxisAlignment.center,
////                            children: <Widget>[
////                              Container(
////                                alignment: AlignmentDirectional.center,
////                                child: Icon(Icons.location_on),
////                              ),
////                              SizedBox(
////                                width: 5.0,
////                              ),
////                              Container(
////                                alignment: AlignmentDirectional.center,
////                                child: Text(
////                                  'Mumbai, Maharashtra',
////                                  style: TextStyle(
////                                    fontSize: 15.0,
////                                  ),
////                                ),
////                              ),
////                            ],
////                          ),
////                        ),
////                        Container(
//////                          color: Colors.white,
////                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
////                          child: TextField(
////                            decoration: InputDecoration(
////                              prefixIcon: Icon(Icons.search),
////                              hintText: 'Search',
////                            ),
////                          ),
////                        ),
////                        SizedBox(
////                          height: 20.0,
////                        )
////                      ],
////                    ),
////                  ),
//
//                  SizedBox(
//                    height: 20.0,
//                  ),
//                  SingleChildScrollView(
//                    scrollDirection: Axis.horizontal,
//                    child: Padding(
//                      padding: EdgeInsets.all(10.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceAround,
//                        children: <Widget>[
//                          GestureDetector(
//                            onTap: () {
//                              Navigator.push(context,
//                                  MaterialPageRoute(builder: (context) {
//                                    return DineOut();
//                                  }));
//                            },
//                            child: Container(
//                              width: 110.0,
//                            height: 145,
//                            decoration: BoxDecoration(
//                              borderRadius:  BorderRadius.circular(20.0),
//                                image: DecorationImage(
//                                    image: AssetImage('assets/Dine_out.png'),
//                                    fit: BoxFit.cover),
//                            ),
//                                child: Center(
//                                    child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
////                                    Container(
////                                      padding: EdgeInsets.only(top: 20.0),
////                                      child: Icon(
////                                        Icons.restaurant,
////                                        size: 75.0,
////                                        color: Colors.white,
////                                      ),
////                                    ),
//                                    Container(
//                                      child: Text(
//                                        'Dineout',
//                                        style: TextStyle(
//                                            fontSize: 20.0,
//                                            color: Colors.white,
//                                          fontWeight: FontWeight.bold
//                                        ),
//                                      ),
//                                    ),
//                                    Container(
//                                        child: Text(
//                                      '10+ Options',
//                                      style: TextStyle(color: Colors.white),
//                                    )),
//                                    SizedBox(
//                                      height: 8.0,
//                                    )
//                                  ],
//                                ))),
//                          ),
//                          SizedBox(width: 20.0,),
//                          GestureDetector(
//                            onTap: () {
//                              Navigator.push(context,
//                                  MaterialPageRoute(builder: (context) {
//                                    return Booking();
//                                  }));
//                            },
//                            child: Container(
//                                width: 110.0,
//                                height: 145,
//                                decoration: BoxDecoration(
//                                  borderRadius:  BorderRadius.circular(20.0),
//                                  image: DecorationImage(
//                                      image: AssetImage('assets/Booking.png'),
//                                      fit: BoxFit.cover),
//                                ),
//
//                                child: Center(
//                                    child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
////                                    Container(
////                                      padding: EdgeInsets.only(top: 20.0),
////                                      child: Icon(
////                                        Icons.calendar_today,
////                                        size: 75.0,
////                                        color: Colors.white,
////                                      ),
////                                    ),
//                                    Container(
//                                      child: Text(
//                                        'Booking',
//                                        style: TextStyle(
//                                            fontSize: 20.0,
//                                            color: Colors.white,
//                                        fontWeight: FontWeight.bold
//                                        ),
//                                      ),
//                                    ),
//                                    Container(
//                                        child: Text(
//                                      '9+ Options',
//                                      style: TextStyle(color: Colors.white),
//                                    )),
//                                    SizedBox(
//                                      height: 8.0,
//                                    )
//                                  ],
//                                ))),
//                          ),
//                          SizedBox(width: 20.0,),
//                          GestureDetector(
//                            onTap: () {
//                              Navigator.push(context,
//                                  MaterialPageRoute(builder: (context) {
//                                    return TopRated();
//                                  }));
//                            },
//                            child: Container(
//                                width: 110.0,
//                                height: 145,
//                                decoration: BoxDecoration(
//                                  borderRadius:  BorderRadius.circular(20.0),
//                                  image: DecorationImage(
//                                      image: AssetImage('assets/Top_Rated.png'),
//                                      fit: BoxFit.cover),
//                                ),
//                                child: Center(
//                                    child: Column(
//                                      mainAxisAlignment: MainAxisAlignment.center,
//                                      children: <Widget>[
////                                        Container(
////                                          padding: EdgeInsets.only(top: 20.0),
////                                          child: Icon(
////                                            Icons.stars,
////                                            size: 75.0,
////                                            color: Colors.yellow,
////                                          ),
////                                        ),
//                                        Container(
//                                          child: Text(
//                                            'Top Rated',
//                                            style: TextStyle(
//                                                fontSize: 17.0,
//                                                color: Colors.white,
//                                              fontWeight: FontWeight.bold
//                                            ),
//                                          ),
//                                        ),
//                                        Container(
//                                            child: Text(
//                                              '5+ Options',
//                                              style: TextStyle(color: Colors.white),
//                                            )),
//                                        SizedBox(
//                                          height: 8.0,
//                                        )
//                                      ],
//                                    ))),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  SingleChildScrollView(
//                    scrollDirection: Axis.horizontal,
//                    child: Padding(
//                      padding: const EdgeInsets.all(12.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceAround,
//                        children: <Widget>[
//                          GestureDetector(
//                            onTap: () {
//                              Navigator.push(context,
//                                  MaterialPageRoute(builder: (context) {
//                                    return PickUp();
//                                  }));
//                            },
//                            child: Container(
//                                width: 110.0,
//                                height: 145,
//                                decoration: BoxDecoration(
//                                  borderRadius:  BorderRadius.circular(20.0),
//                                  image: DecorationImage(
//                                      image: AssetImage('assets/Pickup.png'),
//                                      fit: BoxFit.cover),
//                                ),
//                                child: Center(
//                                    child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
////                                    Container(
////                                      padding: EdgeInsets.only(top: 20.0),
////                                      child: Icon(
////                                        Icons.location_on,
////                                        size: 75.0,
////                                        color: Colors.green,
////                                      ),
////                                    ),
//                                    Container(
//                                      child: Text(
//                                        'Pick Up',
//                                        style: TextStyle(
//                                            fontSize: 20.0,
//                                            color: Colors.white,
//                                        fontWeight: FontWeight.bold),
//                                      ),
//                                    ),
//                                    Container(
//                                        child: Text(
//                                      '12+ Options',
//                                      style: TextStyle(color: Colors.white),
//                                    )),
//                                    SizedBox(
//                                      height: 8.0,
//                                    )
//                                  ],
//                                ))),
//                          ),
//                          SizedBox(width: 75,),
//                          FlatButton(onPressed: null, child: null),
//                          SizedBox(width: 30,),
//                          FlatButton(onPressed: null, child: null)
//                        ],
//                      ),
//                    ),
//                  ),
//                  Container(
//                    alignment: Alignment.centerLeft,
//                    child: Container(
////                        width: 175.0,
////                        margin: EdgeInsets.all(10.0),
////                        decoration: BoxDecoration(
////                          border: Border.all(color: Colors.black),
//////                          color: Colors.blue[200],
////                        ),
//                      child: Padding(
//                        padding: const EdgeInsets.all(5.0),
//                        child: Text(
//                          'Top Restaurants :',
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                              fontSize: 20.0,
//                              fontWeight: FontWeight.bold),
//                        ),
//                      ),
//                    ),
//                  )
//                ]),
//              Padding(
//                  padding: EdgeInsets.only(top: 15.0),
//                  child: GestureDetector(
//                    onTap: (){
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) {
//                            return HomePage();
//                          }));
//                    },
//                    child: Card(
//                      elevation: 1.0,
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(10.0)
//                        ),
//                        child: Row(
//                          children: <Widget>[
//                            Padding(
//                              padding: const EdgeInsets.all(10.0),
//                              child: Container(
//                                alignment: Alignment.centerLeft,
//                                height: 80,
//                                width: 80.0,
//                                decoration: BoxDecoration(
//                                  borderRadius: BorderRadius.circular(20.0),
//                                  image: DecorationImage(
//                                      image: AssetImage('assets/${rest[index].image}'),
//                                      fit: BoxFit.cover),
//                                ),
//                              ),
//                            ),
//                            Expanded(
//                              child: Padding(
//                                padding: const EdgeInsets.all(20.0),
//                                child: Column(
//                                  children: <Widget>[
//                                    Container(
//                                      alignment: Alignment.centerLeft,
//                                      child: Text(rest[index].name,
//                                      style: TextStyle(
//                                        fontSize: 22.0,
//                                        fontWeight: FontWeight.bold
//                                      ),),
//                                    ),
//                                    Container(
//                                        alignment: Alignment.centerLeft,
//                                        child: Text('\u{02605}4.2')),
//                                    SizedBox(height: 5.0,),
//                                    Text(rest[index].desc),
//
//
//                                  ],
//                                ),
//                              ),
//                            )
//                          ],
//                        )
//                    ),
//                  )),
//            ],
//          );
//        },
//      ),
//    );
//  }
//}
//
//class _Restaurants {
//  String image;
//  String name;
//  String desc;
//
//  _Restaurants({this.image, this.name, this.desc});
//}
