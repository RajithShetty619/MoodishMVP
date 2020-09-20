import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  final String payload;

  const Test({Key key, this.payload}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
// Replace the "TODO" with this widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlatButton(
          onPressed: () async {
            DocumentSnapshot data = await FirebaseFirestore.instance
                .collection("Sheet 1")
                .doc("21")
                .get();
            dynamic _data = data.data();
            print(_data["restaurants"]);
            List<String> stringList =
                (jsonDecode(_data["restaurants"]) as List<dynamic>)
                    .cast<String>();
          },
          child: Center(
            child: (Text("wow")),
          )),
    );
  }
}
