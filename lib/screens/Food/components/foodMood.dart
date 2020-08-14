import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/Services/betaCount.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/food_info.dart';

class Mood_Food extends StatefulWidget {
  const Mood_Food({
    Key key,
    this.foodList,
  }) : super(key: key);

  final FoodListModel foodList;

  @override
  _Mood_FoodState createState() => _Mood_FoodState();
}

class _Mood_FoodState extends State<Mood_Food> {
  bool _like = true;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9 / 1.2,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Food_Info(
                        foodList: widget.foodList,
                      )));
        },
        child: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: widget.foodList.images,
              imageBuilder: (context, imageProvider) {
                return Container(
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )),
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient:
                        LinearGradient(begin: Alignment.bottomCenter, stops: [
                      .1,
                      .6
                    ], colors: [
                      Colors.black.withOpacity(.7),
                      Colors.black.withOpacity(.3),
                    ])),
                child: Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          // margin: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: IconButton(
                                icon: _like
                                    ? Icon(
                                        Icons.favorite_border,
                                        color: Colors.black,
                                        size: 30,
                                      )
                                    : Icon(
                                        Icons.favorite,
                                        color: Colors.red[700],
                                        size: 30,
                                      ),
                                onPressed: () async {
                                  if (!_like) {
                                    await DatabaseService().likeTransction(
                                        sr_no: widget.foodList.sr_no,
                                        collection: "food",
                                        field: "like");
                                    await BetaCount().count(field: 'situation');
                                  }
                                  setState(() {
                                    _like = !_like;
                                  });
                                }),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              widget.foodList.foodName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                widget.foodList.cuisine,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Container(
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(300),
                                ),
                                // color: Colors.blue[300],
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Food_Info(
                                                  foodList: widget.foodList,
                                                )));
                                  },
                                ),
                              ),
                            ],
                          ),

                          // SizedBox(height: 10),
                          /* Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        FlatButton.icon(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.info_outline,
                                              color: Colors.white,
                                            ),
                                            label: Text(
                                              'More info',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                        FlatButton.icon(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.filter_center_focus,
                                              color: Colors.white,
                                            ),
                                            label: Text(
                                              'Filter',
                                              style: TextStyle(color: Colors.white),
                                            ))
                                      ],
                                    ),*/
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
