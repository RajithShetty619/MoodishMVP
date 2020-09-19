import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:moodish_mvp/Services/betaCount.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'package:moodish_mvp/test.dart';
import 'package:url_launcher/url_launcher.dart';
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
  bool copyDelay=false;
  Position _currentPosition;
  Position _restAddress;
  Geolocator geolocator = Geolocator();
  getCurrentLocation() async {
    geolocator.isLocationServiceEnabled();
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      _currentPosition = position;
    });
    return position;
  }
  getLatLngfromAddress(String restAddress)async{
    List<Placemark> placemark = await Geolocator().placemarkFromAddress(restAddress);
    Placemark place=placemark[0];
    _restAddress = place.position;
    return placemark;
  }


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
                              launch('tel:${widget.rest.international_phone_number}');
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
                              launch('${widget.rest.website}');
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
                            onTap: ()async{
                              await getCurrentLocation();
                              await getLatLngfromAddress(widget.rest.address);
//                              StreamHandling(latitudeC: _currentPosition.latitude,longitudeC: _currentPosition.longitude,latitudeP: _restAddress.latitude,longitudeP: _restAddress.longitude);
//
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
                            onTap: () {},
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
                                      Text(widget.rest.address,style: TextStyle(fontSize: 16)))),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                child: RaisedButton(
                                  color: copyDelay?Colors.green:Colors.white,
                                  onPressed: (){
                                    setState(() {
                                      copyDelay = true;
                                      Future.delayed(Duration(milliseconds: 200), (){
                                        setState(() {
                                          copyDelay = false;
                                        });
                                      });
                                    });
                                    Clipboard.setData(ClipboardData(text: widget.rest.address));
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  child: Text('Copy Location'),

                                ),
                              ),
                            ),
                          ),
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
