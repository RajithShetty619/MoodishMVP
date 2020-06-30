import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:rest/starfeedback.dart';

import 'map.dart';
import 'starfeedback.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OverView extends StatefulWidget {
  final Widget child;

  OverView({Key key, this.child}) : super(key: key);

  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  var _rating;
  String review='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context , index){
          return Column(
            children: <Widget>[
              if(index==0)
              Stack(
                children: <Widget>[
                  Container(
                      height: 150.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
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
                              child: Tab(
                                  icon: Icon(
                                    Icons.call,
                                    size: 85.0,
                                  ),
                                  child: Text("Phone"))),
                          SizedBox(
                            width: 20.0,
                          ),
                          InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0))),
                                        content: Column(
                                          children: [
                                            SingleChildScrollView(
                                              child: Container(
                                                height: 500.0,
                                                width: 200.0,
                                                child: Stack(
                                                  children: <Widget>[
                                                    Text("Today/'s Offers"),
                                                    Padding(
                                                        padding: EdgeInsets.fromLTRB(
                                                            0, 80, 0, 0),
                                                        //SizedBox(height: 50),
                                                        child: Container(
                                                            height: 100,
                                                            width: 100,
                                                            color: Colors.blue,
                                                            child: Stack(
                                                                children: <Widget>[
                                                                  Center(
                                                                      child: Icon(
                                                                          Icons.menu,
                                                                          size: 20)),
                                                                ]))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
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
                              child: Tab(
                                  icon: Icon(
                                    Icons.local_offer,
                                    size: 85.0,
                                  ),
                                  child: Text("Offers"))),
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
                              child: Tab(
                                  icon: Icon(
                                    Icons.restaurant_menu,
                                    size: 85.0,
                                  ),
                                  child: Text("Menu"))),
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
                              child: Tab(
                                icon: Icon(
                                  Icons.share,
                                  size: 85.0,
                                ),
                                child: Text("Share"),
                              )),
                          SizedBox(
                            width: 15.0,
                          ),
                        ],
                      )),
                  Divider(
                    color: Colors.black,
                    height: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 160, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Text(
                                "afssad fgh dfgdg dfhdfd aewrt gcbvh krt sffghdfsdfsd sdfsz bvnrtty ftryt iowanhshd asbjda jadihu")),
                        SizedBox(height: 5.0),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 10, 10),
                          child: InkWell(
                            onTap: () {},
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Read Me',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: Divider(color: Colors.black, height: 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Container(
                            color: Colors.white,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Maps(),
                                  ),
                                );
                              },
                              child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Location',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.black,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: RaisedButton(
                            onPressed: () {
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
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: Row(
                                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(Icons.phone),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '+91-02831-48912',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: RaisedButton(
                            onPressed: () {
                              /*       showDatePicker(
                      context: context,
                     // initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2021)
                    ).then((date) {
                      setState(() {
                      //  _dateTime = date;
                      });
                    });*/
                            },
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Row(
                                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(Icons.date_range),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Book-Table',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Rating',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                    ),),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: <Widget>[
                                    Text('5'),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Spacer(),
                                    Text('425'),
                                    SizedBox(width: 50.0,)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: <Widget>[
                                    Text('4'),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Spacer(),
                                    Text('589'),
                                    SizedBox(width: 50.0,)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: <Widget>[
                                    Text('3'),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Spacer(),
                                    Text('130'),
                                    SizedBox(width: 50.0,)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: <Widget>[
                                    Text('2'),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Spacer(),
                                    Text('126'),
                                    SizedBox(width: 50.0,)

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: <Widget>[
                                    Text('1'),
                                    Icon(Icons.star,color: Colors.amber,),
                                    Spacer(),
                                    Text('24'),
                                    SizedBox(width: 50.0,)
                                  ],
                                ),
                              ),
                              Divider(thickness: 2.0,),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Row(
                                  children: <Widget>[
                                    Text('Total :'),
                                    Spacer(),
                                    Text('1294 reviews'),
                                    SizedBox(width: 30.0,)
                                  ],
                                ),
                              ),
                              Text('   Please Rate & Review\nHow was your Experience?'),
                              SizedBox(height: 5.0,),
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
                              SizedBox(height: 14.0,),
                              Padding(
                                padding: EdgeInsets.all(7),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Write your Review!'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                                child: TextField(
                                    maxLines: 5,
                                    onChanged: (val){
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
                              Divider(thickness: 2.0,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
                              Card(
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
                                          subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                                        )
                                    )




            ],
          );
        },

      ),
    );
  }
}






//                  Padding(
//                    padding: const EdgeInsets.fromLTRB(0, 280, 0, 0),
//                    child: RaisedButton(
//                      onPressed: () {},
//                      color: Colors.white,
//                      child: InkWell(
//                        onTap: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => StarFeedback()),
//                          );
//                        },
//                        child: Padding(
//                          padding: EdgeInsets.fromLTRB(5, 0, 5, 50),
//                          child: Row(
//                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Icon(
//                                Icons.star,
//                                color: Colors.black,
//                              ),
//                              SizedBox(
//                                width: 10,
//                              ),
//                              Text(
//                                'Rating',
//                                style: TextStyle(
//                                  fontSize: 20,
//                                  fontWeight: FontWeight.w700,
//                                  color: Colors.black,
//                                ),
//                              ),
//                              SizedBox(width: 200.0),
//
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
