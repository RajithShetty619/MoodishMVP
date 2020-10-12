import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  final String payload;

  const Test({Key key, this.payload}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: () async {
              CollectionReference _ref =
                  FirebaseFirestore.instance.collection("test");
              Query q =
                  _ref.where("mood", arrayContainsAny: ["happy", "angry"]);
              QuerySnapshot qs = await q.get();
              List<DocumentSnapshot> doc = qs.docs;
              print(doc);
            },
            child: Text("data")),
      ),
    );
  }
}
