import 'package:moodish_mvp/Authenticate/signIn.dart';
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/user.dart';
import 'package:moodish_mvp/screens/mainScreen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onAuthChanged = Provider.of<User>(context);
    if(onAuthChanged == null){
      return SignIn();
    }
    else{
      return MainScreen();
    }
  }
}