import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/screens/Restaurants/cuisine.dart';
import 'package:moodish_mvp/screens/mainScreen.dart';
class ShowScreen extends StatefulWidget {
  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  List<String> _state;
  Future<List<String>>openBox()async{
    Box box = await Hive.openBox('preferenceBox');
     _state =await box.get('preference');
     if(_state==null){
       await DatabaseService().checkPreference();
       _state =await box.get('preference');
     }
    return _state;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: openBox(),
      builder: (context,snapShot){
        
        if(snapShot.connectionState==ConnectionState.waiting)
          { 
            return Scaffold(
              body: Center(
                child: SpinKitHourGlass(
                  color: Colors.blueAccent,
                  size: 50.0,
                ),
              ),
            );
          }
        else
        if(snapShot.data==null)
          {
           return Cuisine();
          }
          return MainScreen();
      },
    );
  }
}
