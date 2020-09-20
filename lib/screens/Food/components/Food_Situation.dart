import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodish_mvp/Services/betaCount.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/blocs/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/food_info.dart';

class FoodEverySituation extends StatefulWidget {
  const FoodEverySituation({
    Key key,
    this.foodList,
    this.listName,
    this.index,
  }) : super(key: key);

  final FoodListModel foodList;
  final String listName;
  final int index;
  @override
  _FoodEverySituationState createState() => _FoodEverySituationState();
}

class _FoodEverySituationState extends State<FoodEverySituation> {
  bool _like = false;

  @override
  Widget build(BuildContext context) {
    _like = widget.foodList.heart;
    return AspectRatio(
      aspectRatio: 0.9 / 1.1,
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
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient:
                        LinearGradient(begin: Alignment.bottomCenter, stops: [
                      .2,
                      .9
                    ], colors: [
                      Colors.black.withOpacity(.5),
                      Colors.black.withOpacity(.1),
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
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: IconButton(
                                icon: _like
                                    ? Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                        size: 25,
                                      )
                                    : Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                onPressed: () async {
                                  BetaCount().count(field: 'foodliked');
                                  setState(() {
                                    _like = !_like;
                                  });
                                  if (_like) {
                                    setState(() {
                                      BlocProvider.of<FoodBloc>(context).add(
                                          FoodEvent.like(
                                              widget.index, widget.listName));
                                    });
                                    await DatabaseService().likeTransction(
                                        food: widget.foodList,
                                        sr_no: widget.foodList.sr_no,
                                        collection: "food",
                                        field: "like");
                                  } else {
                                    setState(() {
                                      BlocProvider.of<FoodBloc>(context).add(
                                          FoodEvent.like(
                                              widget.index, widget.listName));
                                    });
                                    await DatabaseService().disLikeTransction(
                                        food: widget.foodList,
                                        sr_no: widget.foodList.sr_no,
                                        collection: "food",
                                        field: "like");
                                  }
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
                                  fontSize: 22,
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
                              // Container(
                              //   margin: EdgeInsets.all(5.0),
                              //   decoration: BoxDecoration(
                              //     border:
                              //         Border.all(color: Colors.white, width: 2),
                              //     borderRadius: BorderRadius.circular(300),
                              //   ),
                              // color: Colors.blue[300],
                              // child: IconButton(
                              //   icon: Icon(
                              //     Icons.arrow_forward,
                              //     color: Colors.white,
                              //     size: 25,
                              //   ),
                              //   onPressed: () {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => Food_Info(
                              //                   foodList: widget.foodList,
                              //                 )));
                              //   },
                              // ),
                              // ),
                            ],
                          ),
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
