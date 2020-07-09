import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/food_info.dart';

class FoodEverySituation extends StatefulWidget {
  const FoodEverySituation({
    Key key,
    @required this.image,
    @required this.title,
    @required this.desc,
    @required this.cuisine,
    @required this.preptime,
    @required this.deter,
    @required this.nutrient,
    @required this.preparation,
    @required this.taste,
    @required this.mealtype,
  }) : super(key: key);

  final image;
  final title;
  final desc;
  final cuisine;
  final preptime;
  final deter;
  final nutrient;
  final preparation;
  final taste;
  final mealtype;

  @override
  _FoodEverySituationState createState() => _FoodEverySituationState();
}

class _FoodEverySituationState extends State<FoodEverySituation> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9 / 1.1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Food_Info(
                        name: widget.title,
                        descbox: widget.desc,
                        image: widget.image,
                        nutrient: widget.nutrient,
                        preparation: widget.preparation,
                        taste: widget.taste,
                        preptime: widget.preptime,
                        cuisine: widget.cuisine,
                        mealtype: widget.mealtype,
                      )));
        },
        child: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: widget.image,
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
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(height: 10),
                      Text(
                        widget.deter,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
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
