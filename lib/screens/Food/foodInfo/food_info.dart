import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/foodDelivery.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/foodabout.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/foodrecipe.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/restaurantTab.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/tabs_info.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/homepage.dart';

class Food_Info extends StatefulWidget {
  const Food_Info({
    Key key,
    this.foodList,
  }) : super(key: key);
  final FoodListModel foodList;

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
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: widget.foodList.images,
                  imageBuilder: (context, imageprovider) {
                    return Container(
                      height: 300.0,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0)),
                        image: DecorationImage(
                            image: imageprovider, fit: BoxFit.cover),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(45),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Wrap(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.foodList.foodName,

                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
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
                    f_desc(title: widget.foodList.taste),
                    f_desc(title: widget.foodList.meal_type),
                    f_desc(title: widget.foodList.deter),
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
                      widget.foodList.cuisine,
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
                  Container(
                      height: 700,
                      child: FoodAbout(
                        foodList: widget.foodList,
                      )),
                if (indx == 1)
                  Container(
                    height: MediaQuery.of(context).size.height*1.1,
                    child: FoodRecipe(
                      foodList: widget.foodList,
                    ),
                  ),
                if (indx == 3) Container(height: 800, child: FoodDelivery()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget f_desc({title}) {
    return GestureDetector(
      onTap: () {}, //category
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
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
