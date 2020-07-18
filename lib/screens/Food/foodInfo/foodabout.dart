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
  List<String> items = [
    'Best Known For :',
    'Cuisines Served :',
    'Hygiene :',
    'Offers :'
  ];
  List<String> nutri = ['Carbs.png', 'Protien.png', 'Fats.png', 'Sugar.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: foodAbout(
        foodList: widget.foodList,
        nutri: nutri,
      ),
    );
  }
}

class foodAbout extends StatelessWidget {
  const foodAbout({
    Key key,
    this.foodList,
    this.nutri

  }) : super(key: key);

  final FoodListModel foodList;
  final nutri;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(foodList.description),
                    ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Calories',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(foodList.calories),
                    )
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nutrients',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 80.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/${nutri[0]}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text('${foodList.carbohydrates} Carbs' )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              height: 80.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/${nutri[1]}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text('${foodList.protein} Protien')
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              height: 80.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/${nutri[2]}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text('${foodList.fat} Fats')
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        // Column(
                        //   children: <Widget>[
                        //     Container(
                        //       height: 80.0,
                        //       width: 80.0,
                        //       decoration: BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         image: DecorationImage(
                        //           image: AssetImage('assets/${nutri[3]}'),
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: 7.0,
                        //     ),
                        //     Text('${foodList.calories} Sugar')
                        //   ],
                        // ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Preparation Time',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                   if(foodList.preparation != null) 
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child:Text(foodList.time)),
                  ),
                  if(foodList.preparation == null)
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child:Text('empty')),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Cuisine',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                 Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child:Text(foodList.cuisine)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Taste',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(foodList.taste),
                    )
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
