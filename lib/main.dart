import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/models/pollsModel.dart';
import 'package:moodish_mvp/screens/Food/blocs/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/blocs/pollsbloc/pollsBloc.dart';
import 'package:moodish_mvp/screens/Food/blocs/restBloc/restBloc.dart';
import 'package:moodish_mvp/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<FoodListModel>(FoodListModelAdapter());
  Hive.registerAdapter<PollsModel>(PollsModelAdapter());
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return StreamProvider<User>.value(
            value: Authenticate().onAuthChanged,
            child: MultiBlocProvider(
              providers: [
                BlocProvider<FoodBloc>(
                  create: (context) => FoodBloc(),
                ),
                BlocProvider<PollBloc>(
                  create: (context) => PollBloc(),
                ),
                BlocProvider<RestaurantBloc>(
                  create: (context) => RestaurantBloc(),
                ),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Moodish',
                home: Wrapper(),
              ),
            ),
          );
        else
          return Scaffold();
      },
    );
  }
}
