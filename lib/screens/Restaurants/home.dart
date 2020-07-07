import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens//Restaurants/booking.dart';
import 'package:moodish_mvp/screens//Restaurants/dineout.dart';
import 'package:moodish_mvp/screens//Restaurants/pickup.dart';
import 'package:moodish_mvp/screens//Restaurants/toprated.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/homepage.dart';

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
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: rest.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              if (index == 0)
                Column(children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: 'Restaurants',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            color: Colors.black
                        ),
                        children: [
                          TextSpan(
                              text: '.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 100,
                                  color: Colors.pinkAccent
                              )
                          )
                        ]
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/Spicy.jpg'),
                                    fit: BoxFit.cover,
                                ),
                                border: Border.all(color: Colors.pinkAccent,width: 2.0)
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text('Spicy',
                            style: TextStyle(
//                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        SizedBox(width: 10.0,),
                        Column(
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/Italian.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(color: Colors.pinkAccent,width: 2.0)
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text('Italian',
                              style: TextStyle(
//                              fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold
                              ),)
                          ],
                        ),
                        SizedBox(width: 10.0,),
                        Column(
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/Coffee.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(color: Colors.pinkAccent,width: 2.0)
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text('Aromatic',
                              style: TextStyle(
//                              fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold
                              ),)
                          ],
                        ),
                        SizedBox(width: 10.0,),
                        Column(
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/Beverage.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(color: Colors.pinkAccent,width: 2.0)
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text('Beverages',
                              style: TextStyle(
//                              fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold
                              ),)
                          ],
                        ),
                        SizedBox(width: 10.0,),
                        Column(
                          children: <Widget>[
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/Chocolate.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(color: Colors.pinkAccent,width: 2.0)
                              ),
                            ),
                            SizedBox(height: 5.0,),
                            Text('Chocolate',
                              style: TextStyle(
//                              fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold
                              ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      autocorrect: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Where do you want to go?',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Colors.black,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.location_on),
                        Text('Mumbai,Maharashtra')
                      ],
                    ),
                  ),
//                  Container(
//                    decoration: BoxDecoration(
//                        gradient: LinearGradient(
//                            begin: Alignment.topCenter,
//                            end: Alignment.bottomCenter,
//                            colors: [Colors.white, Colors.blueAccent,Colors.blue[900]])),
//                    child: Column(
//                      children: <Widget>[
//                        SizedBox(height: 20.0,),
//                        Container(
//                          alignment: Alignment(0.0, 0.0),
//                          padding: EdgeInsets.only(top: 10.0),
//                          child: Text(
//                            'Hungry, Pradyum?',
//                            style: TextStyle(
//                                fontSize: 30.0,
//                                fontWeight: FontWeight.bold),
//                          ),
//                        ),
//                        SizedBox(
//                          height: 5.0,
//                        ),
//                        Center(
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              Container(
//                                alignment: AlignmentDirectional.center,
//                                child: Icon(Icons.location_on),
//                              ),
//                              SizedBox(
//                                width: 5.0,
//                              ),
//                              Container(
//                                alignment: AlignmentDirectional.center,
//                                child: Text(
//                                  'Mumbai, Maharashtra',
//                                  style: TextStyle(
//                                    fontSize: 15.0,
//                                  ),
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                        Container(
////                          color: Colors.white,
//                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
//                          child: TextField(
//                            decoration: InputDecoration(
//                              prefixIcon: Icon(Icons.search),
//                              hintText: 'Search',
//                            ),
//                          ),
//                        ),
//                        SizedBox(
//                          height: 20.0,
//                        )
//                      ],
//                    ),
//                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return DineOut();
                                  }));
                            },
                            child: Container(
                              width: 110.0,
                            height: 145,
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(20.0),
                                image: DecorationImage(
                                    image: AssetImage('assets/Dine_out.png'),
                                    fit: BoxFit.cover),
                            ),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
//                                    Container(
//                                      padding: EdgeInsets.only(top: 20.0),
//                                      child: Icon(
//                                        Icons.restaurant,
//                                        size: 75.0,
//                                        color: Colors.white,
//                                      ),
//                                    ),
                                    Container(
                                      child: Text(
                                        'Dineout',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Container(
                                        child: Text(
                                      '10+ Options',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    SizedBox(
                                      height: 8.0,
                                    )
                                  ],
                                ))),
                          ),
                          SizedBox(width: 20.0,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return Booking();
                                  }));
                            },
                            child: Container(
                                width: 110.0,
                                height: 145,
                                decoration: BoxDecoration(
                                  borderRadius:  BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: AssetImage('assets/Booking.png'),
                                      fit: BoxFit.cover),
                                ),

                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
//                                    Container(
//                                      padding: EdgeInsets.only(top: 20.0),
//                                      child: Icon(
//                                        Icons.calendar_today,
//                                        size: 75.0,
//                                        color: Colors.white,
//                                      ),
//                                    ),
                                    Container(
                                      child: Text(
                                        'Booking',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                        fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Container(
                                        child: Text(
                                      '9+ Options',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    SizedBox(
                                      height: 8.0,
                                    )
                                  ],
                                ))),
                          ),
                          SizedBox(width: 20.0,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return TopRated();
                                  }));
                            },
                            child: Container(
                                width: 110.0,
                                height: 145,
                                decoration: BoxDecoration(
                                  borderRadius:  BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: AssetImage('assets/Top_Rated.png'),
                                      fit: BoxFit.cover),
                                ),
                                child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
//                                        Container(
//                                          padding: EdgeInsets.only(top: 20.0),
//                                          child: Icon(
//                                            Icons.stars,
//                                            size: 75.0,
//                                            color: Colors.yellow,
//                                          ),
//                                        ),
                                        Container(
                                          child: Text(
                                            'Top Rated',
                                            style: TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.white,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        Container(
                                            child: Text(
                                              '5+ Options',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                        SizedBox(
                                          height: 8.0,
                                        )
                                      ],
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return PickUp();
                                  }));
                            },
                            child: Container(
                                width: 110.0,
                                height: 145,
                                decoration: BoxDecoration(
                                  borderRadius:  BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: AssetImage('assets/Pickup.png'),
                                      fit: BoxFit.cover),
                                ),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
//                                    Container(
//                                      padding: EdgeInsets.only(top: 20.0),
//                                      child: Icon(
//                                        Icons.location_on,
//                                        size: 75.0,
//                                        color: Colors.green,
//                                      ),
//                                    ),
                                    Container(
                                      child: Text(
                                        'Pick Up',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        child: Text(
                                      '12+ Options',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    SizedBox(
                                      height: 8.0,
                                    )
                                  ],
                                ))),
                          ),
                          SizedBox(width: 75,),
                          FlatButton(onPressed: null, child: null),
                          SizedBox(width: 30,),
                          FlatButton(onPressed: null, child: null)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 175.0,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
//                          color: Colors.blue[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Top Restaurants -',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));
                    },
                    child: Card(
                      color: Colors.grey[200],
                      elevation: 1.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 80,
                                width: 80.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: AssetImage('assets/${rest[index].image}'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(rest[index].name,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text('\u{02605}4.2')),
                                    SizedBox(height: 5.0,),
                                    Text(rest[index].desc),


                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  )),
            ],
          );
        },
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
