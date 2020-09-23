import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';

class Test extends StatefulWidget {
  final String payload;

  const Test({Key key, this.payload}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  getRestFromList(List<String> list) async {
    list = list
        .map((e) => e
            .split(" ")
            .map((str) => '${str[0].toUpperCase()}${str.substring(1)}')
            .join(" "))
        .toList();
    List<String> data = [];
    for (int i = 0; i < 5; i++) {
      data.add(list[i]);
    }
    print(data);
    CollectionReference _ref =
        FirebaseFirestore.instance.collection('restaurants');
    Query q = _ref.where("Restaurant_Name", whereIn: data);
    QuerySnapshot snapshot = await q.get();
    print(snapshot.docs);
    List<RestListModel> _rest =
        await DatabaseService().listfromSnapshot(snapshot);
    return _rest;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlatButton(
          onPressed: () async {
            List<String> data = [
              "Pritam Da Dhaba",
              "Gomantak",
              "Angrezi Dhaba",
              "Copper Chimney",
              "Persian Darbar",
              "Lucky Restaurant",
              "Gulshan-e-Iran",
              "Butter Chicken Factory",
              "Papa Pancho Da Dhaba",
              "Faham Restaurant & Lounge",
              "Khyber",
              "Hitchki",
              "Light Of Bharat"
            ];
            await getRestFromList(data);
          },
          child: Center(
            child: (Text("wow")),
          )),
    );
  }
}
