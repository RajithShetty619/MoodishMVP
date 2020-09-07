import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantReview extends StatefulWidget {
  String restName;
  String imgName;
  RestaurantReview({this.restName,this.imgName});
  @override
  _RestaurantReviewState createState() => _RestaurantReviewState();
}

class _RestaurantReviewState extends State<RestaurantReview> {
  List<String>review = [];
  List<String>rating = [];
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
                    icon: Icon(Icons.arrow_back,color: Colors.black,size: 40,),
                    onPressed: ()=> Navigator.of(context).pop(),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: MediaQuery
                        .of(context)
                        .size
                        .width / 12),
                    child: RichText(
                      text: TextSpan(
                          text: 'Reviews',
                          style: TextStyle(
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: [
                            TextSpan(
                                text: '.',
                                style: TextStyle(
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent))
                          ]),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Divider(thickness: 2,),
            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                Icon(Icons.star,color: Colors.amber,),
//                Icon(Icons.star,color: Colors.amber,),
//                Icon(Icons.star,color: Colors.amber,),
//                Icon(Icons.star,color: Colors.amber,),
//                Icon(Icons.star,color: Colors.amber,),
//                Icon(Icons.star,color: Colors.amber,),
//                Icon(Icons.star,color: Colors.amber,),
//                Icon(Icons.star,color: Colors.amber,),
//              ],
//            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/${widget.imgName}'),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.restName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            '\u{02605} 4.2',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8,),
            Material(
              color: Colors.white,
              elevation: 0.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  RatingBar(
                    initialRating: 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.all(2.0),
                    itemBuilder: (context, _) =>
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {
                      _rating = rating;
                      print(rating);
                    },
                  ),
                  SizedBox(height: 5.0,),
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
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(
                                    30.0)),
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
                    child: Divider(thickness: 2,),
                  ),
                  ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 1.0,
                            child: ListTile(
                              title: Row(
                                children: <Widget>[
                                  Text('Username'),
                                  Spacer(),
                                  Text(
                                      '\u{02605}4.2'
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                            )
                        );
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
