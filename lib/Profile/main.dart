import 'package:flutter/material.dart';
import 'profil.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        
        home: profile(),
        theme: ThemeData(
          textTheme: TextTheme(
         // bodyText1: TextStyle(color: Colors.white),
          //bodyText2: TextStyle(color: Colors.white),
        ).apply(
        //  bodyColor: Colors.white,
          //displayColor: Colors.white,
        ) ),
    );


  }
}