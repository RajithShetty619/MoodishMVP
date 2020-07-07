//import 'package:flutter/material.dart';
//import 'package:moodish_mvp/screens/Restaurants/restaurantCard/homepage.dart';
//class RestaurantTab extends StatefulWidget {
//  @override
//  _RestaurantTabState createState() => _RestaurantTabState();
//}
//
//class _RestaurantTabState extends State<RestaurantTab> {
//  List<_Restaurants> rest = [
//    _Restaurants(
//        image: 'downtown_china.jpg',
//        name: 'Downtown China',
//        desc:
//        'Casual Dining - Chinese, Thai, Asian, Seafood, Momos, Beverages, Desserts \nAndheri Lokhandwala, Andheri West'),
//    _Restaurants(
//        image: 'family_tree.jpg',
//        name: 'Family Tree',
//        desc:
//        'Casual Dining - Biryani, Chinese, North Indian, Pizza, South Indian, Desserts \nGhatkopar East'),
//    _Restaurants(
//        image: 'frozen_bottle.jpg',
//        name: 'Frozen Bottle',
//        desc:
//        'Beverage Shop, Dessert Parlor - Beverages, Desserts, Ice Cream \nMatunga East'),
//    _Restaurants(
//        image: 'irish_house.png',
//        name: 'The Irish House',
//        desc: 'Pub, Casual Dining - European, American \nLower Parel'),
//    _Restaurants(
//        image: 'Mainland_China.jpg',
//        name: 'Mainland China',
//        desc:
//        'Casual Dining - Chinese, Asian, Sushi, Japanese, Thai \nSakinaka'),
//    _Restaurants(
//        image: 'pop_tates.jpg',
//        name: 'Pop Tates',
//        desc:
//        'Bar, Casual Dining - Continental, Chinese, Italian, Beverages \nLower Parel'),
//    _Restaurants(
//        image: 'tipsy_gipsy.jpg',
//        name: 'Tipsy Gipsy',
//        desc:
//        'Bar, Casual Dining - Continental, Mediterranean, Italian \nVeera Desai Area'),
//  ];
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//        itemCount: rest.length,
//        itemBuilder: (context , index){
//          return  Padding(
//              padding: EdgeInsets.only(top: 15.0),
//              child: GestureDetector(
//                onTap: (){
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) {
//                        return HomePage();
//                      }));
//                },
//                child: Card(
//                    elevation: 1.0,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(10.0)
//                    ),
//                    child: Row(
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.all(10.0),
//                          child: Container(
//                            alignment: Alignment.centerLeft,
//                            height: 125,
//                            width: 125.0,
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(30.0),
//                              image: DecorationImage(
//                                  image: AssetImage('assets/${rest[index].image}'),
//                                  fit: BoxFit.cover),
//                            ),
//                          ),
//                        ),
//                        Expanded(
//                          child: Padding(
//                            padding: const EdgeInsets.all(20.0),
//                            child: Column(
//                              children: <Widget>[
//                                Container(
//                                  alignment: Alignment.centerLeft,
//                                  child: Text(rest[index].name,
//                                    style: TextStyle(
//                                        fontSize: 22.0,
//                                        fontWeight: FontWeight.bold
//                                    ),),
//                                ),
//                                Container(
//                                    alignment: Alignment.centerLeft,
//                                    child: Text('\u{02605}4.2')),
//                                SizedBox(height: 5.0,),
//                                Text(rest[index].desc),
//
//
//                              ],
//                            ),
//                          ),
//                        )
//                      ],
//                    )
//                ),
//              ));
//        });
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
