import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';

class RestaurantReview extends StatefulWidget {
  RestListModel rest;
  RestaurantReview({this.rest});
  @override
  _RestaurantReviewState createState() => _RestaurantReviewState();
}

class _RestaurantReviewState extends State<RestaurantReview> {
  List<String> review = [];
  List<String> rating = [];
  var _rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 40,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 0,),
                    child: Text('Reviews',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Divider(
                thickness: 2,
              ),
            ),
            CachedNetworkImage(
              imageUrl: widget.rest.photo_url,
              imageBuilder: (context, imageProvider) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                widget.rest.restaurant_Name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white),
                              ),
                              widget.rest.rating=='5'?
                              Text(
                                '\u{02605}${widget.rest.rating}.0',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ):                              Text(
                                '\u{02605}${widget.rest.rating}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 8,
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
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: TextField(
                        maxLines: 5,
                        onChanged: (val) {
                          review.add(val);
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
                        onPressed: () {
                          rating.add(_rating.toString());
                        },
                      ),
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      thickness: 2,
                    ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
