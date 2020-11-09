import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodAbout extends StatefulWidget {
  FoodAbout({
    Key key,
    this.foodList,
  }) : super(key: key);
  final FoodListModel foodList;

  _FoodAboutState createState() => _FoodAboutState();
}

class _FoodAboutState extends State<FoodAbout> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(widget.foodList.description),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nutrients',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Calories',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Spacer(),
                      if (widget.foodList.calories != null)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  child: Text(
                                    widget.foodList.calories,
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                        ),
                      if (widget.foodList.calories == null)
                        Padding(
                            padding: EdgeInsets.all(8.0), child: Text('empty')),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Carbohydrates',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Spacer(),
                      if (widget.foodList.carbohydrates != null)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  child: Text(
                                    widget.foodList.carbohydrates,
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                        ),
                      if (widget.foodList.carbohydrates == null)
                        Padding(
                            padding: EdgeInsets.all(8.0), child: Text('empty')),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Proteins',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Spacer(),
                      if (widget.foodList.protein != null)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  child: Text(
                                    widget.foodList.protein,
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                        ),
                      if (widget.foodList.protein == null)
                        Padding(
                            padding: EdgeInsets.all(8.0), child: Text('empty')),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Fats',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Spacer(),
                      if (widget.foodList.fat != null)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  child: Text(
                                    widget.foodList.fat,
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                        ),
                      if (widget.foodList.fat == null)
                        Padding(
                            padding: EdgeInsets.all(8.0), child: Text('empty')),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Preparation Time',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Spacer(),
                      if (widget.foodList.time != null)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  child: Text(
                                    widget.foodList.time,
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                        ),
                      if (widget.foodList.time == null)
                        Padding(
                            padding: EdgeInsets.all(8.0), child: Text('empty')),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Cuisine',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Container(
                                width: MediaQuery.of(context).size.width / 3.5,
                                child: Text(
                                  widget.foodList.cuisine ?? '',
                                  overflow: TextOverflow.ellipsis,
                                ))),
                      ),
                      if (widget.foodList.cuisine == null)
                        Padding(
                            padding: EdgeInsets.all(8.0), child: Text('empty')),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Taste',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Spacer(),
                      if (widget.foodList.taste != null)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  child: Text(
                                    widget.foodList.taste,
                                    overflow: TextOverflow.ellipsis,
                                  ))),
                        ),
                      if (widget.foodList.taste == null)
                        Padding(
                            padding: EdgeInsets.all(8.0), child: Text('empty')),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
