import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/notification_helper.dart';

import 'package:moodish_mvp/models/messageObject.dart';
import 'package:moodish_mvp/test.dart';

//ADD IN FIREBASE CUSTOM DATA IN CLOUD MESSAGING
//click_action: FLUTTER_NOTIFICATION_CLICK
//REFER https://www.youtube.com/watch?v=wjJN1C9UxpY FOR ANY DOUBT

class Messaging extends StatefulWidget {
  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final notifications = FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  final List<Messages> messages = []; //Input message list

  @override
  void initState() {
    super.initState();

    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);

    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print("onMessage : $message");
      final notification = message['notification'];
      setState(() {
        messages.add(//adds message to message list
            Messages(title: notification['title'], body: notification['body']));
      });
    }, onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch : $message");
      showOngoingNotification(notifications, title: 'Tite', body: 'Body');
    }, onResume: (Map<String, dynamic> message) async {
      print("onResume : $message");
    });

    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestNotificationPermissions();
      // _firebaseMessaging.configure();

      _initialized = true;
    }
  }

  Future onSelectNotification(String payload) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => Test(payload: payload)));
    Box _box = await Hive.openBox('notif');
    _box.put('notif', payload);
    print(payload);
  }

  @override
  Widget build(BuildContext context) => ListView(
        children: messages.map(buildMessage).toList(), // to show message
      );

  Widget buildMessage(Messages message) => ListTile(
        title: Text(message.title), // to build message
        subtitle: Text(message.body), // to build message context
      );
}
