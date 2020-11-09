import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:intl/intl.dart';
import 'package:moodish_mvp/Services/geolocationRest.dart';
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
    List<dynamic> cuisine = _box.get("preference");
    String tod = timeOfTheDay();
    String cuisine_sel = cuisine[Random().nextInt(cuisine.length)];

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
      DatabaseQuery(listName: 'tod').getFood(
        field: ['mealtype', 'deter'],
        value: ["breakfast", deter],
        limit: 7,
      ).then((future) {
        BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "tod"));
      }),
      checkDate().then((check) async {
        DatabaseQuery(listName: 'craving').getFood(
            field: ['cuisine'],
            value: [cuisine_sel],
            limit: 7,
            check: 0).then((future) {
          BlocProvider.of<FoodBloc>(context)
              .add(FoodEvent.add(future, "craving"));
        });
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
        DatabaseQuery(listName: 'trend').getTrending().then((future) {
          BlocProvider.of<FoodBloc>(context)
              .add(FoodEvent.add(future, "trend"));
        });
      }),
    ]);
  }

  String timeOfTheDay() {
    DateTime now = DateTime.now();
    DateTime morn = DateTime.parse("2000-05-04 06:00:04Z");
    DateTime aftr = DateTime.parse("2000-05-04 12:00:04Z");
    DateTime even = DateTime.parse("2000-05-04 16:00:04Z");
    DateTime night = DateTime.parse("2000-05-04 20:00:04Z");
    if (now.hour <= aftr.hour && now.hour >= morn.hour) {
      // setState(() {
      //   greeting = 'Morning';
      //   print(greeting);
      // });
      return "breakfast";
    } else if (now.hour <= even.hour && now.hour >= aftr.hour) {
      // setState(() {
      //   greeting = 'AfterNoon';
      // });
      return "main course";
    } else if (now.hour <= night.hour && now.hour >= even.hour) {
      // setState(() {
      //   greeting = 'Evening';
      // });
      return "Snack";
    } else {
      // setState(() {
      //   greeting = 'Night Snacks';
      // });
      return "side dish";
    }
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
