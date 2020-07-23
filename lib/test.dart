import 'package:cloud_functions/cloud_functions.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/searchFunction.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/bloc/foodBloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container( 
          child: SearchBar<FoodListModel>(
            debounceDuration: Duration(seconds: 1),
            onSearch: SearchFunction().search,
            emptyWidget: Center(child: Text('not a thing found')),
            cancellationWidget: Icon(Icons.cancel,size: 40,),
            onItemFound: (FoodListModel food, int index) { 
              return Container(
                alignment: Alignment.topCenter,
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Center(child: TodaySpecial(foodList: food)));
            },
            onError: (e) {
              print(e);
              return Center(
                child: Text("error"),
              );
            },
            textStyle: TextStyle(
              color: Colors.grey[100],
            ),
            minimumChars: 4,
            hintText: "Search for items by name,mood or mealtype  ",
            hintStyle: TextStyle(
              color: Colors.grey[100],
            ),
            loader: Center(
                child: SpinKitFadingCircle(
              color: Colors.blueAccent,
            )),
            searchBarStyle: SearchBarStyle(
              backgroundColor: Colors.grey[500],
              padding: EdgeInsets.all(10),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
