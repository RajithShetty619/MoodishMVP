import 'package:cloud_functions/cloud_functions.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/Services/searchFunction.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/blocs/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/components/TodaySpecial.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box>(
      future: Hive.openBox('foodlist'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return BlocProvider<FoodBloc>(
            create: (context) => FoodBloc(),
            child: Scaffold(
              body: FoodList(),
            ),
          );
        }
        return Scaffold();
      },
    );
  }
}

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  String text = '';
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: FlatButton(
            onPressed: () async {
              await DatabaseService()
                  .likeTransction(collection: "pol", field: "like", sr_no: "3");
                  setState(() {
                    count++;
                  }); 
            },
            child: Center(child: Text("$count")),
          ),
        ),
      ),
    );
  }
}
