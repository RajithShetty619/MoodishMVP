import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'hometoptabs.dart';

class HomePage extends StatefulWidget {
  final String imgName;
  final String imgName1;
  final String imgName2;
  final String restName;
  final String desc;
  HomePage({Key key,this.imgName,this.imgName1,this.imgName2,this.restName,this.desc}) : super(key: key);
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
            backgroundColor: Colors.white,
            body: Stack(
              children: <Widget>[
                Container(child: Container(
                  height: 225.0,
                  child: Carousel(
                    overlayShadow: false,
                    borderRadius: true,
                    boxFit: BoxFit.cover,
                    autoplay: true,
                    dotSize: 5.0,
                    indicatorBgPadding: 9.0,
                    images: [
                      new AssetImage('assets/${widget.imgName}'),
                      new AssetImage('assets/${widget.imgName1}'),
                      new AssetImage('assets/${widget.imgName2}'),
                    ],
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(microseconds: 1500),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 300, 0, 0),
                    child: Container(
                      child: TabBarView(
                        children: <Widget>[
                          HomeTopTabs(colorVal: 0xffff5722,desc: widget.desc,), //ff5722
                        ],
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 250, 0, 0),
                    child: Stack(
                      children: <Widget>[
                        Text(
                          widget.restName,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Divider(
                              color: Colors.black,
                            )),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
                          child: Text.rich(
                            TextSpan(children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.location_on,
                                size: 16.0,
                                color: Colors.black,
                              )),
                              TextSpan(text: "Mumbai, Maharashtra")
                            ]),
                            style: TextStyle(color: Colors.black, fontSize: 12.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(4, 80, 0, 0),
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
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text(
                                  "1294 reviews",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13.0),
                                ),
                              ),
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
                ),
              ],
            )),
      ),
    );
  }
}
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
