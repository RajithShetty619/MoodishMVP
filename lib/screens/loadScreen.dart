import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:intl/intl.dart';
import 'package:moodish_mvp/Services/geolocationRest.dart';
import 'package:moodish_mvp/screens/Food/events/restEvent.dart';
import 'package:moodish_mvp/screens/Restaurants/restBloc/restBloc.dart';
import 'package:moodish_mvp/screens/mainScreen.dart';
import 'Food/blocs/bloc/foodBloc.dart';
import 'Food/blocs/pollsbloc/pollsBloc.dart';
import 'Food/events/foodEvent.dart';
import 'Food/events/pollsEvent.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future loadAllData() async {
    await GeolocationRest()
        .getRestFromLocation(context)
        .then((value) => GeolocationRest()
            .getRestFromLocationCuisine(context, "North Indian", "1"))
        .then((value) => GeolocationRest()
            .getRestFromLocationCuisine(context, "Italian", "2"))
        .then((value) => GeolocationRest()
            .getRestFromLocationCuisine(context, "Continental", "3"))
        .then((value) => GeolocationRest()
            .getRestFromLocationCuisine(context, "Desserts", "4"))
        .then((value) => GeolocationRest()
            .getRestFromLocationCuisine(context, "Fast Food", "5"));
    Box _box = await Hive.openBox("preferenceBox");
    String deter = _box.get("deter");
    await DatabaseService().returnUser();
    if (deter != "veg" && deter != "nonveg") {
      Random random = new Random();
      int randomNumber = random.nextInt(2);
      if (randomNumber == 1)
        deter = "veg";
      else
        deter = "nonveg";
    }
    DatabaseQuery _dqtaste2 = DatabaseQuery(listName: "d2");
    DatabaseQuery _dqtaste0 = DatabaseQuery(listName: "d0");
    DatabaseQuery _dqtaste1 = DatabaseQuery(listName: "d1");
    await Future.wait([
      DatabaseQuery(listName: 'p').getPoll().then((poll) {
        BlocProvider.of<PollBloc>(context).add(PollEvent.add(poll, 'p'));
      }),
      DatabaseQuery(listName: 'yn').getYesno().then((yesno) {
        BlocProvider.of<PollBloc>(context).add(PollEvent.add(yesno, 'yn'));
      }),
      DatabaseQuery(listName: 'tt').getthis_that().then((thisthat) {
        BlocProvider.of<PollBloc>(context).add(PollEvent.add(thisthat, 'tt'));
      }),
      DatabaseQuery(listName: 'fft').getFact().then((fact) {
        BlocProvider.of<PollBloc>(context).add(PollEvent.add(fact, 'fft'));
      }),
      checkDate().then((check) async {
        _dqtaste2.getFood(
            field: ['cuisine'],
            value: ['indian'],
            limit: 7,
            check: check).then((future) {
          BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "d2"));
        });
        _dqtaste0.getFood(
            field: ['cuisine', 'deter'],
            value: ['indian', 'veg'],
            limit: 7,
            check: check).then((future) {
          BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "d0"));
        });
      }),
    ]);
  }

  Future<int> checkDate() async {
    Box _box = await Hive.openBox("date");
    String saveDate = await _box.get("date1");
    DateTime now = DateTime.now();
    String date = DateFormat('EEE, M/d/y').format(now);

    if (date == saveDate) {
      return 1;
    } else {
      _box.put("date1", date);
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadAllData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MainScreen();
        } else {
          return Scaffold(
            body: Center(
              child: SpinKitCircle(
                color: Colors.deepOrange,
              ),
            ),
          );
        }
      },
    );
  }
}
