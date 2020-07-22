import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/searchFunction.dart';
import 'package:moodish_mvp/screens/Food/bloc/foodBloc.dart';

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
  final HttpsCallable callable = CloudFunctions.instance
      .getHttpsCallable(functionName: 'helloWorld')
        ..timeout = const Duration(seconds: 30);
  int _responseCount = 0;
  String text= ''; 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            TextFormField(
              onChanged: (e) {
                setState(() {
                  text = e;
                });
              },
            ),
            FlatButton(
              onPressed: () async {
                try {
                   dynamic res = await SearchFunction().search(text);
                   print(res);
                } catch (e) {
                  print('caught generic exception');
                  print(e);
                }
              },
              child: Text("call"),
            ),
          ],
        ),
      ),
    );
  }
}
