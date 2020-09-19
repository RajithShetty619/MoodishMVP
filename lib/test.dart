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
   double latitudeC;
  double longitudeC;
  double latitudeP;
  double longitudeP;
  StreamHandling({this.longitudeP,this.latitudeP,this.longitudeC,this.latitudeC});
  Stream<List<DocumentSnapshot>> getData() {
    GeoFirePoint center =
        geo.point(latitude: latitudeC, longitude: longitudeC);
    var collectionReference = _firestore.collection('restaurants');
    GeoFirePoint myLocation =
        geo.point(latitude: latitudeP, longitude: longitudeP);

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
