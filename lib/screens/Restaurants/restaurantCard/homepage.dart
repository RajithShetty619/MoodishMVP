import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moodish_mvp/Services/betaCount.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/mapview.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/resataurantReview.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
class HomePage extends StatefulWidget {
  final RestListModel restaurant;
  HomePage({Key key, this.restaurant}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selected = 1;
  bool copyDelay = false;
  String finalRating;
  var _rating;
  bool submit = false;
  String review = '';
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
                                  '',
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
                padding: EdgeInsets.all(10),
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
                        padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                        child: Divider(
                          color: Colors.black,
                        )),
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.restaurant.cuisines}',
//                            'Cuisine',
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                            ))),
                    Padding(
                      padding: EdgeInsets.only(top: 8,left: 5),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.location_on,size: 20,),
                              Text(widget.restaurant.restaurant_Location),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8,bottom: 8,left: 8),
                      child: Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 26,
                              ),
                              widget.restaurant.rating == '5'
                                  ? Text(
                                '${widget.restaurant.rating}.0',
                                style: TextStyle(fontSize: 28),
                              )
                                  : Text(
                                widget.restaurant.rating,
                                style: TextStyle(fontSize: 28),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10,right: 10),
                                child: Container(
                                  height: 25,
                                  width: 2,
                                  color: Colors.grey[400],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    PageTransition(
                                        type:
                                        PageTransitionType
                                            .rightToLeft,
                                        child: RestaurantReview(
                                            rest: widget.restaurant))),
                                child: Row(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment
                                          .centerRight,
                                      child: Icon(
                                        Icons.library_books,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets
                                          .all(8.0),
                                      child: Text(
                                        'Review',
                                        style: TextStyle(
                                          color:
                                          Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: Colors.grey[400],
                    width: 2
                  ))
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _selected=1;
                            });
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5,10,5,0),
                              child: Column(
                                children: <Widget>[
                                  Text('Overview',
                                  style: _selected==1?TextStyle(fontSize: 20,fontWeight: FontWeight.w500):TextStyle(fontSize: 19,color: Colors.grey),),
                                  _selected==1?
                                  Container(
                                    height: 5,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                      color: Colors.black,
                                    ),
                                  ):Container(height: 5,)

                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _selected = 2;
                            });
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5,10,5,0),
                              child: Column(
                                children: <Widget>[
                                  Text('Rating',
                                   style: _selected==2?TextStyle(fontSize: 20,fontWeight: FontWeight.w500):TextStyle(fontSize: 19,color: Colors.grey),),
                                  _selected==2?
                                  Container(
                                    height: 5,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                      color: Colors.black,
                                    ),
                                  ):Container(height: 5,)
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _selected = 3;
                            });
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5,10,5,0),
                              child: Column(
                                children: <Widget>[
                                  Text('Gallery',
                                  style: _selected==3?TextStyle(fontSize: 20,fontWeight: FontWeight.w500):TextStyle(fontSize: 19,color: Colors.grey),),
                                  _selected==3?
                                  Container(
                                    height: 5,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                      color: Colors.black,
                                    ),
                                  ):Container(height: 5,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
              if(_selected==1)
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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
                                  launch('tel:${widget.restaurant.international_phone_number}');
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.black)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.call,
                                          size: 38.0,
                                        ),
                                      ),
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
                                  launch('${widget.restaurant.website}');
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.black)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.language,
                                          size: 38.0,
                                        ),
                                      ),
                                    ),
                                    Text("Website")
                                  ],
                                )),
                            SizedBox(
                              width: 20.0,
                            ),
                            InkWell(
                                onTap: () async {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return MapView(widget.restaurant.address);
                                      }));
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.black)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.directions,
                                          size: 38.0,
                                        ),
                                      ),
                                    ),
                                    Text("Direction")
                                  ],
                                )),
                            SizedBox(
                              width: 20.0,
                            ),
                            InkWell(
                                onTap: () {
                                  final RenderBox box = context.findRenderObject();
                                  Share.share(
                                      '${widget.restaurant.restaurant_Name}-A 5 star Restaurant\nhttp://play.google.com/store/apps/details?id=net.moodish.snapinsight',
                                      subject: widget.restaurant.website,
                                      sharePositionOrigin:
                                      box.localToGlobal(Offset.zero) & box.size);
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.black)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.share,
                                          size: 38.0,
                                        ),
                                      ),
                                    ),
                                    Text("Share"),
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(height: 8),
                        Divider(thickness: 2,),
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
                                      child: Text(
                                          widget.restaurant.address,
                                          style: TextStyle(fontSize: 16)))),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Container(
                                    child: RaisedButton(
                                      color: copyDelay ? Colors.green : Colors.white,
                                      onPressed: () {
                                        setState(() {
                                          copyDelay = true;
                                          Future.delayed(Duration(milliseconds: 200), () {
                                            setState(() {
                                              copyDelay = false;
                                            });
                                          });
                                        });
                                        Clipboard.setData(
                                            ClipboardData(text: widget.restaurant.address));
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
                                      child: Text(
                                        '${widget.restaurant.cuisines}',
                                        style: TextStyle(fontSize: 16),
                                      ))),
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                              widget.restaurant.rating == '5'
                                                  ? Text(
                                                '${widget.restaurant.rating}.0',
                                                style: TextStyle(fontSize: 32),
                                              )
                                                  : Text(
                                                widget.restaurant.rating,
                                                style: TextStyle(fontSize: 32),
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
                                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                                      child: TextField(
                                          maxLines: 5,
                                          onChanged: (val) {
                                            review = val;
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Optional',
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30.0),
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
                                                style: TextStyle(color: Color(0xffffffff)),
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
                        itemCount: widget.restaurant.reviews.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                        itemBuilder: (context, index) {
                          return Card(
                              elevation: 1.0,
                              child: ListTile(
                                title: Row(
                                  children: <Widget>[
                                    Text(widget.restaurant.reviews[index]["author_name"]),
                                    Spacer(),
                                    Text(
                                        '\u{02605}${widget.restaurant.reviews[index]["rating"]}'),
                                  ],
                                ),
                                subtitle: Text(widget.restaurant.reviews[index]["text"]),
                              ));
                        })
                  ],
                ),
              if(_selected==2)
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '# On a scale of 1 to 5, how do you rate this Restaurant?',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Material(
                        color: Colors.white,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(24.0),
                        shadowColor: Color(0x802196F3),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            RatingBar(
                              initialRating: 4,
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
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                              child: TextField(
                                  maxLines: 5,
                                  onChanged: (val) {
                                    review = val;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Optional',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            if (!submit)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(30.0)),
                                        color: Colors.deepOrange,
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(color: Color(0xffffffff)),
                                        ),
                                        onPressed: () async {
                                          await DatabaseService().restRating(
                                              sr_no: widget.restaurant.sr_no,
                                              review: review,
                                              rating: _rating);
                                          setState(() {
                                            submit = true;
                                          });
                                        },
                                      ),
                                    )),
                              ),
                            SizedBox(
                              height: 20.0,
                            ),
                            ListView.builder(
                                itemCount: widget.restaurant.reviews.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                primary: false,
                                itemBuilder: (context, index) {
                                  return Card(
                                      elevation: 1.0,
                                      child: ListTile(
                                        title: Row(
                                          children: <Widget>[
                                            Text(widget.restaurant.reviews[index]
                                            ["author_name"]),
                                            Spacer(),
                                            Text(
                                                '\u{02605}${widget.restaurant.reviews[index]["rating"]}'),
                                          ],
                                        ),
                                        subtitle:
                                        Text(widget.restaurant.reviews[index]["text"]),
                                      ));
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              if(_selected==3)
                Padding(
                  padding: EdgeInsets.only(top: 8,left: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 120,
                      width: 150,
                      child: CachedNetworkImage(
                        imageUrl: widget.restaurant.photo_url,
                        imageBuilder: (context, imageprovider) {
                          return Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageprovider

                                    /*  AssetImage('assets/${widget.imgName}') */,
                                    fit: BoxFit.cover)),
                          );
                        },
                      ),

                    ),
                  ),
                )

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
