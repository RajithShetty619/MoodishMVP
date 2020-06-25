import 'package:flutter/material.dart'; 
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/models/user.dart';
import 'package:moodish_mvp/screens/wrapper.dart';
import 'package:moodish_mvp/test.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<FoodListModel>(FoodListModelAdapter());
  runApp(MaterialApp(  
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authenticate().onAuthChanged,
      child: MaterialApp( 
        debugShowCheckedModeBanner: false,
        title: 'Moodish',
        home: Test(),
        
      ), 
    );
  }
}
