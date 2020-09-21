import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  Future<List<DocumentSnapshot>> getNotification() async {
    var _ref = FirebaseFirestore.instance.collection("notification");
    QuerySnapshot snapshot = await _ref.orderBy("sr_no").limit(10).get();
    List<DocumentSnapshot> doc = snapshot.docs;
    return doc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    size: MediaQuery.of(context).size.width / 10,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Notifications',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(
              thickness: 2.0,
            ),
          ),
          FutureBuilder(
            future: getNotification(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<DocumentSnapshot> notifList = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: notifList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // return Card(
                    //   child: Padding(
                    //       padding: EdgeInsets.all(10),
                    //       child: Text(notifList[index].data()["text"] ?? '')),
                    // );
                    return Card(
                      elevation: 2.0,
                      child: ListTile(
                        title: Text(notifList[index].data()["title"] ?? ''),
                        subtitle: Text(notifList[index].data()["text"] ?? ''),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: SpinKitCircle(
                    color: Colors.deepOrange,
                  ),
                );
              }
            },
          ),
        ],
      )),
    );
  }
}
