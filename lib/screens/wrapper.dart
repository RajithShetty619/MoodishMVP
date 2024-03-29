import 'package:firebase_auth/firebase_auth.dart';
import 'package:moodish_mvp/Authenticate/signIn.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/pages/foodHome.dart';
import 'package:moodish_mvp/showScreen.dart';
import 'package:moodish_mvp/test.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User onAuthChanged = Provider.of<User>(context);
    if (onAuthChanged == null) {
      return SignIn();
    } else {
      return ShowScreen();
    }
  }
}
