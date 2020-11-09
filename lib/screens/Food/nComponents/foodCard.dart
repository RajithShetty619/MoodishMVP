import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/nComponents/foodInfoPage.dart';

class FoodCrd extends StatefulWidget {
  final FoodListModel foodList;
  const FoodCrd({
    Key key,
    this.foodList,
  }) : super(key: key);

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
                      foodList: widget.foodList,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.7,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      width: 215,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  widget.foodList.images),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      top: 160,
                      child: Container(
                        width: 220,
                        height: 140,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.foodList.foodName,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'American Cake',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey[400]),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                    'Red Velvet Cake, the queen of all layer cakes',
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
                                      Text('273 Calories',
                                          style: TextStyle(fontSize: 12)),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Icon(
                                        Icons.alarm,
                                        size: 12,
                                      ),
                                      Text('15 mins',
                                          style: TextStyle(fontSize: 12))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
