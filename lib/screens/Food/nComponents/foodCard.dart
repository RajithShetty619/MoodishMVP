import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/nComponents/foodInfoPage.dart';

class FoodCrd extends StatefulWidget {
  final FoodListModel foodList;
  final int index;
  final String listName;
  const FoodCrd(
      {Key key, this.foodList, @required this.index, @required this.listName})
      : super(key: key);
  @override
  _FoodCrdState createState() => _FoodCrdState();
}

class _FoodCrdState extends State<FoodCrd> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FoodInfoCard(
                      index: widget.index,
                      foodList: widget.foodList,
                      listName: widget.listName,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.8,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.8,
                height: 175,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            widget.foodList.images),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                top: 150,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: MediaQuery.of(context).size.height/5.5,

                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text(
                          widget.foodList.foodName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          widget.foodList.cuisine,
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey[400]),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(widget.foodList.description,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[400])),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 8, top: 5, bottom: 5),
                          child: Container(
                            height: 0.8,
                            width: 210,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.fastfood,
                                size: 12,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(widget.foodList.calories,
                                  style: TextStyle(fontSize: 12)),
                              SizedBox(
                                width: 12,
                              ),
                              Icon(
                                Icons.alarm,
                                size: 12,
                              ),
                              Text(widget.foodList.time,
                                  style: TextStyle(fontSize: 12))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
