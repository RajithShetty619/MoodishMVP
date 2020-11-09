import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Restaurants/restauranthome.dart';

class Test extends StatefulWidget {
  final String payload;

  const Test({Key key, this.payload}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  double _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return RestaurantHome();
  }
}
