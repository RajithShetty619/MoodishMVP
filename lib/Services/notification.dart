import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/models///messageObject.dart';
//ADD IN FIREBASE CUSTOM DATA IN CLOUD MESSAGING
//click_action: FLUTTER_NOTIFICATION_CLICK
//REFER https://www.youtube.com/watch?v=wjJN1C9UxpY FOR ANY DOUBT

class Messaging extends StatefulWidget {
  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];//Input message list

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async{
        print("onMessage : $message");
        final notification = message['notification'];
        setState(() {
          messages.add(//adds message to message list
            Message(
              title: notification['title'],body: notification['body']
            )
          );
        });
      },
      onLaunch: (Map<String, dynamic> message) async{
      print("onLaunch : $message");
      },
      onResume: (Map<String, dynamic> message) async{
      print("onResume : $message");
    }
    );
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true,alert: true)
    );

  }
  @override
  Widget build(BuildContext context) => ListView(
    children: messages.map(buildMessage).toList(),// to show message
  );

  Widget buildMessage(Message message) => ListTile(
    title: Text(message.title),// to build message
    subtitle: Text(message.body),// to build message context
  );

}
