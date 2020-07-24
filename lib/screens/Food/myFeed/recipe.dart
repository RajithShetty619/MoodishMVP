import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/food_info.dart';

class RecipeTab extends StatefulWidget {
  final FoodListModel foodList;

  const RecipeTab({Key key, this.foodList}) : super(key: key);
  @override
  _RecipeTabState createState() => _RecipeTabState();
}

class _RecipeTabState extends State<RecipeTab> {
  @override
  Widget build(BuildContext context) {
    return getListview(foodList: widget.foodList);
  }
}

class getListview extends StatefulWidget {

  final FoodListModel foodList;
  const getListview({Key key, this.foodList}) : super(key: key);
  @override
  _getListviewState createState() => _getListviewState();
}

class _getListviewState extends State<getListview> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10.0),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: <Widget>[
               CachedNetworkImage(
              imageUrl: widget.foodList.images,
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      )),
                );
              },
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.foodList.foodName, 
                          overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize:widget.foodList.foodName.length<=15 ?22.0:18.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.foodList.cuisine,
                            style: TextStyle(
                              fontSize: 18,
                            ),),)
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.foodList.deter,
                            style: TextStyle(
                              fontSize: 18,
                            )
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(300),
                          ),
                          // color: Colors.blue[300],
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Food_Info(
                                        foodList: widget.foodList
                                      )));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeCard {
  String image;
  String title;
  String cuisine;
  String name;

  RecipeCard({this.image, this.title, this.cuisine, this.name});
}
