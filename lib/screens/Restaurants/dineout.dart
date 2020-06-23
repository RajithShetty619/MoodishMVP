import 'package:flutter/material.dart';

class DineOut extends StatefulWidget {
  @override
  _DineOutState createState() => _DineOutState();
}

class _DineOutState extends State<DineOut> {
  List<_Restaurants> rest = [
    _Restaurants(
        image: 'downtown_china.jpg',
        name: 'Downtown China',
        desc: 'Casual Dining - Chinese, Thai, Asian, Seafood, Momos, Beverages, Desserts \nAndheri Lokhandwala, Andheri West'),
    _Restaurants(
        image: 'family_tree.jpg',
        name: 'Family Tree',
        desc:'Casual Dining - Biryani, Chinese, North Indian, Pizza, South Indian, Desserts \nGhatkopar East'),
    _Restaurants(
        image: 'frozen_bottle.jpg',
        name: 'Frozen Bottle',
        desc:'Beverage Shop, Dessert Parlor - Beverages, Desserts, Ice Cream \nMatunga East'),
    _Restaurants(
        image: 'irish_house.png',
        name: 'The Irish House',
        desc: 'Pub, Casual Dining - European, American \nLower Parel'),
    _Restaurants(
        image: 'Mainland_China.jpg',
        name: 'Mainland China',
        desc:'Casual Dining - Chinese, Asian, Sushi, Japanese, Thai \nSakinaka'),
    _Restaurants(
        image: 'pop_tates.jpg',
        name: 'Pop Tates',
        desc:'Bar, Casual Dining - Continental, Chinese, Italian, Beverages \nLower Parel'),
    _Restaurants(
        image: 'tipsy_gipsy.jpg',
        name: 'Tipsy Gipsy',
        desc:'Bar, Casual Dining - Continental, Mediterranean, Italian \nVeera Desai Area'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Expanded(
            flex: 1,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: rest.length,
                itemBuilder: (context, index) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (index == 0)
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 30.0,
                                ),
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
                                SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0,left: 30.0,right: 30.0,bottom: 10.0),
                                  child: Container(
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.deepPurpleAccent,
                                    ),
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
                                            )),
                                        SizedBox(height: 10.0,)
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Top Restaurants -',
                                      textAlign: TextAlign.left,

                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ),
                                )
                              ]),
                        Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Card(
                                child: ListTile(
                                  onTap: () {},
                                  leading: CircleAvatar(
                                    backgroundImage:
                                    AssetImage('assets/${rest[index].image}'),
                                  ),
                                  title: Text(rest[index].name),
                                  subtitle: Text(rest[index].desc),
                                ))),
                      ]);
                }),
          ),
        ));
  }
}

class _Restaurants {
  String image;
  String name;
  String desc;

  _Restaurants({this.image, this.name, this.desc});
}
