import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:moodish_mvp/screens/Food/pages/explore.dart';
import 'package:moodish_mvp/screens/Food/pages/foodFeed.dart';

class FoodHome extends StatefulWidget {
  @override
  _FoodHomeState createState() => _FoodHomeState();
}

class _FoodHomeState extends State<FoodHome> {
  final _key = GlobalKey();

  final Map<int, Widget> logowidgets = const <int, Widget>{
    0: Text('Feed'),
    1: Text('Explore'),
  };

  int grpValue = 0;

  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 35,
              width: 140,
              child: CupertinoSlidingSegmentedControl(
                children: logowidgets,
                onValueChanged: (changeValue) {
                  setState(() {
                    grpValue = changeValue;
                    _switch = !_switch;
                  });
                },
                groupValue: grpValue,
              ),
            ),
            _switch ? Expanded(child: FoodFeed()) : Expanded(child: Explore()),
          ],
        ),
      ),
    );
  }
}
