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
            var dat = jsonEncode(['Urban Tadka']);
            var data = await post(
                'https://snapinsight-test.herokuapp.com/predict_restaurant',
                headers: {'Content-Type': 'application/json'},
                body: dat);
            List<dynamic> datadd = jsonDecode(data.body);

            while (datadd.length > 5) {
              datadd.removeAt(Random().nextInt(datadd.length));
            }
            print(datadd);
            Query q = FirebaseFirestore.instance
                .collection('restaurants')
                .where("Restaurant_Name", whereIn: datadd);
            QuerySnapshot qs = await q.get();
            List<QueryDocumentSnapshot> list = qs.docs;

            list.map((e) => print(e.data()["Restaurant_Name"]));
          },
        ),
      ),
    );
  }
}
