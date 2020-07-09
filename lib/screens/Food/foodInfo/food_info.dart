import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/foodDelivery.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/foodabout.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/foodrecipe.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/restaurantTab.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/tabs_info.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/homepage.dart';

class Food_Info extends StatefulWidget {

  const Food_Info ({
    Key key,
    @required this.name,
    @required this.descbox,
    @required this.image,

  }):super (key:key);

  final name;
  final image;
  final descbox;

  @override
  _Food_InfoState createState() => _Food_InfoState();
}

class _Food_InfoState extends State<Food_Info> {
  int indx = 0;


  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: rest.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                if (index == 0)
                  Column(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: widget.image,
                        imageBuilder: (context, imageprovider){
                          return  Container(
                          height: 300.0,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0)),
                            image: DecorationImage(
                                image: imageprovider,
                                fit: BoxFit.cover),
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                        );
                        },
                        
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.name,
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
                                title: 'About',
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
                      if (indx == 0) Container(height: 700, child: FoodAbout(
                        name: widget.name,
                        descbox: widget.descbox,
                      )),
                      if (indx == 1)
                        Container(height: 800, child: FoodRecipe()),
                      if (indx == 3)
                        Container(height: 800, child: FoodDelivery()),
                    ],
                  ),
                //whatever gets repeated using index write down here
                if (indx == 2)
                  Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));
                        },
                        child: Card(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 125,
                                    width: 125.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/${rest[index].image}'),
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
                                          child: Text(
                                            rest[index].name,
                                            style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text('\u{02605}4.2')),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(rest[index].desc),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ))
              ],
            );
          },
        ),
      ),
    );
  }

  Widget f_desc({title}) {
    return GestureDetector(
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

class _Restaurants {
  String image;
  String name;
  String desc;

  _Restaurants({this.image, this.name, this.desc});
}
