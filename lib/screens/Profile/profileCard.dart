import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/nComponents/foodInfoPage.dart';
import 'package:moodish_mvp/screens/Profile/Edit.dart';

class ProfileCard extends StatefulWidget {
  ImageProvider image;
  Map<String, dynamic> user;
  ProfileCard({this.user, this.image});
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  int _selected = 1;
  ImageProvider image;
  Map<String, dynamic> user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      image = widget.image;
      user = widget.user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context, {"user": user, "image": image});
        },
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.topLeft,
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50))),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(
                                context, {"user": user, "image": image});
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 10,
                                left: MediaQuery.of(context).size.width / 25),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        // Card(
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(50))),
                        //   elevation: 5,
                        //   child: Padding(
                        //     padding: EdgeInsets.all(8),
                        //     child: Icon(
                        //       Icons.share,
                        //       size: 30,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 40,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final data = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile(
                                          user: user,
                                          image: image,
                                        )));
                            setState(() {
                              user = data["_user"];
                              image = data["_image"];
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.edit,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 40,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 180,
                    left: MediaQuery.of(context).size.width / 12,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: widget.image ??
                                AssetImage('assets/anonuser.png')),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 0.8),
                        color: Colors.grey[400],
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 170),
              child: Text(
                user["name"] ?? '',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user["email"] ?? ''),
                        SizedBox(
                          height: 7,
                        ),
                        Text(user["bio"] ?? ''),
                        SizedBox(
                          height: 7,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 8,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 0.8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 1;
                        });
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Liked Recipes',
                              style: TextStyle(
                                  fontSize: _selected == 1
                                      ? MediaQuery.of(context).size.width / 20
                                      : MediaQuery.of(context).size.width / 22,
                                  color: _selected == 1
                                      ? Colors.black87
                                      : Colors.grey[500]),
                            ),
                          ),
                          _selected == 1
                              ? Container(
                                  height: 5,
                                  width: 60,
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
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 2;
                        });
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text('Reviews',
                                style: TextStyle(
                                    fontSize: _selected == 2
                                        ? MediaQuery.of(context).size.width / 20
                                        : MediaQuery.of(context).size.width /
                                            22,
                                    color: _selected == 2
                                        ? Colors.black87
                                        : Colors.grey[500])),
                          ),
                          _selected == 2
                              ? Container(
                                  height: 5,
                                  width: 60,
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
                      )),
                ],
              ),
            ),
            if (_selected == 1)
              Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'All Recipe',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                            // Text(
                            //   'Sorted by Cuisine',
                            //   style: TextStyle(color: Colors.grey[400]),
                            // )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15, top: 8),
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.tune,
                                size: 24,
                              ),
                            )),
                      )
                    ],
                  ),
                   */
                  FutureBuilder(
                    future: DatabaseQuery().getLikedFood(),
                    initialData: [],
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              FoodListModel element = snapshot.data[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FoodInfoCard(
                                                foodList: element,
                                                listName: "like",
                                                index: 0)));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    elevation: 5.0,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 25, bottom: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                child: Text(
                                                  element.foodName,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                element.cuisine,
                                                style: TextStyle(
                                                    color: Colors.grey[400]),
                                              ),
                                              // SizedBox(
                                              //   height: 5,
                                              // ),
                                              // Text(
                                              //   'A Sweet in India',
                                              //   style: TextStyle(
                                              //       color: Colors.grey[400]),
                                              // ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8, bottom: 10),
                                                child: Container(
                                                  color: Colors.black87,
                                                  height: 0.8,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.2,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.fastfood,
                                                    size: 12,
                                                  ),
                                                  SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(element.calories),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Icon(
                                                    Icons.radio_button_checked,
                                                    size: 12,
                                                  ),
                                                  Text(element.deter)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Container(
                                            height: 110,
                                            width: 110,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                image: DecorationImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            element.images),
                                                    fit: BoxFit.cover)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      else {
                        return Center(
                          child: SpinKitCircle(
                            color: Colors.blueAccent,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            if (_selected == 2)
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'All Reviews',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ), 
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15, top: 8),
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.tune,
                                size: 24,
                              ),
                            )),
                      )
                    ],
                  ),
                   */
                  SizedBox(
                    height: 15,
                  ),
                  FutureBuilder(
                    future: DatabaseService().getReviews(),
                    initialData: [],
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done)
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              DocumentSnapshot data = snapshot.data[index];
                              return Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Stack(
                                        overflow: Overflow.visible,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Text(
                                                  data.data()[
                                                      "restaurant_Name"],
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Text(
                                                  data.data()[
                                                      'restaurant_Location'],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[400]),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            120,
                                                    child: Text(
                                                      data.data()["text"],
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    )),
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 3, bottom: 3),
                                                    child: Text(
                                                      data.data()["rating"],
                                                      style: TextStyle(
                                                          fontSize: 14),
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
                                    padding:
                                        EdgeInsets.fromLTRB(20, 20, 20, 10),
                                    child: Divider(
                                      thickness: 0.8,
                                    ),
                                  )
                                ],
                              );
                            });
                      else {
                        return Center(
                          child: SpinKitCircle(
                            color: Colors.blueAccent,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
