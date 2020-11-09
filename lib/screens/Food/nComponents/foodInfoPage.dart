import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/components/StepByStep.dart';
import 'package:moodish_mvp/screens/Food/nComponents/bottomtabNav.dart';

class FoodInfoCard extends StatefulWidget {
  final FoodListModel foodList;
  const FoodInfoCard({
    Key key,
    this.foodList,
  }) : super(key: key);
  @override
  _FoodInfoCardState createState() => _FoodInfoCardState();
}

class _FoodInfoCardState extends State<FoodInfoCard> {
  int _selected = 1;
  bool readMoreIng = false;
  bool readMorePrep = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selected = 1;
                      });
                    },
                    child: BottomInfoTab(
                      title: "Recipe",
                      index: 1,
                      selected: _selected,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selected = 2;
                      });
                    },
                    child: BottomInfoTab(
                      title: "Restaurants",
                      index: 2,
                      selected: _selected,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selected = 3;
                      });
                    },
                    child: BottomInfoTab(
                      title: "More Like This",
                      index: 3,
                      selected: _selected,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 2.52,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    widget.foodList.images),
                                fit: BoxFit.cover)),
                      ),
//                      Align(
//                        alignment: Alignment.topLeft,
//                        child: Padding(
//                          padding: EdgeInsets.only(right: 15, top: 10),
//                          child: GestureDetector(
//                            onTap: () {
//                              Navigator.pop(context);
//                            },
//                            child: Card(
//                              elevation: 8,
//                              shape: RoundedRectangleBorder(
//                                  borderRadius:
//                                      BorderRadius.all(Radius.circular(30))),
//                              child: Padding(
//                                padding: EdgeInsets.all(5),
//                                child: Icon(
//                                  Icons.arrow_back,
//                                  size: 32,
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
                      Positioned(
                        top: 200,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(60))),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 30, left: 35),
                                  child: Text(
                                    widget.foodList.foodName,
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, left: 35, right: 40),
                                  child: Text(
                                    widget.foodList.description,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 24, top: 5, right: 8),
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                        ),
                                        child: Container(
                                          height: 110,
                                          width: 62,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.black87,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                  child: Text(
                                                    widget.foodList.cuisine,
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Text(
                                                  'Cuisine',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (widget.foodList.mood != null ||
                                        widget.foodList.mood == '')
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 5, right: 8),
                                        child: Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                          ),
                                          child: Container(
                                            height: 110,
                                            width: 62,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 55,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black87,
                                                      shape: BoxShape.circle),
                                                  child: Center(
                                                    child: Text(
                                                      widget.foodList.mood,
                                                      style: TextStyle(
                                                          color: Colors.orange,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text(
                                                    'Mood',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 5, right: 8),
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                        ),
                                        child: Container(
                                          height: 110,
                                          width: 62,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 55,
                                                decoration: BoxDecoration(
                                                    color: Colors.black87,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                  child: Text(
                                                    widget.foodList.time,
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        fontSize: 11),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8),
                                                child: Text(
                                                  'Cooking\n  Time',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (widget.foodList.servings != null ||
                                        widget.foodList.servings == '')
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, left: 10),
                                            child: Text(
                                              'Servings',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey[600]),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15, top: 10),
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black87),
                                              child: Center(
                                                child: Text(
                                                  widget.foodList.servings,
                                                  style: TextStyle(
                                                      color: Colors.orange),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 22),
                                        child: Text(
                                          'Nutrients',
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(right: 35),
                                        child: Icon(
                                          Icons.add_circle_outline,
                                          size: 28,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 35),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 3, top: 15),
                                              child: Text(
                                                'Calories',
                                                style: TextStyle(
                                                    fontSize: 19.5,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 3),
                                              child: Text(
                                                'Carbohydrates',
                                                style: TextStyle(
                                                    fontSize: 19.5,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 3),
                                              child: Text(
                                                'Protien',
                                                style: TextStyle(
                                                    fontSize: 19.5,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 3),
                                              child: Text(
                                                'Fats',
                                                style: TextStyle(
                                                    fontSize: 19.5,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 35),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 3, top: 15),
                                              child: Text(
                                                widget.foodList.calories,
                                                style: TextStyle(
                                                    fontSize: 19.5,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 3),
                                              child: Text(
                                                widget.foodList.carbohydrates,
                                                style: TextStyle(
                                                    fontSize: 19.5,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 3),
                                              child: Text(
                                                widget.foodList.protein,
                                                style: TextStyle(
                                                    fontSize: 19.5,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 3),
                                              child: Text(
                                                widget.foodList.fat,
                                                style: TextStyle(
                                                    fontSize: 19.5,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 22),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.orange,
                                                      width: 2.5),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Icon(
                                                Icons.list,
                                                size: 30,
                                                color: Colors.orange,
                                              )),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Ingredients',
                                              style: TextStyle(
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              'A checklist before you can start cooking',
                                              style: TextStyle(
                                                  color: Colors.grey[600]),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20,
                                          left: 22,
                                          right: 22,
                                          bottom: 15),
                                      child: Divider(
                                        thickness: 1.5,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 22),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        primary: false,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            widget.foodList.ingredients.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          if (index == 5 &&
                                              readMoreIng == false)
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  readMoreIng = true;
                                                });
                                              },
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 20),
                                                  child: Text(
                                                    '...read more',
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                            );
                                          else if (index < 5 ||
                                              readMoreIng == true) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              child: Text(
                                                widget.foodList
                                                    .ingredients[index],
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 22),
                                              child: Container(
                                                  child: Icon(
                                                Icons.radio_button_unchecked,
                                                size: 30,
                                                color: Colors.orange,
                                              )),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            StepByStep(
                                                              foodList: widget
                                                                  .foodList,
                                                            )));
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Directions',
                                                    style: TextStyle(
                                                        fontSize: 24.5,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    'Cook better with step by step guide',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[600]),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 22,
                                              right: 22),
                                          child: Divider(
                                            thickness: 1.2,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: widget
                                                  .foodList.preparation.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                if (index == 5 &&
                                                    readMorePrep == false)
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        readMorePrep = true;
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 20),
                                                        child: Text(
                                                          '...read more',
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                else if (index < 5 ||
                                                    readMorePrep == true) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Step ${index + 1}',
                                                        style: TextStyle(
                                                            fontSize: 22),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        widget.foodList
                                                            .preparation[index],
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.grey),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      )
                                                    ],
                                                  );
                                                }
                                                //   return Column(
                                                //     crossAxisAlignment:
                                                //         CrossAxisAlignment.start,
                                                //     children: [
                                                //       Text(
                                                //         'Step ${index + 1}',
                                                //         style: TextStyle(
                                                //             fontSize: 22),
                                                //       ),
                                                //       SizedBox(
                                                //         height: 5,
                                                //       ),
                                                //       Text(
                                                //         widget.foodList
                                                //             .preparation[index],
                                                //         style: TextStyle(
                                                //             fontSize: 12,
                                                //             color: Colors.grey),
                                                //       ),
                                                //       SizedBox(
                                                //         height: 10,
                                                //       )
                                                //     ],
                                                //   );
                                              }),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// class Delegate extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;
//   RestListModel restaurant;
//
//   Delegate({this.expandedHeight, this.restaurant});
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     double condition = shrinkOffset / expandedHeight;
//     // TODO: implement build
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       overflow: Overflow.visible,
//       children: <Widget>[
//         Opacity(
//           opacity: (1 - shrinkOffset / expandedHeight),
//           child: Container(
//             height: 250,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(60),
//                     bottomRight: Radius.circular(60)),
//                 image: DecorationImage(
//                     image: CachedNetworkImageProvider(restaurant.photo_url),
//                     fit: BoxFit.cover)),
//           ),
//         ),
//         Positioned(
//           bottom: 185,
//           left: 275,
//           child: Container(
//             decoration:
//                 BoxDecoration(shape: BoxShape.circle, color: Colors.white),
//             child: Padding(
//               padding: EdgeInsets.all(8),
//               child: Icon(
//                 Icons.open_in_browser,
//                 size: 30,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 185,
//           left: 335,
//           child: Container(
//             decoration:
//                 BoxDecoration(shape: BoxShape.circle, color: Colors.white),
//             child: Padding(
//               padding: EdgeInsets.all(8),
//               child: Icon(
//                 Icons.favorite_border,
//                 size: 30,
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: expandedHeight - shrinkOffset < 50 ? 30 : 185 - shrinkOffset,
//           child: Center(
//             child: Row(
//               children: <Widget>[
//                 Card(
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: condition == 1
//                           ? BorderRadius.circular(50)
//                           : BorderRadius.circular(25)),
//                   child: Row(
//                     children: <Widget>[
//                       if (condition == 1)
//                         SizedBox(
//                           width: 16,
//                         ),
//                       if (condition == 1)
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: GestureDetector(
//                             onTap: () {},
//                             child: Card(
//                               elevation: 5,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.all(5),
//                                 child: Icon(
//                                   Icons.arrow_back,
//                                   size: 35,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       Container(
//                         width: shrinkOffset / expandedHeight == 1
//                             ? MediaQuery.of(context).size.width / 1.3
//                             : MediaQuery.of(context).size.width / 1.2,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 14.0, top: 10),
//                               child: Text(
//                                 restaurant.restaurant_Name,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 26),
//                               ),
//                             ),
//                             condition == 1
//                                 ? Container()
//                                 : Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 16.0, top: 1),
//                                     child: Text(
//                                       restaurant.restaurant_Type != 'nan'
//                                           ? restaurant.restaurant_Type
//                                           : restaurant.cuisines,
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           color: Colors.grey[400]),
//                                     ),
//                                   ),
//                             Padding(
//                               padding:
//                                   EdgeInsets.only(left: 8, right: 8, bottom: 5),
//                               child: Divider(
//                                 thickness: 1.2,
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: <Widget>[
//                                 SizedBox(
//                                   width: 14,
//                                 ),
//                                 Row(
//                                   children: <Widget>[
//                                     Icon(
//                                       Icons.star,
//                                       size: condition == 1 ? 12 : 13,
//                                       color: Colors.amber,
//                                     ),
//                                     Text(
//                                       restaurant.rating,
//                                       style: TextStyle(
//                                           fontSize: condition == 1 ? 12 : 14),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   width: 15,
//                                 ),
//                                 Row(
//                                   children: <Widget>[
//                                     Icon(
//                                       Icons.pin_drop,
//                                       size: condition == 1 ? 12 : 14,
//                                     ),
//                                     Text(
//                                       restaurant.restaurant_Location,
//                                       style: TextStyle(
//                                           fontSize: condition == 1 ? 12 : 14),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   width: 15,
//                                 ),
//                                 // Text(
//                                 //   '\u20B9 Free',
//                                 //   style: TextStyle(
//                                 //       fontSize: condition == 1 ? 12 : 15),
//                                 // )
//                               ],
//                             ),
//                             shrinkOffset / expandedHeight == 1
//                                 ? SizedBox(
//                                     height: 8,
//                                   )
//                                 : SizedBox(
//                                     height: 14,
//                                   )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   @override
//   // TODO: implement maxExtent
//   double get maxExtent => 250;
//
//   @override
//   // TODO: implement minExtent
//   double get minExtent => 120;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
// }
