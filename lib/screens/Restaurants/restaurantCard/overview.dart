import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moodish_mvp/Services/betaCount.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
//import 'package:rest/starfeedback.dart';

import 'map.dart';
import 'starfeedback.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OverView extends StatefulWidget {
  final Widget child;
  final RestListModel rest;

  OverView({Key key, this.child, this.rest}) : super(key: key);

  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  String finalRating;
  var _rating;
  String review = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
            children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: new Text("+91-01237-12372"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Call"),
                                          onPressed: () {},
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.call,
                                  size: 50.0,
                                ),
                                Text("Phone")
                              ],
                            )),
                        SizedBox(
                          width: 20.0,
                        ),
                        InkWell(
                            onTap: () async {
                              BetaCount().count(field: 'situation');
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: <Widget>[
                                                Text("Today/'s Offers"),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 80, 0, 0),
                                                    //SizedBox(height: 50),
                                                    child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        color: Colors.blue,
                                                        child: Stack(children: <
                                                            Widget>[
                                                          Center(
                                                              child: Icon(
                                                                  Icons.menu,
                                                                  size: 20)),
                                                        ]))),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(""),
                                          onPressed: () {},
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.language,
                                  size: 50.0,
                                ),
                                Text("Website")
                              ],
                            )),
                        SizedBox(
                          width: 20.0,
                        ),
                        InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (Builder) {
                                    return Container(
                                      height: 900.0,
                                      color: Colors.blue,
                                      child: Scaffold(
                                          appBar: AppBar(
                                        backgroundColor: Colors.white,
                                        title: TextField(
                                          decoration: InputDecoration(
                                              icon: Icon(Icons.search),
                                              hintText: "Search here"),
                                        ),
                                        actions: <Widget>[
                                          IconButton(
                                            icon: Icon(
                                              Icons.search,
                                            ),
                                            onPressed: () {},
                                          )
                                        ],
                                      )),
                                    );
                                  });
                            },
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.directions,
                                  size: 50.0,
                                ),
                                Text("Direction")
                              ],
                            )),
                        SizedBox(
                          width: 20.0,
                        ),
                        InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (Builder) {
                                    return Container(
                                        height: 900.0,
                                        color: Colors.white,
                                        child: new Text(
                                          "Share",
                                          style: TextStyle(
                                            fontSize: 50,
                                          ),
                                          textAlign: TextAlign.left,
                                        ));
                                  });
                            },
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.share,
                                  size: 50.0,
                                ),
                                Text("Share"),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Address',
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child:
                                      Text(widget.rest.restaurant_Location,style: TextStyle(fontSize: 16)))),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Cuisine',
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text('${widget.rest.cuisines}',style: TextStyle(fontSize: 16),))),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Ratings',
                                      style: TextStyle(
                                        fontSize: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: <Widget>[
                                              Text('5'),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: <Widget>[
                                              Text('4'),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: <Widget>[
                                              Text('3'),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: <Widget>[
                                              Text('2'),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: <Widget>[
                                              Text('1'),
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            size: 50,
                                            color: Colors.amber,
                                          ),
                                          widget.rest.rating == '5'
                                              ? Text(
                                                  '${widget.rest.rating}.0',
                                                  style:
                                                      TextStyle(fontSize: 32),
                                                )
                                              : Text(
                                                  widget.rest.rating,
                                                  style:
                                                      TextStyle(fontSize: 32),
                                                )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  thickness: 2.0,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                    '   Please Rate & Review\nHow was your Experience?'),
                                SizedBox(
                                  height: 5.0,
                                ),
                                RatingBar(
                                  initialRating: 1,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.all(2.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    _rating = rating;
                                    print(rating);
                                  },
                                ),
                                SizedBox(
                                  height: 14.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Write your Review!'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5.0),
                                  child: TextField(
                                      maxLines: 5,
                                      onChanged: (val) {
                                        review = val;
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Optional',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0)),
                                      color: Colors.deepOrange,
                                      child: Text(
                                        'Submit',
                                        style:
                                            TextStyle(color: Color(0xffffffff)),
                                      ),
                                      onPressed: () {
                                        finalRating = _rating;
                                      },
                                    ),
                                  )),
                                ),
                                Divider(
                                  thickness: 2.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ListView.builder(
                  itemCount: widget.rest.reviews.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 1.0,
                        child: ListTile(
                          title: Row(
                            children: <Widget>[
                              Text(widget.rest.reviews[index]
                              ["author_name"]),
                              Spacer(),
                              Text(
                                  '\u{02605}${widget.rest.reviews[index]["rating"]}'),
                            ],
                          ),
                          subtitle:
                          Text(widget.rest.reviews[index]["text"]),
                        ));
                  })

            ],
          )
    );
  }
}
