import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/databaseQuery.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/blocs/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/food_info.dart';

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
                          height: MediaQuery.of(context).size.height / 1.35,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      childAspectRatio: 1.2),
                              itemCount: foodList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Stack(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Food_Info(foodList: foodList[index],)));
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl: foodList[index].images,
                                          imageBuilder:
                                              (context, imageProvider) {
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  )),
                                            );
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        top: MediaQuery.of(context).size.height/4.7,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Text(
                                                foodList[index].foodName,
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: Text(
                                                foodList[index].cuisine, //
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            17,
                                                    color: Colors.white),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        left: MediaQuery.of(context).size.width/2.5,
                                        top: 10,
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.pink,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
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
