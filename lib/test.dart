import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

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
                GeoFirePoint center =
                    geo.point(latitude: 19.0100664, longitude: 73.0371634);
                var collectionReference = _firestore.collection('places');
                GeoFirePoint myLocation =
                    geo.point(latitude: 19.0100664, longitude: 73.0371634);

                double radius = 1;
                String field = 'g';

                var stream = geo
                    .collection(collectionRef: collectionReference)
                    .within(center: center, radius: radius, field: 'g');
                stream.listen((event) {
                  event.map((e) => print(e.data()));
                });
              },
              child: Center(child: Text("press")),
            ),
          ],
        ),
      ),
    );
  }
}
