import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:http/http.dart';

class Test extends StatefulWidget {
  final String payload;

  const Test({Key key, this.payload}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final geo = Geoflutterfire();
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Second page - Payload:',
            ),
            const SizedBox(height: 8),
            RaisedButton(
              onPressed: () async {
                // Create a geoFirePoint

                var data = await get(
                    "https://us-central1-moodishtest.cloudfunctions.net/returnRestaurants?lat=18.9580734&long=72.8322506");
              },
              child: Center(child: Text("press")),
            ),
          ],
        ),
      ),
    );
  }
}

class StreamHandling {
  final geo = Geoflutterfire();
  final _firestore = FirebaseFirestore.instance;

  Stream<List<DocumentSnapshot>> getData() {
    GeoFirePoint center =
        geo.point(latitude: 19.0100664, longitude: 73.0371634);
    var collectionReference = _firestore.collection('restaurants');
    GeoFirePoint myLocation =
        geo.point(latitude: 19.0100664, longitude: 73.0371634);

    double radius = 3;

    var stream = geo
        .collection(collectionRef: collectionReference)
        .within(center: center, radius: radius, field: 'g');
    stream.listen((event) {
      event.map((e) {
        e.data().forEach((key, value) {
          print(key);
        });
      });
    });
    return stream;
  }
}
