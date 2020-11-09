import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/food_info.dart';

class LikedFood extends StatefulWidget {
  @override
  _LikedFoodState createState() => _LikedFoodState();
}

class _LikedFoodState extends State<LikedFood> {
  List<FoodListModel> foodList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    size: MediaQuery.of(context).size.width / 10,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Liked Food',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(
              thickness: 2.0,
            ),
          ),
          FutureBuilder(
            future: DatabaseQuery().getLikedFood(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                foodList = snapshot.data;
                print(foodList.length);
                return foodList.length == 0
                    ? Container(
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: Center(
                          child: Text(
                            'No Food Liked Yet!',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 575,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                              ),
                              itemCount: foodList.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) {
                                return AspectRatio(
                                  aspectRatio: 0.9 / 1.1,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Food_Info(
                                                    foodList: foodList[index],
                                                  )));
                                    },
                                    child: Stack(
                                      children: <Widget>[
                                        CachedNetworkImage(
                                          imageUrl: foodList[index].images,
                                          imageBuilder:
                                              (context, imageProvider) {
                                            bool likeState = true;
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  )),
                                            );
                                          },
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    stops: [
                                                      .2,
                                                      .9
                                                    ],
                                                    colors: [
                                                      Colors.black
                                                          .withOpacity(.5),
                                                      Colors.black
                                                          .withOpacity(.1),
                                                    ])),
                                            child: Padding(
                                              padding: EdgeInsets.all(7.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(45),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: IconButton(
                                                            icon: Icon(
                                                              Icons.favorite,
                                                              color:
                                                                  Colors.pink,
                                                              size: 30,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await DatabaseService().disLikeTransction(
                                                                  food: foodList[
                                                                      index],
                                                                  collection:
                                                                      "food",
                                                                  sr_no: foodList[
                                                                          index]
                                                                      .sr_no,
                                                                  field:
                                                                      "like");
                                                              Scaffold.of(
                                                                      context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text("Food will be removed from the list!")));
                                                            }),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Text(
                                                          foodList[index]
                                                              .foodName,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                            foodList[index]
                                                                .cuisine,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    5.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          300),
                                                            ),
                                                            child: IconButton(
                                                              icon: Icon(
                                                                Icons
                                                                    .arrow_forward,
                                                                color: Colors
                                                                    .white,
                                                                size: 22,
                                                              ),
                                                              onPressed: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            Food_Info(
                                                                              foodList: foodList[index],
                                                                            )));
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                                // Padding(
                                //   padding: const EdgeInsets.all(3.0),
                                //   child: Stack(
                                //     children: <Widget>[
                                //       GestureDetector(
                                //         onTap: () {
                                //           Navigator.push(
                                //               context,
                                //               MaterialPageRoute(
                                //                   builder: (context) =>
                                //                       Food_Info(
                                //                         foodList:
                                //                             foodList[index],
                                //                       )));
                                //         },
                                //         child: CachedNetworkImage(
                                //           imageUrl: foodList[index].images,
                                //           imageBuilder:
                                //               (context, imageProvider) {
                                //             return Container(
                                //               margin: EdgeInsets.symmetric(
                                //                   horizontal: 10, vertical: 5),
                                //               decoration: BoxDecoration(
                                //                   borderRadius:
                                //                       BorderRadius.circular(20),
                                //                   image: DecorationImage(
                                //                     image: imageProvider,
                                //                     fit: BoxFit.cover,
                                //                   )),
                                //             );
                                //           },
                                //         ),
                                //       ),
                                //       Positioned(
                                //         top: 173,
                                //         child: Column(
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: <Widget>[
                                //             Padding(
                                //               padding: EdgeInsets.all(10),
                                //               child: Container(
                                //                 width: 245,
                                //                 child: Text(
                                //                   foodList[index].foodName,
                                //                   style: TextStyle(
                                //                       fontSize:
                                //                           MediaQuery.of(context)
                                //                                   .size
                                //                                   .width /
                                //                               20,
                                //                       fontWeight:
                                //                           FontWeight.bold,
                                //                       color: Colors.white),
                                //                 ),
                                //               ),
                                //             ),
                                //             Padding(
                                //               padding: const EdgeInsets.only(
                                //                   left: 12.0),
                                //               child: Text(
                                //                 foodList[index].cuisine, //
                                //                 style: TextStyle(
                                //                     fontSize:
                                //                         MediaQuery.of(context)
                                //                                 .size
                                //                                 .width /
                                //                             19,
                                //                     color: Colors.white),
                                //               ),
                                //             )
                                //           ],
                                //         ),
                                //       ),
                                //       Positioned(
                                //         left: 215,
                                //         top: 10,
                                //         child: Padding(
                                //           padding: EdgeInsets.all(10),
                                //           child: Icon(
                                //             Icons.favorite,
                                //             color: Colors.pink,
                                //             size: 30,
                                //           ),
                                //         ),
                                //       ),
                                //       Positioned(
                                //         top: 210,
                                //         left: 215,
                                //         child: Padding(
                                //           padding: EdgeInsets.all(10),
                                //           child: Container(
                                //             decoration: BoxDecoration(
                                //                 shape: BoxShape.circle,
                                //                 border: Border.all(
                                //                     color: Colors.white,
                                //                     width: 2)),
                                //             child: Icon(
                                //               Icons.chevron_right,
                                //               size: 30,
                                //               color: Colors.white,
                                //             ),
                                //           ),
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // );
                              }),
                        ),
                      );
              } else {
                return Center(
                  child: SpinKitCircle(
                    color: Colors.blueAccent,
                  ),
                );
              }
            },
          ),
        ],
      )),
    );
  }
}
