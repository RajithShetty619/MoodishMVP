import 'package:moodish_mvp/Authenticate/signIn.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/Services/persis_notification.dart';
import 'package:moodish_mvp/models/user.dart';
import 'package:moodish_mvp/screens/Food/pages/foodHome.dart';
import 'package:moodish_mvp/screens/Restaurants/cuisine.dart';
import 'package:moodish_mvp/screens/mainScreen.dart';
import 'package:moodish_mvp/showScreen.dart';
import 'package:moodish_mvp/test.dart';
import 'package:provider/provider.dart';

import 'Restaurants/mood.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final onAuthChanged = Provider.of<User>(context);
    if (onAuthChanged == null) {
      return SignIn();
    } else {
      return ShowScreen();
    }
  }
}
