import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:moodish_mvp/screens/Food/components/stepSlider.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodRecipe extends StatefulWidget {
  final Widget child;

  FoodRecipe({
    Key key,
    this.child,
    @required this.preparation,
    @required this.taste,
    @required this.preptime,
    @required this.cuisine,
    @required this.nutrient,
    }) : super(key: key);
    final preparation;
    final taste;
    final preptime;
    final cuisine;
    final nutrient;

  _FoodRecipeState createState() => _FoodRecipeState();
}

class _FoodRecipeState extends State<FoodRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                        child:Text(widget.cuisine,
                          style: TextStyle(
                            fontSize: 18
                          ),
                        )),
                  ),
                      SizedBox(height: 10.0),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Nutrients',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                             Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child:Text(widget.nutrient,
                          style: TextStyle(
                            fontSize: 18
                          ),
                        )),
                  ),

                            // Row(
                            //   children: <Widget>[
                            //     SizedBox(
                            //       width: 20.0,
                            //     ),
                            //     Column(
                            //       children: <Widget>[
                            //         Row(
                            //           children: <Widget>[
                            //             Icon(
                            //               Icons.check,
                            //               size: 20.0,
                            //             ),
                            //             Text('1/2 Cup Milk')
                            //           ],
                            //         ),
                            //         Row(
                            //           children: <Widget>[
                            //             Icon(
                            //               Icons.check,
                            //               size: 20.0,
                            //             ),
                            //             Text('1/2 Cup Milk')
                            //           ],
                            //         ),
                            //         Row(
                            //           children: <Widget>[
                            //             Icon(
                            //               Icons.check,
                            //               size: 20.0,
                            //             ),
                            //             Text('1/2 Cup Milk')
                            //           ],
                            //         )
                            //       ],
                            //     ),
                            //     Spacer(),
                            //     Column(
                            //       children: <Widget>[
                            //         Row(
                            //           children: <Widget>[
                            //             Icon(
                            //               Icons.check,
                            //               size: 20.0,
                            //             ),
                            //             Text('1/2 Cup Milk')
                            //           ],
                            //         ),
                            //         Row(
                            //           children: <Widget>[
                            //             Icon(
                            //               Icons.check,
                            //               size: 20.0,
                            //             ),
                            //             Text('1/2 Cup Milk')
                            //           ],
                            //         ),
                            //         Row(
                            //           children: <Widget>[
                            //             Icon(
                            //               Icons.check,
                            //               size: 20.0,
                            //             ),
                            //             Text('1/2 Cup Milk')
                            //           ],
                            //         )
                            //       ],
                            //     ),
                            //     SizedBox(
                            //       width: 20.0,
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Process',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 7,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context , index){
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text('Step no.',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold
                                          ),),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Container(
                                        height: 175,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          //add image here
                                            borderRadius: BorderRadius.circular(20.0),
                                            border: Border.all(color: Colors.black)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text('afssad fgh dfgdg dfhdfd aewrt gcbvh krt sffghdfsdfsd sdfsz bvnrtty ftryt iowanhshd asbjda jadihu'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );

                          },

                        ),
                      ),
                      SizedBox(height: 8.0,),
                      Container(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          elevation: 4.0,
                          onPressed: (){
                            Navigator.push(context,
              MaterialPageRoute(builder: (context) => IntroScreen())); 
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Step by Step'),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,)


                    ],
                  ),
                )
              ],
            ),
    );
  }
}
