import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/addPicture.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/mapview.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/restaurantReview.dart';
import 'package:url_launcher/url_launcher.dart';

class RestCardModel extends StatefulWidget {
  final RestListModel restaurant;
  RestCardModel({this.restaurant});
  @override
  _RestCardModelState createState() => _RestCardModelState();
}

class _RestCardModelState extends State<RestCardModel> {
  int _selected = 1;
  bool copyDelay = false;
  int _selectMenu = 1;
  int _selectPhoto = 1;

  @override
  Widget build(BuildContext context) {
    print(widget.restaurant.address);
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 40,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 1;
                        });
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Overview',
                                style: _selected == 1
                                    ? TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)
                                    : TextStyle(
                                        fontSize: 19, color: Colors.grey),
                              ),
                              _selected == 1
                                  ? Container(
                                      height: 5,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        color: Colors.black,
                                      ),
                                    )
                                  : Container(
                                      height: 5,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 2;
                        });
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Reviews',
                                style: _selected == 2
                                    ? TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)
                                    : TextStyle(
                                        fontSize: 19, color: Colors.grey),
                              ),
                              _selected == 2
                                  ? Container(
                                      height: 5,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        color: Colors.black,
                                      ),
                                    )
                                  : Container(
                                      height: 5,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 3;
                        });
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Menu',
                                style: _selected == 3
                                    ? TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)
                                    : TextStyle(
                                        fontSize: 19, color: Colors.grey),
                              ),
                              _selected == 3
                                  ? Container(
                                      height: 5,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        color: Colors.black,
                                      ),
                                    )
                                  : Container(
                                      height: 5,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 4;
                        });
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Gallery',
                                style: _selected == 4
                                    ? TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)
                                    : TextStyle(
                                        fontSize: 19, color: Colors.grey),
                              ),
                              _selected == 4
                                  ? Container(
                                      height: 5,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        color: Colors.black,
                                      ),
                                    )
                                  : Container(
                                      height: 5,
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
        ),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate:
                  Delegate(expandedHeight: 250, restaurant: widget.restaurant),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 60,
                ),
                if (_selected == 1)
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
                                      launch(
                                          'tel:${widget.restaurant.international_phone_number}');
                                    },
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.black)),
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
                                    onTap: () {
                                      launch('${widget.restaurant.website}');
                                    },
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.black)),
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
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return MapView(
                                            widget.restaurant.address);
                                      }));
                                    },
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.black)),
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
                                    onTap: () {},
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.black)),
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
                            Divider(
                              thickness: 2,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      padding:
                                          EdgeInsets.fromLTRB(5, 0, 10, 10),
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              widget.restaurant.address ?? '',
                                              style: TextStyle(fontSize: 16)))),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Container(
                                        width: 120,
                                        child: RaisedButton(
                                          color: copyDelay
                                              ? Colors.green
                                              : Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              copyDelay = true;
                                              Future.delayed(
                                                  Duration(milliseconds: 200),
                                                  () {
                                                setState(() {
                                                  copyDelay = false;
                                                });
                                              });
                                            });
                                            Clipboard.setData(
                                                ClipboardData(text: ''));
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Icon(
                                                  Icons.content_copy,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text('Copy'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Cuisines',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      widget.restaurant.cuisines,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'Restaurant Type',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      widget.restaurant.restaurant_Type,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            )
                          ],
                        ),
                      ]),
                if (_selected == 2)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 40,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Reviews',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Discover what\'s best for you',
                                  style: TextStyle(color: Colors.grey[400]),
                                )
                              ],
                            ),
                            Spacer(),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return RestaurantReview();
                                }));
                              },
                              color: Colors.white,
                              elevation: 5,
                              child: Text('Write a review'),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(18, 5, 18, 8),
                        child: Divider(
                          thickness: 0.8,
                          color: Colors.grey,
                        ),
                      ),
                      /* Padding(
                        padding: EdgeInsets.only(left: 20, top: 2, right: 18),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'All',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Showing based on Dine out experience',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 13),
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Icon(
                                    Icons.tune,
                                    size: 24,
                                  ),
                                ))
                          ],
                        ),
                      ),
                       */
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.restaurant.reviews.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            dynamic element = widget.restaurant.reviews[index];
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        height: 90,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: CachedNetworkImageProvider(
                                                    element[
                                                        "profile_photo_url"])))),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Stack(
                                      overflow: Overflow.visible,
                                      children: <Widget>[
                                        Positioned(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.9,
                                            child: IconButton(
                                                icon: Icon(Icons.info_outline),
                                                onPressed: () async {
                                                  bool visible = false;
                                                  String description = '';
                                                  dynamic data =
                                                      await showDialog(
                                                    context: context,
                                                    builder: (dialogcontext) {
                                                      return AlertDialog(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        title: Text(
                                                            "Why do you want to report this?"),
                                                        content: Column(
                                                          children: [
                                                            FlatButton(
                                                                onPressed:
                                                                    () async {
                                                                  await DatabaseService()
                                                                      .report(
                                                                          rest: widget
                                                                              .restaurant,
                                                                          index:
                                                                              index,
                                                                          uid: Authenticate()
                                                                              .returnUid())
                                                                      .then(
                                                                          (value) {
                                                                    Navigator.pop(
                                                                        dialogcontext,
                                                                        "done");
                                                                  });
                                                                },
                                                                child: Align(
                                                                  child: Text(
                                                                      "Its Spam"),
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                )),
                                                            FlatButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    visible =
                                                                        true;
                                                                  });
                                                                },
                                                                child: Align(
                                                                  child: Text(
                                                                      "Other:"),
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                )),
                                                            // if (visible)
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          15,
                                                                          0.0,
                                                                          5,
                                                                          6),
                                                                  child:
                                                                      TextField(
                                                                          onChanged:
                                                                              (val) {
                                                                            setState(() {
                                                                              description = val;
                                                                            });
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            hintText:
                                                                                'Describe why its inapropriate?',
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(30.0),
                                                                            ),
                                                                          )),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                  child:
                                                                      RaisedButton(
                                                                    onPressed:
                                                                        () {
                                                                      DatabaseService()
                                                                          .report(
                                                                              rest: widget.restaurant,
                                                                              index: index,
                                                                              description: description,
                                                                              uid: Authenticate().returnUid())
                                                                          .then((value) {
                                                                        Navigator.pop(
                                                                            dialogcontext,
                                                                            "done");
                                                                      });
                                                                    },
                                                                    child: Text(
                                                                        "ok"),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        actions: [
                                                          FlatButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  dialogcontext);
                                                            },
                                                            child: Text(
                                                              "Cancel",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  if (data == "done") {
                                                    Scaffold.of(context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Thank you for your feedback")));
                                                  }
                                                })),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Text(
                                                    element["author_name"],
                                                    style: TextStyle(
                                                        color:
                                                            Colors.deepOrange),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 50,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                element["author_nickname"] ??
                                                    '',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(
                                                element[
                                                    "relative_time_description"],
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[400]),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      120,
                                                  child: Text(
                                                    element["text"],
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  )),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, bottom: 3),
                                                  child: Text(
                                                    element['rating']
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  child: Divider(
                                    thickness: 0.8,
                                  ),
                                )
                              ],
                            );
                          })
                    ],
                  ),
                if (_selected == 3)
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 10),
                    child: FutureBuilder(
                      future: DatabaseService().restRecommendApi(
                          rest_name: widget.restaurant.restaurant_Name),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        /* 
                        /
                        /
                        //
                        /
                        /
                        /
                        /
                        /
                        /
                        /
                        /
                        //
                        /
                        /
                         */
                        return;
                      },
                    ),
                  ),
                if (_selected == 4)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 40,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Gallery',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Discover the restaurants visually',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 12),
                                )
                              ],
                            ),
                            Spacer(),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AddPicture();
                                }));
                              },
                              color: Colors.white,
                              elevation: 5,
                              child: Text('Add a Picture'),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10, right: 20, left: 20, bottom: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectPhoto = 1;
                                    });
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 10, 5, 0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            'All',
                                            style: _selectPhoto == 1
                                                ? TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500)
                                                : TextStyle(
                                                    fontSize: 19,
                                                    color: Colors.grey),
                                          ),
                                          _selectPhoto == 1
                                              ? Container(
                                                  height: 5,
                                                  width: 45,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20)),
                                                    color: Colors.black,
                                                  ),
                                                )
                                              : Container(
                                                  height: 5,
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectPhoto = 2;
                                    });
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 10, 5, 0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            'Ambience',
                                            style: _selectPhoto == 2
                                                ? TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500)
                                                : TextStyle(
                                                    fontSize: 19,
                                                    color: Colors.grey),
                                          ),
                                          _selectPhoto == 2
                                              ? Container(
                                                  height: 5,
                                                  width: 45,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20)),
                                                    color: Colors.black,
                                                  ),
                                                )
                                              : Container(
                                                  height: 5,
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectPhoto = 3;
                                    });
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 10, 5, 0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            'Food',
                                            style: _selectPhoto == 3
                                                ? TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500)
                                                : TextStyle(
                                                    fontSize: 19,
                                                    color: Colors.grey),
                                          ),
                                          _selectPhoto == 3
                                              ? Container(
                                                  height: 5,
                                                  width: 45,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20)),
                                                    color: Colors.black,
                                                  ),
                                                )
                                              : Container(
                                                  height: 5,
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
                      SizedBox(
                        height: 15,
                      ),
                      if (_selectPhoto == 1)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 10),
                              itemCount: 6,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 150,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/Chocolate.jpg'),
                                          fit: BoxFit.cover)),
                                );
                              }),
                        ),
                      if (_selectPhoto == 2)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 10),
                              itemCount: 6,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 150,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/Coffee.jpg'),
                                          fit: BoxFit.cover)),
                                );
                              }),
                        ),
                      if (_selectPhoto == 3)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 10),
                              itemCount: 6,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 150,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage('assets/img.jpg'),
                                          fit: BoxFit.cover)),
                                );
                              }),
                        )
                    ],
                  )
              ]),
            )
          ],
        )

//        ListView(physics: BouncingScrollPhysics(), children: <Widget>[
//          Stack(
//            alignment: Alignment.bottomCenter,
//            overflow: Overflow.visible,
//            children: <Widget>[
//              Container(
//                height: 250,
//                width: MediaQuery.of(context).size.width,
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.only(
//                        bottomLeft: Radius.circular(60),
//                        bottomRight: Radius.circular(60)),
//                    image: DecorationImage(
//                        image: AssetImage('assets/Coffee.jpg'),
//                        fit: BoxFit.cover)),
//              ),
//              Positioned(
//                bottom: 185,
//                left: 275,
//                child: Container(
//                  decoration: BoxDecoration(
//                      shape: BoxShape.circle, color: Colors.white),
//                  child: Padding(
//                    padding: EdgeInsets.all(8),
//                    child: Icon(
//                      Icons.open_in_browser,
//                      size: 30,
//                    ),
//                  ),
//                ),
//              ),
//              Positioned(
//                bottom: 185,
//                left: 335,
//                child: Container(
//                  decoration: BoxDecoration(
//                      shape: BoxShape.circle, color: Colors.white),
//                  child: Padding(
//                    padding: EdgeInsets.all(8),
//                    child: Icon(
//                      Icons.favorite_border,
//                      size: 30,
//                    ),
//                  ),
//                ),
//              ),
//              Positioned(
//                top: 185,
//                child: Center(
//                  child: Card(
//                    elevation: 5,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(25)),
//                    child: Container(
//                      width: MediaQuery.of(context).size.width / 1.2,
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.only(left: 14.0, top: 10),
//                            child: Text(
//                              'Yauatcha',
//                              style: TextStyle(
//                                  fontWeight: FontWeight.bold, fontSize: 26),
//                            ),
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.only(left: 16.0, top: 1),
//                            child: Text(
//                              'Fine Dining, Cantonese, Chinese',
//                              style: TextStyle(
//                                  fontSize: 15, color: Colors.grey[400]),
//                            ),
//                          ),
//                          Padding(
//                            padding:
//                                EdgeInsets.only(left: 8, right: 8, bottom: 5),
//                            child: Divider(
//                              thickness: 1.2,
//                            ),
//                          ),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            children: <Widget>[
//                              SizedBox(
//                                width: 14,
//                              ),
//                              Row(
//                                children: <Widget>[
//                                  Icon(
//                                    Icons.star,
//                                    size: 13,
//                                    color: Colors.amber,
//                                  ),
//                                  Text(
//                                    '4.5(289)',
//                                    style: TextStyle(fontSize: 14),
//                                  ),
//                                ],
//                              ),
//                              SizedBox(
//                                width: 15,
//                              ),
//                              Row(
//                                children: <Widget>[
//                                  Icon(
//                                    Icons.alarm,
//                                    size: 14,
//                                  ),
//                                  Text(
//                                    '15-20 mins',
//                                    style: TextStyle(fontSize: 14),
//                                  ),
//                                ],
//                              ),
//                              SizedBox(
//                                width: 15,
//                              ),
//                              Text(
//                                '\u20B9 Free',
//                                style: TextStyle(fontSize: 15),
//                              )
//                            ],
//                          ),
//                          SizedBox(
//                            height: 14,
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              )
//            ],
//          ),
//          SizedBox(
//            height: 60,
//          ),
//          if (_selected == 1)
//            ListView(
//                physics: NeverScrollableScrollPhysics(),
//                shrinkWrap: true,
//                children: <Widget>[
//                  Column(
//                    children: <Widget>[
//                      SizedBox(
//                        height: 20,
//                      ),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[
//                          InkWell(
//                              onTap: () {},
//                              child: Column(
//                                children: <Widget>[
//                                  Container(
//                                    decoration: BoxDecoration(
//                                        shape: BoxShape.circle,
//                                        border:
//                                            Border.all(color: Colors.black)),
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: Icon(
//                                        Icons.call,
//                                        size: 38.0,
//                                      ),
//                                    ),
//                                  ),
//                                  Text("Phone")
//                                ],
//                              )),
//                          SizedBox(
//                            width: 20.0,
//                          ),
//                          InkWell(
//                              onTap: () {},
//                              child: Column(
//                                children: <Widget>[
//                                  Container(
//                                    decoration: BoxDecoration(
//                                        shape: BoxShape.circle,
//                                        border:
//                                            Border.all(color: Colors.black)),
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: Icon(
//                                        Icons.language,
//                                        size: 38.0,
//                                      ),
//                                    ),
//                                  ),
//                                  Text("Website")
//                                ],
//                              )),
//                          SizedBox(
//                            width: 20.0,
//                          ),
//                          InkWell(
//                              onTap: () {},
//                              child: Column(
//                                children: <Widget>[
//                                  Container(
//                                    decoration: BoxDecoration(
//                                        shape: BoxShape.circle,
//                                        border:
//                                            Border.all(color: Colors.black)),
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: Icon(
//                                        Icons.directions,
//                                        size: 38.0,
//                                      ),
//                                    ),
//                                  ),
//                                  Text("Direction")
//                                ],
//                              )),
//                          SizedBox(
//                            width: 20.0,
//                          ),
//                          InkWell(
//                              onTap: () {},
//                              child: Column(
//                                children: <Widget>[
//                                  Container(
//                                    decoration: BoxDecoration(
//                                        shape: BoxShape.circle,
//                                        border:
//                                            Border.all(color: Colors.black)),
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: Icon(
//                                        Icons.share,
//                                        size: 38.0,
//                                      ),
//                                    ),
//                                  ),
//                                  Text("Share"),
//                                ],
//                              )),
//                        ],
//                      ),
//                      SizedBox(height: 8),
//                      Divider(
//                        thickness: 2,
//                      ),
//                      Padding(
//                        padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                            Padding(
//                              padding: const EdgeInsets.only(left: 5.0),
//                              child: Container(
//                                alignment: Alignment.centerLeft,
//                                child: Text(
//                                  'Address',
//                                  style: TextStyle(
//                                    fontSize: 24,
//                                  ),
//                                  textAlign: TextAlign.left,
//                                ),
//                              ),
//                            ),
//                            SizedBox(height: 5),
//                            Padding(
//                                padding: EdgeInsets.fromLTRB(5, 0, 10, 10),
//                                child: Container(
//                                    alignment: Alignment.centerLeft,
//                                    child: Text(
//                                        'Raheja Tower, Bandra Kurla Complex, Bandra east, Mumbai, Maharashtra-400051',
//                                        style: TextStyle(fontSize: 16)))),
//                            Align(
//                              alignment: Alignment.centerLeft,
//                              child: Padding(
//                                padding: EdgeInsets.only(left: 5),
//                                child: Container(
//                                  width: 120,
//                                  child: RaisedButton(
//                                    color:
//                                        copyDelay ? Colors.green : Colors.white,
//                                    onPressed: () {
//                                      setState(() {
//                                        copyDelay = true;
//                                        Future.delayed(
//                                            Duration(milliseconds: 200), () {
//                                          setState(() {
//                                            copyDelay = false;
//                                          });
//                                        });
//                                      });
//                                      Clipboard.setData(
//                                          ClipboardData(text: ''));
//                                    },
//                                    shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.circular(10),
//                                    ),
//                                    child: Row(
//                                      children: [
//                                        Padding(
//                                          padding: const EdgeInsets.all(3.0),
//                                          child: Icon(
//                                            Icons.content_copy,
//                                            color: Colors.black,
//                                          ),
//                                        ),
//                                        Text('Copy'),
//                                      ],
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),
//                            SizedBox(height: 12),
//                            Padding(
//                              padding: const EdgeInsets.only(left: 5),
//                              child: Text(
//                                'What is Best here?',
//                                style: TextStyle(fontSize: 22),
//                              ),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.only(left: 5, top: 5),
//                              child: Text(
//                                'What people think the restaurant is best at.',
//                                style: TextStyle(fontSize: 16),
//                              ),
//                            )
//                          ],
//                        ),
//                      )
//                    ],
//                  ),
//                ]),
//          if(_selected==2)
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Row(
//                    children: <Widget>[
//                      Icon(Icons.star,color: Colors.amber,size: 40,),
//                      SizedBox(width: 5,),
//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text('Reviews',style: TextStyle(fontSize: MediaQuery.of(context).size.width/18,fontWeight: FontWeight.w500),),
//                          Text('Discover what\'s best for you',style: TextStyle(color: Colors.grey[400]),)
//                        ],
//                      ),
//                      Spacer(),
//                      RaisedButton(
//                        onPressed: (){},
//                        color: Colors.white,
//                        elevation: 5,
//                        child: Text('Write a review'),
//                      )
//                    ],
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.fromLTRB(18, 5, 18, 8),
//                  child: Divider(thickness: 0.8,color: Colors.grey,),
//                ),
//                Padding(
//                  padding: EdgeInsets.only(left: 20,top: 2,right: 18),
//                  child: Row(
//                    children: <Widget>[
//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text('All',style: TextStyle(fontSize: MediaQuery.of(context).size.width/18,fontWeight: FontWeight.w500),),
//                          Text('Showing based on Dine out experience',style: TextStyle(color: Colors.grey[400],fontSize: 13),)
//                        ],
//                      ),
//                      Spacer(),
//                      Container(
//                          decoration: BoxDecoration(
//                              shape: BoxShape.circle,
//                              border: Border.all(color: Colors.black)),
//                          child: Padding(
//                            padding: const EdgeInsets.all(3.0),
//                            child: Icon(
//                              Icons.tune,
//                              size: 24,
//                            ),
//                          ))
//                    ],
//                  ),
//                ),
//                SizedBox(height: 10,),
//                ListView.builder(
//                    shrinkWrap: true,
//                    itemCount: 7,
//                    physics: NeverScrollableScrollPhysics(),
//                    itemBuilder: (context , index){
//                      return Column(
//                        children: <Widget>[
//                          Row(
//                            children: <Widget>[
//                              SizedBox(width: 10,),
//                              Container(
//                                height: 90,
//                                width: 90,
//                                decoration: BoxDecoration(
//                                  shape: BoxShape.circle,
//                                  color: Colors.grey
//                                ),
//                              ),
//                              SizedBox(width: 10,),
//                              Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.only(bottom: 5),
//                                    child: Text('User',style: TextStyle(color: Colors.deepOrange),),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.only(bottom: 5),
//                                    child: Text('Username',style: TextStyle(fontSize: 16),),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.only(bottom: 5),
//                                    child: Text('Dine out - Added 18 mins ago',style: TextStyle(fontSize: 12,color: Colors.grey[400]),),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.only(bottom: 5),
//                                    child: Container(width: MediaQuery.of(context).size.width-120,child: Text('Hello this restaurant is amazing and the service is so good, I cant begin to say how much you will enjoy it here. Truly had a great experience here',style: TextStyle(fontSize: 13),)),
//                                  )
//
//                                ],
//                              )
//                            ],
//                          ),
//                          Padding(
//                            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
//                            child: Divider(thickness: 0.8,),
//                          )
//                        ],
//                      );
//                    })
//              ],
//            ),
//          if(_selected==3)
//            Padding(
//              padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 10),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Row(
//                    children: <Widget>[
//                      RotatedBox(
//                          quarterTurns: -1,
//                          child: Text('Menu Images',style: TextStyle(fontSize: 20),)),
//                      SizedBox(width: 10,),
//                      Container(
//                        height: 180,
//                        width: 150,
//                        color: Colors.grey,
//                      ),
//                      SizedBox(width: 10,),
//                      Container(
//                        height: 180,
//                        width: 150,
//                        color: Colors.grey,
//                      )
//                    ],
//                  ),
//                  SizedBox(height: 30,),
//                  SingleChildScrollView(
//                    physics: NeverScrollableScrollPhysics(),
//                    scrollDirection: Axis.horizontal,
//                    child: Container(
//                      width: MediaQuery.of(context).size.width,
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          GestureDetector(
//                            onTap: () {
//                              setState(() {
//                                _selectMenu = 1;
//                              });
//                            },
//                            child: Container(
//                              child: Padding(
//                                padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
//                                child: Column(
//                                  children: <Widget>[
//                                    Text(
//                                      'All',
//                                      style: _selectMenu == 1
//                                          ? TextStyle(
//                                          fontSize: 20,
//                                          fontWeight: FontWeight.w500)
//                                          : TextStyle(
//                                          fontSize: 19, color: Colors.grey),
//                                    ),
//                                    _selectMenu == 1
//                                        ? Container(
//                                      height: 5,
//                                      width: 45,
//                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.only(
//                                            topLeft: Radius.circular(20),
//                                            topRight: Radius.circular(20)),
//                                        color: Colors.black,
//                                      ),
//                                    )
//                                        : Container(
//                                      height: 5,
//                                    )
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          SizedBox(width: 20,),
//                          GestureDetector(
//                            onTap: () {
//                              setState(() {
//                                _selectMenu = 2;
//                              });
//                            },
//                            child: Container(
//                              child: Padding(
//                                padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
//                                child: Column(
//                                  children: <Widget>[
//                                    Text(
//                                      'Featured',
//                                      style: _selectMenu == 2
//                                          ? TextStyle(
//                                          fontSize: 20,
//                                          fontWeight: FontWeight.w500)
//                                          : TextStyle(
//                                          fontSize: 19, color: Colors.grey),
//                                    ),
//                                    _selectMenu == 2
//                                        ? Container(
//                                      height: 5,
//                                      width: 45,
//                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.only(
//                                            topLeft: Radius.circular(20),
//                                            topRight: Radius.circular(20)),
//                                        color: Colors.black,
//                                      ),
//                                    )
//                                        : Container(
//                                      height: 5,
//                                    )
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          SizedBox(width: 20,),
//                          GestureDetector(
//                            onTap: () {
//                              setState(() {
//                                _selectMenu = 3;
//                              });
//                            },
//                            child: Container(
//                              child: Padding(
//                                padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
//                                child: Column(
//                                  children: <Widget>[
//                                    Text(
//                                      'Most Popular',
//                                      style: _selectMenu == 3
//                                          ? TextStyle(
//                                          fontSize: 20,
//                                          fontWeight: FontWeight.w500)
//                                          : TextStyle(
//                                          fontSize: 19, color: Colors.grey),
//                                    ),
//                                    _selectMenu == 3
//                                        ? Container(
//                                      height: 5,
//                                      width: 45,
//                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.only(
//                                            topLeft: Radius.circular(20),
//                                            topRight: Radius.circular(20)),
//                                        color: Colors.black,
//                                      ),
//                                    )
//                                        : Container(
//                                      height: 5,
//                                    )
//                                  ],
//                                ),
//                              ),
//                            ),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                  SizedBox(height: 15,),
//                  if(_selectMenu==1)
//                    ListView.builder(
//                        shrinkWrap: true,
//                        physics: NeverScrollableScrollPhysics(),
//                        itemCount: 7,
//                        itemBuilder: (context , index){
//                          return Column(
//                            children: <Widget>[
//                              Row(
//                                children: <Widget>[
//                                Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Text('Panner Bhurji',style: TextStyle(fontSize: 16),),
//                                    Text('Paneer, Tomato, etc.',style: TextStyle(color: Colors.grey[400]),)
//                                  ],
//                                ),
//                                  Spacer(),
//                                  Text('\u20B9250')
//                                ],
//                              ),
//                              Divider(thickness: 0.8,)
//                            ],
//                          );
//                        }),
//                  if(_selectMenu==2)
//                    ListView.builder(
//                        shrinkWrap: true,
//                        physics: NeverScrollableScrollPhysics(),
//                        itemCount: 7,
//                        itemBuilder: (context , index){
//                          return Column(
//                            children: <Widget>[
//                              Row(
//                                children: <Widget>[
//                                  Column(
//                                    crossAxisAlignment: CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Text('Butter Chicken',style: TextStyle(fontSize: 16),),
//                                      Text('Chicken, Spices, etc.',style: TextStyle(color: Colors.grey[400]),)
//                                    ],
//                                  ),
//                                  Spacer(),
//                                  Text('\u20B9450')
//                                ],
//                              ),
//                              Divider(thickness: 0.8,)
//                            ],
//                          );
//                        }),
//                  if(_selectMenu==3)
//                    ListView.builder(
//                        shrinkWrap: true,
//                        physics: NeverScrollableScrollPhysics(),
//                        itemCount: 7,
//                        itemBuilder: (context , index){
//                          return Column(
//                            children: <Widget>[
//                              Row(
//                                children: <Widget>[
//                                  Column(
//                                    crossAxisAlignment: CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Text('Mint Chocolate Ice Cream',style: TextStyle(fontSize: 16),),
//                                      Text('Mint, Oreo, etc.',style: TextStyle(color: Colors.grey[400]),)
//                                    ],
//                                  ),
//                                  Spacer(),
//                                  Text('\u20B9250')
//                                ],
//                              ),
//                              Divider(thickness: 0.8,)
//                            ],
//                          );
//                        })
//                ],
//              ),
//            ),
//          if(_selected==4)
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Row(
//                    children: <Widget>[
//                      Icon(Icons.star,color: Colors.amber,size: 40,),
//                      SizedBox(width: 5,),
//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text('Gallery',style: TextStyle(fontSize: MediaQuery.of(context).size.width/18,fontWeight: FontWeight.w500),),
//                          Text('Discover the restaurants visually',style: TextStyle(color: Colors.grey[400],fontSize: 12),)
//                        ],
//                      ),
//                      Spacer(),
//                      RaisedButton(
//                        onPressed: (){},
//                        color: Colors.white,
//                        elevation: 5,
//                        child: Text('Add a Picture'),
//                      )
//                    ],
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.only(top: 10,right: 20,left: 20,bottom: 10),
//                  child: Divider(thickness: 1,),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(left: 20),
//                  child: SingleChildScrollView(
//                    physics: NeverScrollableScrollPhysics(),
//                    scrollDirection: Axis.horizontal,
//                    child: Container(
//                      width: MediaQuery.of(context).size.width,
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          GestureDetector(
//                            onTap: () {
//                              setState(() {
//                                _selectPhoto = 1;
//                              });
//                            },
//                            child: Container(
//                              child: Padding(
//                                padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
//                                child: Column(
//                                  children: <Widget>[
//                                    Text(
//                                      'All',
//                                      style: _selectPhoto == 1
//                                          ? TextStyle(
//                                          fontSize: 20,
//                                          fontWeight: FontWeight.w500)
//                                          : TextStyle(
//                                          fontSize: 19, color: Colors.grey),
//                                    ),
//                                    _selectPhoto == 1
//                                        ? Container(
//                                      height: 5,
//                                      width: 45,
//                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.only(
//                                            topLeft: Radius.circular(20),
//                                            topRight: Radius.circular(20)),
//                                        color: Colors.black,
//                                      ),
//                                    )
//                                        : Container(
//                                      height: 5,
//                                    )
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          SizedBox(width: 20,),
//                          GestureDetector(
//                            onTap: () {
//                              setState(() {
//                                _selectPhoto = 2;
//                              });
//                            },
//                            child: Container(
//                              child: Padding(
//                                padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
//                                child: Column(
//                                  children: <Widget>[
//                                    Text(
//                                      'Ambience',
//                                      style: _selectPhoto == 2
//                                          ? TextStyle(
//                                          fontSize: 20,
//                                          fontWeight: FontWeight.w500)
//                                          : TextStyle(
//                                          fontSize: 19, color: Colors.grey),
//                                    ),
//                                    _selectPhoto == 2
//                                        ? Container(
//                                      height: 5,
//                                      width: 45,
//                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.only(
//                                            topLeft: Radius.circular(20),
//                                            topRight: Radius.circular(20)),
//                                        color: Colors.black,
//                                      ),
//                                    )
//                                        : Container(
//                                      height: 5,
//                                    )
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          SizedBox(width: 20,),
//                          GestureDetector(
//                            onTap: () {
//                              setState(() {
//                                _selectPhoto = 3;
//                              });
//                            },
//                            child: Container(
//                              child: Padding(
//                                padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
//                                child: Column(
//                                  children: <Widget>[
//                                    Text(
//                                      'Food',
//                                      style: _selectPhoto == 3
//                                          ? TextStyle(
//                                          fontSize: 20,
//                                          fontWeight: FontWeight.w500)
//                                          : TextStyle(
//                                          fontSize: 19, color: Colors.grey),
//                                    ),
//                                    _selectPhoto == 3
//                                        ? Container(
//                                      height: 5,
//                                      width: 45,
//                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.only(
//                                            topLeft: Radius.circular(20),
//                                            topRight: Radius.circular(20)),
//                                        color: Colors.black,
//                                      ),
//                                    )
//                                        : Container(
//                                      height: 5,
//                                    )
//                                  ],
//                                ),
//                              ),
//                            ),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//                SizedBox(height: 15,),
//                if(_selectPhoto==1)
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: GridView.builder(
//                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                          crossAxisCount: 2,
//                          crossAxisSpacing: 5,
//                          mainAxisSpacing: 10
//                        ),
//                        itemCount: 6,
//                        physics: NeverScrollableScrollPhysics(),
//                        shrinkWrap: true,
//                        itemBuilder: (context , index){
//                          return Container(
//                            height: 150,
//                            width: 100,
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(15),
//                              image: DecorationImage(
//                                image: AssetImage('assets/Mexican.jpg'),
//                                fit: BoxFit.cover
//                              )
//                            ),
//                          );
//                        }),
//                  ),
//                if(_selectPhoto==2)
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: GridView.builder(
//                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                            crossAxisCount: 2,
//                            crossAxisSpacing: 5,
//                            mainAxisSpacing: 10
//                        ),
//                        itemCount: 6,
//                        physics: NeverScrollableScrollPhysics(),
//                        shrinkWrap: true,
//                        itemBuilder: (context , index){
//                          return Container(
//                            height: 150,
//                            width: 100,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(15),
//                                image: DecorationImage(
//                                    image: AssetImage('assets/Salty.jpg'),
//                                    fit: BoxFit.cover
//                                )
//                            ),
//                          );
//                        }),
//                  ),
//                if(_selectPhoto==3)
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: GridView.builder(
//                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                            crossAxisCount: 2,
//                            crossAxisSpacing: 5,
//                            mainAxisSpacing: 10
//                        ),
//                        itemCount: 6,
//                        physics: NeverScrollableScrollPhysics(),
//                        shrinkWrap: true,
//                        itemBuilder: (context , index){
//                          return Container(
//                            height: 150,
//                            width: 100,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(15),
//                                image: DecorationImage(
//                                    image: AssetImage('assets/Spicy.jpg'),
//                                    fit: BoxFit.cover
//                                )
//                            ),
//                          );
//                        }),
//                  )
//
//              ],
//            )
//
//        ])
        );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  RestListModel restaurant;

  Delegate({this.expandedHeight, this.restaurant});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double condition = shrinkOffset / expandedHeight;
    // TODO: implement build
    return Stack(
      alignment: Alignment.bottomCenter,
      overflow: Overflow.visible,
      children: <Widget>[
        Opacity(
          opacity: (1 - shrinkOffset / expandedHeight),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60)),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(restaurant.photo_url),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          bottom: 185,
          left: 275,
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.open_in_browser,
                size: 30,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 185,
          left: 335,
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.favorite_border,
                size: 30,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight - shrinkOffset < 50 ? 30 : 185 - shrinkOffset,
          child: Center(
            child: Row(
              children: <Widget>[
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: condition == 1
                          ? BorderRadius.circular(50)
                          : BorderRadius.circular(25)),
                  child: Row(
                    children: <Widget>[
                      if (condition == 1)
                        SizedBox(
                          width: 16,
                        ),
                      if (condition == 1)
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {},
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
                        width: shrinkOffset / expandedHeight == 1
                            ? MediaQuery.of(context).size.width / 1.3
                            : MediaQuery.of(context).size.width / 1.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 14.0, top: 10),
                              child: Text(
                                restaurant.restaurant_Name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 26),
                              ),
                            ),
                            condition == 1
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, top: 1),
                                    child: Text(
                                      restaurant.restaurant_Type != 'nan'
                                          ? restaurant.restaurant_Type
                                          : restaurant.cuisines,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[400]),
                                    ),
                                  ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 8, right: 8, bottom: 5),
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
                                      size: condition == 1 ? 12 : 13,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      restaurant.rating,
                                      style: TextStyle(
                                          fontSize: condition == 1 ? 12 : 14),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.pin_drop,
                                      size: condition == 1 ? 12 : 14,
                                    ),
                                    Text(
                                      restaurant.restaurant_Location,
                                      style: TextStyle(
                                          fontSize: condition == 1 ? 12 : 14),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                // Text(
                                //   '\u20B9 Free',
                                //   style: TextStyle(
                                //       fontSize: condition == 1 ? 12 : 15),
                                // )
                              ],
                            ),
                            shrinkOffset / expandedHeight == 1
                                ? SizedBox(
                                    height: 8,
                                  )
                                : SizedBox(
                                    height: 14,
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 250;

  @override
  // TODO: implement minExtent
  double get minExtent => 120;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
