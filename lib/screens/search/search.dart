import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/searchFunction.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/blocs/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/components/Food_Situation.dart';
import 'package:moodish_mvp/screens/Food/components/TodaySpecial.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    super.initState();
    setState(() {
      SearchFunction().recentSearch().then((future) {
        BlocProvider.of<FoodBloc>(context).add(FoodEvent.add(future, "search"));
      });
    });
  }

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
            placeHolder: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              margin: EdgeInsets.symmetric(vertical: 20),
              child: BlocConsumer<FoodBloc, Map<String, List<FoodListModel>>>(
                buildWhen: (Map<String, List<FoodListModel>> previous,
                    Map<String, List<FoodListModel>> current) {
                  return true;
                },
                listenWhen: (Map<String, List<FoodListModel>> previous,
                    Map<String, List<FoodListModel>> current) {
                  if (current.length > previous.length) {
                    return true;
                  }
                  return false;
                },
                builder: (BuildContext context, foodList) {
                  return Container(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: foodList["search"].length,
                      itemBuilder: (BuildContext context, index) {
                        if (foodList["search"].length == 0)
                          return SpinKitChasingDots(
                            color: Colors.deepOrange,
                          );
                        else
                          return FoodEverySituation(
                            foodList: foodList["search"][index],
                            index: index,
                            listName: "search",
                          );
                      },
                    ),
                  );
                },
                listener: (context, foodList) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Added!')),
                  );
                },
              ),
            ),
            cancellationWidget: Icon(
              Icons.cancel,
              size: 45,
              color: Colors.grey[400],
            ),
            onItemFound: (FoodListModel food, int index) {
              return Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 40),
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
              padding: EdgeInsets.only(
                top: 5,
                left: 5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
