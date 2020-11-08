import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/geolocationRest.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'package:moodish_mvp/screens/Restaurants/restBloc/restBloc.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/restCardModel.dart';

class RestCategoryModel extends StatefulWidget {
  int event;

  RestCategoryModel({this.event});

  @override
  _RestCategoryModelState createState() => _RestCategoryModelState();
}

class _RestCategoryModelState extends State<RestCategoryModel> {
  double _currentIndex = 0;
  int _totalIndex = 8;

  Future<void> futureBuilderFunction(int length, BuildContext context) async {
    String cuisine;

    switch (widget.event) {
      case 1:
        cuisine = "North Indian";
        break;
      case 2:
        cuisine = "Italian";
        break;
      case 3:
        cuisine = "Continental";
        break;
      case 4:
        cuisine = "Desserts";
        break;
      case 5:
        cuisine = "Fast Food";
        break;
      default:
    }
    return cuisine;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: MainPainter(),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 32, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Your Address',
                            style: TextStyle(color: Colors.blue[900]),
                          ),
                          Text.rich(TextSpan(
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              children: [
                                TextSpan(text: 'Mumbai,Maharashtra west '),
                                WidgetSpan(
                                    child: Icon(
                                  Icons.edit,
                                  size: 17,
                                ))
                              ]))
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Icon(
                                Icons.arrow_back,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10, top: 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Icon(
                                Icons.search,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 85,
              ),
              Center(
                child: widget.event == 1
                    ? Text(
                        'Fine Dining',
                        style: TextStyle(fontSize: 20),
                      )
                    : widget.event == 2
                        ? Text(
                            'Italian',
                            style: TextStyle(fontSize: 20),
                          )
                        : widget.event == 3
                            ? Text(
                                'Continental',
                                style: TextStyle(fontSize: 20),
                              )
                            : widget.event == 4
                                ? Text(
                                    'Desserts',
                                    style: TextStyle(fontSize: 20),
                                  )
                                : widget.event == 5
                                    ? Text(
                                        'Fast Food',
                                        style: TextStyle(fontSize: 20),
                                      )
                                    : null,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'All Restaurants',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Sorted by Near You',
                          style: TextStyle(color: Colors.grey[300]),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15, top: 8),
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(
                            Icons.tune,
                            size: 24,
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              BlocConsumer<RestaurantBloc, Map<String, List<RestListModel>>>(
                buildWhen: (Map<String, List<RestListModel>> previous,
                    Map<String, List<RestListModel>> current) {
                  return true;
                },
                listenWhen: (Map<String, List<RestListModel>> previous,
                    Map<String, List<RestListModel>> current) {
                  if (current.length >= previous.length) {
                    return true;
                  }
                  return false;
                },
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, restList) {
                  print(restList["${widget.event}"].length.toString() +
                      "${widget.event}");
                  return FutureBuilder(
                    future: futureBuilderFunction(
                        restList["${widget.event}"].length, context),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        return ListView.builder(
                            itemCount: restList["${widget.event}"].length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              RestListModel element =
                                  restList["${widget.event}"][index];
                              return Padding(
                                padding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 15,
                                    right:
                                        MediaQuery.of(context).size.width / 15,
                                    top: 5,
                                    bottom: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return RestCardModel(
                                        restaurant: element,
                                      );
                                    }));
                                  },
                                  child: Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12,
                                            top: 8,
                                            bottom: 8,
                                            right: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  width: 160,
                                                  child: Text(
                                                    element.restaurant_Name,
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(context).size.width/20,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                Container(
                                                    width: 170,
                                                    child: Text(
                                                      element.restaurant_Type,
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          color:
                                                              Colors.grey[400]),
                                                    )),
                                                Text(
                                                  element.restaurant_Location,
                                                  style: TextStyle(
                                                      color: Colors.grey[400],
                                                      fontSize: 11),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, bottom: 10),
                                                  child: Container(
                                                    height: 1,
                                                    width: 175,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.star,
                                                      size: 10,
                                                      color: Colors.amber,
                                                    ),
                                                    Text(
                                                      element.rating,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Icon(
                                                      Icons.pin_drop,
                                                      size: 10,
                                                    ),
                                                    Text(
                                                      element
                                                          .restaurant_Location,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      element.price_level ?? '',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                      image:
                                                          CachedNetworkImageProvider(
                                                              element
                                                                  .photo_url),
                                                      fit: BoxFit.cover)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      else {
                        return Center(
                          child: SpinKitCircle(
                            color: Colors.blueAccent,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path topCircular = Path();
    Paint paint = Paint();
    paint.color = Colors.orange.shade200;
    final height = size.height;
    final width = size.width;
    topCircular.moveTo(-128, -65);
    topCircular.quadraticBezierTo(
        width * 0.501, height * 0.5, width + 128, -65);
    topCircular.close();
    canvas.drawPath(topCircular, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
