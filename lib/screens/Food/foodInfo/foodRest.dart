import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/restCardModel.dart';
import 'package:page_transition/page_transition.dart';

class FoodRest extends StatefulWidget {
  final FoodListModel foodList;
  FoodRest({this.foodList});
  @override
  _FoodRestState createState() => _FoodRestState();
}

class _FoodRestState extends State<FoodRest> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseService().getRestFromList(widget.foodList.restaurants),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<RestListModel> _rest = snapshot.data;
          if (_rest != null)
            return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                itemCount: _rest.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: RestCardModel()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: _rest[index].photo_url,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  height: 120,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                );
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                190,
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              _rest[index].restaurant_Name,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, bottom: 8),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                          ),
                                          _rest[index].rating == '5'
                                              ? Text(
                                                  '${_rest[index].rating}.0',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )
                                              : Text(
                                                  _rest[index].rating,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 145,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        _rest[index].cuisines,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_on,
                                            size: 20,
                                          ),
                                          Text(
                                              _rest[index].restaurant_Location),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          else {
            return Center(
              child: Container(
                child: Text("More restaurants coming soon"),
              ),
            );
          }
        } else {
          return Center(
            child: SpinKitChasingDots(
              color: Colors.blueAccent,
            ),
          );
        }
      },
    );
  }
}
