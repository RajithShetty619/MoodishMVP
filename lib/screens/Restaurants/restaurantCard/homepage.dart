import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'hometoptabs.dart';

class HomePage extends StatefulWidget {
  final RestListModel restaurant;
  HomePage({Key key, this.restaurant}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _favourite = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                      height: 250.0,
                      child: CachedNetworkImage(
                        imageUrl: widget.restaurant.photo_url,
                        imageBuilder: (context, imageprovider) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                image: DecorationImage(
                                    image: imageprovider

                                    /*  AssetImage('assets/${widget.imgName}') */,
                                    fit: BoxFit.cover)),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  '1 of 3',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                  Align(
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
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.restaurant.restaurant_Name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Divider(
                          color: Colors.black,
                        )),
                    SizedBox(height: 5),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.restaurant.features))),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          const SizedBox(width: 16.0),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 16.0,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(60.0)),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.star,
                                    size: 10,
                                  ),
                                  onPressed: null)),
                          Spacer(),
                          IconButton(
                            icon: _favourite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.pinkAccent,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: Colors.pinkAccent,
                                  ),
                            onPressed: () {
                              setState(() {
                                _favourite = !_favourite;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Divider(
                    color: Colors.black,
                  )),
              Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: TabBarView(
                    children: <Widget>[
                      HomeTopTabs(
                        rest: widget.restaurant,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
///////////////////////////////////////////////////////////////////////////

//class HomePage extends StatefulWidget {
//  final String imgName;
//  final String imgName1;
//  final String imgName2;
//  final String restName;
//  final String desc;
//  HomePage(
//      {Key key,
//      this.imgName,
//      this.imgName1,
//      this.imgName2,
//      this.restName,
//      this.desc})
//      : super(key: key);
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  bool _favourite = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return DefaultTabController(
//      length: 1,
//      child: SafeArea(
//        child: Scaffold(
//            backgroundColor: Colors.white,
//            body: Stack(
//              children: <Widget>[
//                Stack(
//                  children: <Widget>[
//                    Container(
//                      height: 250.0,
//                      child: PageView(
//                        children: <Widget>[
//                          Container(
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.only(
//                                    bottomRight: Radius.circular(30),
//                                    bottomLeft: Radius.circular(30)),
//                                image: DecorationImage(
//                                    image:
//                                        AssetImage('assets/${widget.imgName}'),
//                                    fit: BoxFit.cover)),
//                            child: Padding(
//                              padding: EdgeInsets.all(10),
//                              child: Align(
//                                alignment: Alignment.bottomRight,
//                                child: Text(
//                                  '1 of 3',
//                                  style: TextStyle(color: Colors.white),
//                                ),
//                              ),
//                            ),
//                          ),
//                          Container(
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.only(
//                                    bottomRight: Radius.circular(30),
//                                    bottomLeft: Radius.circular(30)),
//                                image: DecorationImage(
//                                    image:
//                                        AssetImage('assets/${widget.imgName1}'),
//                                    fit: BoxFit.cover)),
//                            child: Padding(
//                              padding: EdgeInsets.all(10),
//                              child: Align(
//                                alignment: Alignment.bottomRight,
//                                child: Text(
//                                  '2 of 3',
//                                  style: TextStyle(color: Colors.white),
//                                ),
//                              ),
//                            ),
//                          ),
//                          Container(
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.only(
//                                    bottomRight: Radius.circular(30),
//                                    bottomLeft: Radius.circular(30)),
//                                image: DecorationImage(
//                                    image:
//                                        AssetImage('assets/${widget.imgName2}'),
//                                    fit: BoxFit.cover)),
//                            child: Padding(
//                              padding: EdgeInsets.all(10),
//                              child: Align(
//                                alignment: Alignment.bottomRight,
//                                child: Text(
//                                  '3 of 3',
//                                  style: TextStyle(color: Colors.white),
//                                ),
//                              ),
//                            ),
//                          )
//                        ],
//                      ),
//                    ),
//                    Align(
//                      alignment: Alignment.topLeft,
//                      child: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Container(
//                          decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.circular(45),
//                          ),
//                          child: Padding(
//                            padding: const EdgeInsets.all(2.0),
//                            child: IconButton(
//                                icon: Icon(
//                                  Icons.arrow_back,
//                                  size: 30,
//                                  color: Colors.black,
//                                ),
//                                onPressed: () {
//                                  Navigator.pop(context);
//                                }),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(top: 15.0),
//                  child: Container(
//                    padding: EdgeInsets.fromLTRB(0, 310, 0, 0),
//                    child: Container(
//                      child: TabBarView(
//                        children: <Widget>[
//                          HomeTopTabs(
//                            colorVal: 0xffff5722,
//                            desc: widget.desc,
//                          ), //ff5722
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.fromLTRB(8, 260, 0, 0),
//                  child: Stack(
//                    children: <Widget>[
//                      Text(
//                        widget.restName,
//                        style: TextStyle(
//                            color: Colors.black,
//                            fontSize: 28.0,
//                            fontWeight: FontWeight.bold),
//                      ),
//                      Padding(
//                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
//                          child: Divider(
//                            color: Colors.black,
//                          )),
//                      Container(
//                        padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
//                        child: Text.rich(
//                          TextSpan(children: [
//                            WidgetSpan(
//                                child: Icon(
//                              Icons.location_on,
//                              size: 16.0,
//                              color: Colors.black,
//                            )),
//                            TextSpan(text: "Mumbai, Maharashtra")
//                          ]),
//                          style: TextStyle(color: Colors.black, fontSize: 12.0),
//                        ),
//                      ),
//                      Padding(
//                        padding: EdgeInsets.fromLTRB(4, 80, 0, 0),
//                        child: Row(
//                          children: <Widget>[
//                            const SizedBox(width: 16.0),
//                            Container(
//                              padding: const EdgeInsets.symmetric(
//                                vertical: 8.0,
//                                horizontal: 16.0,
//                              ),
//                              decoration: BoxDecoration(
//                                  color: Colors.blue,
//                                  borderRadius: BorderRadius.circular(20.0)),
//                              child: Text(
//                                "1294 reviews",
//                                style: TextStyle(
//                                    color: Colors.black, fontSize: 13.0),
//                              ),
//                            ),
//                            Spacer(),
//                            IconButton(
//                              icon: _favourite
//                                  ? Icon(
//                                      Icons.favorite,
//                                      color: Colors.pinkAccent,
//                                    )
//                                  : Icon(
//                                      Icons.favorite_border,
//                                      color: Colors.pinkAccent,
//                                    ),
//                              onPressed: () {
//                                setState(() {
//                                  _favourite = !_favourite;
//                                });
//                              },
//                            )
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            )),
//      ),
//    );
//  }
//}
/*
Widget _GooglePlayAppBar() {
  return Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: IconButton(
            icon: Icon(FontAwesomeIcons.bars),
          ),
        ),
        Container(
          child: Text(
            'Google Play',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Container(
          child: IconButton(
              icon: Icon(
                FontAwesomeIcons.microphone,
                color: Colors.blueGrey,
              ),
              onPressed: null),
        ),
      ],
    ),
  );
}

*/
