import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import '../../../Services/database.dart';

class StarFeedback extends StatefulWidget {
  final RestListModel rest;
  StarFeedback(this.rest);
  @override
  _StarFeedbackState createState() => _StarFeedbackState();
}

class _StarFeedbackState extends State<StarFeedback> {
  var _rating = 4.0;

  String review;
  bool submit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          physics: NeverScrollableScrollPhysics(),
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
                                  sr_no: widget.rest.sr_no,
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
      ),
    );
  }
}
