import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/components/stepSlider.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/ingredients.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodRecipe extends StatefulWidget {
  final Widget child;

  FoodRecipe({
    Key key,
    this.child,
    this.foodList,
    }) : super(key: key);
    final FoodListModel foodList;

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
                            'Preparation',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        child: ListView.builder(
                          itemCount:widget.foodList.preparation.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          
                          itemBuilder: (BuildContext context ,index){
                            return Container(
                              margin: EdgeInsets.all(8.0),
                              
                              child: Text(
                                '* ${widget.foodList.preparation [index]}',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            );

                          },

                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'ingredients:',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),

                      // Container(
                      //   height: 400,
                      //   child: ListView.builder(
                      //     itemCount:widget.foodList.ingredients.length,
                      //     shrinkWrap: true,
                      //     scrollDirection: Axis.vertical,
                      //     itemBuilder: (BuildContext context ,index){
                            
                      //       // return Text(
                      //       //   widget.foodList.ingredients[index],
                      //       // );
                      //       return Container(
                      //         margin: EdgeInsets.all(10.0),
                      //         decoration: BoxDecoration(
                      //           border: Border.all(color: Colors.black, width: 2),
                      //           borderRadius: BorderRadius.circular(15),
                      //           // color: Colors.blue[200],
                      //         ),
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(5.0),
                      //           child: Text(
                      //             widget.foodList.ingredients [index],
                      //             textAlign: TextAlign.center,
                      //             style: TextStyle(
                      //                  fontWeight: FontWeight.bold),
                      //           ),
                      //         ),
                      //       );

                      //     },

                      //   ),
                      // ),
                      SizedBox(height: 8.0,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            elevation: 4.0,
                            onPressed: () async {
                              final action = await IngredientDialogs.yesAbortDialog(
                                  context, 'Ingredients:', widget.foodList);

              //                 Navigator.push(context,
              // MaterialPageRoute(builder: (context) => IntroScreen())); 
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Step by Step'),
                            ),
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
