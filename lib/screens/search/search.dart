import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/searchFunction.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/components/TodaySpecial.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> { 
     String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container( 
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SearchBar<FoodListModel>(
            debounceDuration: Duration(seconds: 1),
            onSearch: SearchFunction().search,
            emptyWidget: Center(child: Text('not a thing found')),
            placeHolder: Center(child: Text('try searching a food by name or just by mood')),
            cancellationWidget: Icon(Icons.cancel,size: 45,color: Colors.grey[400],),
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
              backgroundColor: Colors.grey[400],
              padding: EdgeInsets.only(top: 5,left: 5,),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}