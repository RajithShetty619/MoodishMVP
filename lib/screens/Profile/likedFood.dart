import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/components/Food_Situation.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/food_info.dart';
import 'package:moodish_mvp/screens/Food/nComponents/foodCard.dart';

class LikedFood extends StatefulWidget {
  @override
  _LikedFoodState createState() => _LikedFoodState();
}

class _LikedFoodState extends State<LikedFood> {
  List<FoodListModel> foodList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    size: MediaQuery.of(context).size.width / 10,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Liked Food',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(
              thickness: 2.0,
            ),
          ),
          FutureBuilder(
            future: DatabaseQuery().getLikedFood(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                foodList = snapshot.data;
                print(foodList.length);
                return foodList.length == 0
                    ? Container(
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: Center(
                          child: Text(
                            'No Food Liked Yet!',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 575,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                              ),
                              itemCount: foodList.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) {
                                return FoodEverySituation(
                                  foodList: foodList[index],
                                  index: index,
                                  listName: "search",
                                );
                              }),
                        ),
                      );
              } else {
                return Center(
                  child: SpinKitCircle(
                    color: Colors.blueAccent,
                  ),
                );
              }
            },
          ),
        ],
      )),
    );
  }
}
