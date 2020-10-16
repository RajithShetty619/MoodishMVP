import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantReview extends StatefulWidget {
  @override
  _RestaurantReviewState createState() => _RestaurantReviewState();
}

class _RestaurantReviewState extends State<RestaurantReview> {
  String _rating = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 16,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.arrow_back,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 14.0, top: 5),
                            child: Text(
                              'Yauatcha',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 26),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 8, right: 75, bottom: 5),
                            child: Divider(
                              thickness: 1.2,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 14,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    size: 11,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    '4.5(289)',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.alarm,
                                    size: 11,
                                  ),
                                  Text(
                                    '15-20 mins',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '\u20B9 Free',
                                style: TextStyle(fontSize: 12.5),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Rate',
                  style: TextStyle(fontSize: 26, color: Colors.grey),
                ),
                Text(
                  'Please Rate your Experience',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 220,
                  child: RatingBar(
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
                      if (rating == 1 || rating == 1.5)
                        setState(() {
                          _rating = 'Bad';
                        });
                      if (rating == 2 || rating == 2.5)
                        setState(() {
                          _rating = 'Could Be Better';
                        });
                      if (rating == 3 || rating == 3.5)
                        setState(() {
                          _rating = 'Good';
                        });
                      if (rating == 4 || rating == 4.5)
                        setState(() {
                          _rating = 'Very Good';
                        });
                      if (rating == 5)
                        setState(() {
                          _rating = 'Excellent';
                        });
                      print(rating);
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 220,
                  child: Center(
                    child: Text(_rating),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Review',
                  style: TextStyle(fontSize: 26, color: Colors.grey),
                ),
                Text(
                  'Please describe your experience in detail',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 75,
                  child: TextField(
                      maxLines: 3,
                      onChanged: (val) {},
                      decoration: InputDecoration(
                        hintText: 'How was it?',
                        hintStyle: TextStyle(fontSize: 15),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.orange)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.orange)),
                      )),
                ),
                SizedBox(height: 15,),
                Text(
                  'Best Part',
                  style: TextStyle(fontSize: 26, color: Colors.grey),
                ),
                Text(
                  'Please select what was best here',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8,),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: <Widget>[
                    RestaurantTags(tagName: 'Customer Service',selected: false,),
                    RestaurantTags(tagName: 'Ambience',selected: false,),
                    RestaurantTags(tagName: 'Food',selected: false,),
                    RestaurantTags(tagName: 'Cost',selected: false,),
                    RestaurantTags(tagName: 'Hygiene',selected: false,),

                  ],
                )
              ],
            ),
          )


        ],
      ),
    );

  }
}

class RestaurantTags extends StatefulWidget {
  String tagName;
  bool selected;
  RestaurantTags({this.tagName,this.selected});
  @override
  _RestaurantTagsState createState() => _RestaurantTagsState();
}

class _RestaurantTagsState extends State<RestaurantTags> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.selected = !widget.selected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.orange[700]),
            color: widget.selected?Colors.orange:Colors.transparent
        ),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Text(widget.tagName,style: TextStyle(fontSize: 16),),
        ),
      ),
    );
  }
}
