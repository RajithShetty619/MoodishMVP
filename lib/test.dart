import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/screens/Restaurants/restauranthome.dart';
import 'package:http/http.dart';

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
    return Scaffold(
      body: Center(
        child: FlatButton.icon(
          icon: Icon(Icons.ac_unit),
          label: Text("data"),
          onPressed: () async {
            await DatabaseService().restRecommendApiFood(foodName: 'Aamrus');
          },
        ),
      ),
    );
  }
}
