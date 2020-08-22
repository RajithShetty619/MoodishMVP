import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:moodish_mvp/Services/notification_helper.dart';
import 'package:moodish_mvp/test.dart';

class Persistent_notification extends StatefulWidget {
  @override
  _Persistent_notificationState createState() => _Persistent_notificationState();
}

class _Persistent_notificationState extends State<Persistent_notification> {

  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async => await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Test(payload: payload)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              RaisedButton(
                child: Text('Show notification'),
                onPressed: () => showOngoingNotification(notifications,
                    title: 'Tite', body: 'Body'),
              ),
              RaisedButton(
                child: Text('Replace notification'),
                onPressed: () => showOngoingNotification(notifications,
                    title: 'ReplacedTitle', body: 'ReplacedBody'),
              ),
              // RaisedButton(
              //   child: Text('Other notification'),
              //   onPressed: () => showOngoingNotification(notifications,
              //       title: 'OtherTitle', body: 'OtherBody', id: 20),
              // ),
              // const SizedBox(height: 32),
              // title('Feautures'),
              // RaisedButton(
              //   child: Text('Silent notification'),
              //   onPressed: () => showSilentNotification(notifications,
              //       title: 'SilentTitle', body: 'SilentBody', id: 30),
              // ),
              // const SizedBox(height: 32),
              // title(t:'Cancel'),
              RaisedButton(
                child: Text('Cancel all notification'),
                onPressed: notifications.cancelAll,
              ),
            ],
          ),
        ),
    );
  }
}