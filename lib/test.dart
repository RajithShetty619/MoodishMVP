import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/mapview.dart';

class Test extends StatefulWidget {
  final String payload;

  const Test({Key key, this.payload}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return MapView(
        "11, Vikas Building, Bank Street, Near, Horniman Circle, Kala Ghoda, Fort, Mumbai, Maharashtra 400001, India");
  }
}
