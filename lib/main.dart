import 'package:flutter/material.dart'; 
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/models/user.dart';
import 'package:moodish_mvp/screens/wrapper.dart';
import 'package:moodish_mvp/test.dart';
import 'package:provider/provider.dart';

void main() {
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
        home: Wrapper(),
        
      ), 
    );
  }
}
