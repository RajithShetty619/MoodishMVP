import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickUp extends StatefulWidget {
  @override
  _PickUpState createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {
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
    return SafeArea(
        child: Scaffold(
            body: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),

                Center(
                  child: Container(
                    alignment: Alignment(0.0, 0.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white, Colors.redAccent])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.location_on,
                                size: 50.0,
                              ),
                            ),

                            Container(
                              child: Text(
                                'Pick Up',
                                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        Container(
                          child: Text('Fun Fact:- The Aztecs used chocolate as currency.'),
                        ),
                        SizedBox(height: 20.0,),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        ListView.builder(
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
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )));
  }
}

class _Restaurants {
  String image;
  String name;
  String desc;

  _Restaurants({this.image, this.name, this.desc});
}
