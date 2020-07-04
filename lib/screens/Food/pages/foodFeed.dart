import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/pages/explore.dart';

class FoodFeed extends StatefulWidget {
  @override
  _FoodFeedState createState() => _FoodFeedState();
}

class _FoodFeedState extends State<FoodFeed> {
  final Map<int, Widget> logowidgets = const <int, Widget>{
    0: Text('Feed'),
    1: Text('Explore'),
  };

  int grpValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Today ,\n Hungry yet?',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: Container(
                            //     height: 35,
                            //     width: 140,
                            //     child: CupertinoSlidingSegmentedControl(
                            //       children: logowidgets,
                            //       onValueChanged: (changeValue){

                            //         setState(() {
                            //           grpValue = changeValue;
                            //         });
                            //       },
                            //       groupValue: grpValue,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
