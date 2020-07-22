import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          onPressed: () async {
            try {
              final HttpsCallableResult result = await callable.call(
                <String, dynamic>{
                  'message': 'hello world!',
                  'count': _responseCount,
                },
              );
              print(result.data);
            } on CloudFunctionsException catch (e) {
              print('caught firebase functions exception');
              print(e.code);
              print(e.message);
              print(e.details);
            } catch (e) {
              print('caught generic exception');
              print(e);
            }
          },
          child: Text("call"),
        ),
      ),
    );
  }
}
