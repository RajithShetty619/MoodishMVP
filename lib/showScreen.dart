import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Authenticate/loading.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/introScreen.dart';
import 'package:moodish_mvp/screens/Restaurants/cuisine.dart';
import 'package:moodish_mvp/screens/loadScreen.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/homepage.dart';
import 'package:moodish_mvp/screens/mainScreen.dart';

class ShowScreen extends StatefulWidget {
  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  List<dynamic> _state;
  Future<List<dynamic>> openBox() async {
    Box box = await Hive.openBox('preferenceBox');
    _state = await box.get('preference');
    if (_state == null) {
      await DatabaseService().checkPreference();
      _state = await box.get('preference');
    }
    return _state;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: openBox(),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: SpinKitCircle(
                color: Colors.deepOrange,
                size: 50.0,
              ),
            ),
          );
        } else if (snapShot.data == null) {
          return IntroScreen();
        }
        return ShowScreen();
      },
    );
  }
}
