import 'package:cloud_functions/cloud_functions.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/Services/searchFunction.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/blocs/bloc/foodBloc.dart';
import 'package:http/http.dart';

class Test extends StatefulWidget {
  final String payload;

  const Test({Key key, this.payload}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Second page - Payload:',
                style: Theme.of(context).textTheme.title,
              ),
              const SizedBox(height: 8),
              Text(
               widget.payload,
                style: Theme.of(context).textTheme.subtitle,
              ),
              const SizedBox(height: 8),
              RaisedButton(
                child: Text('Back'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
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
              String token = await Authenticate().getToken();
              var data = await get(
                  'https://us-central1-moodishtest.cloudfunctions.net/restNotif?text=$token');
              
            },
            
            child: Center(child: Text("$count")),
          ),
        ),
      ),
    );
  }
}
