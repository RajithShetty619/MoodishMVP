//import 'package:flutter/material.dart';
//import 'package:moodish_mvp/screens/Restaurants/restaurantCard/homepage.dart';
//
//class TopRated extends StatefulWidget {
//  @override
//  _TopRatedState createState() => _TopRatedState();
//}
//
//class _TopRatedState extends State<TopRated> {
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: SafeArea(
//      child: ListView.builder(
//          scrollDirection: Axis.vertical,
//          shrinkWrap: true,
//          physics: BouncingScrollPhysics(),
//          itemCount: rest.length,
//          itemBuilder: (context, index) {
//            return Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  if (index == 0)
//                    Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Align(
//                            alignment: Alignment.topLeft,
//                            child: IconButton(
//                                icon: Icon(
//                                  Icons.arrow_back,
//                                  size: 40,
//                                  color: Colors.black,
//                                ),
//                                onPressed: () {
//                                  Navigator.pop(context);
//                                }),
//                          ),
//                          SizedBox(
//                            height: 5.0,
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.all(10.0),
//                            child: TextField(
//                              autocorrect: true,
//                              style: TextStyle(color: Colors.white),
//                              decoration: InputDecoration(
//                                hintText: 'Where do you want to go?',
//                                hintStyle: TextStyle(color: Colors.white),
//                                prefixIcon: Icon(
//                                  Icons.search,
//                                  color: Colors.white,
//                                ),
//                                filled: true,
//                                fillColor: Colors.black,
//                                enabledBorder: OutlineInputBorder(
//                                  borderRadius: BorderRadius.circular(30.0),
//                                ),
//                                focusedBorder: OutlineInputBorder(
//                                  borderRadius: BorderRadius.circular(30.0),
//                                ),
//                              ),
//                            ),
//                          ),
//                          Center(
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: <Widget>[
//                                Icon(Icons.location_on),
//                                Text('Mumbai,Maharashtra')
//                              ],
//                            ),
//                          ),
//                          SizedBox(
//                            height: 10.0,
//                          ),
//                          Padding(
//                            padding: EdgeInsets.only(
//                                top: 10.0,
//                                left: 30.0,
//                                right: 30.0,
//                                bottom: 10.0),
//                            child: Container(
//                              height: 180,
//                              width: double.maxFinite,
//                              decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(30.0),
//                                image: DecorationImage(
//                                    image: AssetImage('assets/Top_Rated.png'),
//                                    fit: BoxFit.cover),
//                              ),
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: <Widget>[
//                                  SizedBox(
//                                    height: 5.0,
//                                  ),
//                                  Container(
//                                    child: Text(
//                                      'Top Rated',
//                                      style: TextStyle(
//                                          fontSize: 30.0,
//                                          fontWeight: FontWeight.bold,
//                                          color: Colors.white),
//                                    ),
//                                  ),
//                                  Container(
//                                      child: Text(
//                                    '5+ Options',
//                                    style: TextStyle(color: Colors.white),
//                                  )),
//                                  SizedBox(
//                                    height: 10.0,
//                                  )
//                                ],
//                              ),
//                            ),
//                          ),
//                          Container(
//                            alignment: Alignment.centerLeft,
//                            child: Container(
////                                    width: 175.0,
////                                    margin: EdgeInsets.all(10.0),
////                                    decoration: BoxDecoration(
////                                        border: Border.all(color: Colors.transparent),
////                                        color: Colors.orange[200]
////                                    ),
//                              child: Padding(
//                                padding: const EdgeInsets.all(5.0),
//                                child: Text(
//                                  'Top Restaurants :',
//                                  textAlign: TextAlign.center,
//                                  style: TextStyle(
//                                      fontSize: 20.0,
//                                      fontWeight: FontWeight.bold),
//                                ),
//                              ),
//                            ),
//                          )
//                        ]),
//                  GestureDetector(
//                    onTap: () {
//                      // Navigator.push(context,
//                      //     MaterialPageRoute(builder: (context) {
//                      //       return HomePage(desc: rest[index].desc,imgName: rest[index].image,imgName1: rest[index].image1,imgName2: rest[index].image2,restName: rest[index].name,);
//                      //     }));
//                    },
//                    child: Card(
//                        elevation: 1.0,
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(10.0)),
//                        child: Row(
//                          children: <Widget>[
//                            Padding(
//                              padding: const EdgeInsets.all(10.0),
//                              child: Container(
//                                alignment: Alignment.centerLeft,
//                                height: 100,
//                                width: 100.0,
//                                decoration: BoxDecoration(
//                                  borderRadius: BorderRadius.circular(30.0),
//                                  image: DecorationImage(
//                                      image: AssetImage(
//                                          'assets/${rest[index].image}'),
//                                      fit: BoxFit.cover),
//                                ),
//                              ),
//                            ),
//                            Expanded(
//                              child: Padding(
//                                padding: const EdgeInsets.all(20.0),
//                                child: Column(
//                                  children: <Widget>[
//                                    Container(
//                                      alignment: Alignment.centerLeft,
//                                      child: Text(
//                                        rest[index].name,
//                                        style: TextStyle(
//                                            fontSize: 22.0,
//                                            fontWeight: FontWeight.bold),
//                                      ),
//                                    ),
//                                    Container(
//                                        alignment: Alignment.centerLeft,
//                                        child: Text('\u{02605}4.2')),
//                                    SizedBox(
//                                      height: 5.0,
//                                    ),
//                                    Container(
//                                        alignment: Alignment.centerLeft,
//                                        child: Text(rest[index].desc)),
//                                  ],
//                                ),
//                              ),
//                            )
//                          ],
//                        )),
//                  ),
//                ]);
//          }),
//    ));
//  }
//}
//
//class _Restaurants {
//  String image;
//  String name;
//  String desc;
//  String image1;
//  String image2;
//
//  _Restaurants({this.image, this.name, this.desc, this.image1, this.image2});
//}
