import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:moodish_mvp/Services/betaCount.dart';
import 'package:moodish_mvp/screens/Food/pages/explore.dart';
import 'package:moodish_mvp/screens/Food/pages/foodFeed.dart';

class FoodHome extends StatefulWidget {
  @override
  _FoodHomeState createState() => _FoodHomeState();
}

class _FoodHomeState extends State<FoodHome> {
  final Map<int, Widget> logowidgets = const <int, Widget>{
    0: Text('Feed'),
    1: Text('Explore'),
  };

  int grpValue = 0;
  String name;

  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: _switch ? Color.fromARGB(235, 253, 139, 25) : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _switch
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "${now.day}/${now.month}/${now.year},\n Hungry yet?",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 35,
                        width: 135,
                        child: CupertinoSlidingSegmentedControl(
                          children: logowidgets,
                          onValueChanged: (changeValue) async {
                            if (_switch == true) {
                              BetaCount().count(field: 'explore');
                            }
                            setState(() {
                              if (grpValue != changeValue) {
                                grpValue = changeValue;
                                _switch = !_switch;
                              }
                            });
                          },
                          groupValue: grpValue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: _switch
                    ? 0
                    : 1, // switch between Foo and Bar based on condition
                children: [
                  Explore(),
                  FoodFeed(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
