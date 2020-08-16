import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:moodish_mvp/Services/betaCount.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/components/pageview1.dart';
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
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ingredients:',
                style: TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 10 / 5,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                    childAspectRatio: 0.3),
                // primary: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.foodList.ingredients.length,
                // shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                        alignment: Alignment.center,
                        child: Card(
                          elevation: 2.0,
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.black, width: 2),
                            //   borderRadius: BorderRadius.circular(15),
                            //   // color: Colors.blue[200],
                            // ),
                            child: Center(
                              child: Text(
                                "${widget.foodList.ingredients[index]}",
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                        )),
                  );
                }),
          ),
          //            Align(
          //           alignment: Alignment.centerLeft,
          //           child: Container(
          //             child: RaisedButton(
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(20.0)
          //               ),
          //               elevation: 4.0,
          //               onPressed: () async {
          //                 final action = await IngredientDialogs.yesAbortDialog(
          //                     context, 'Ingredients:', widget.foodList);

          // //                 Navigator.push(context,
          // // MaterialPageRoute(builder: (context) => IntroScreen()));
          //               },
          //               child: Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Text('Show Ingredients'),
          //               ),
          //             ),
          //           ),
          //         ),
          SizedBox(
            height: 10.0,
          ),
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
          SizedBox(height: 8),
          ListView.builder(
            itemCount: widget.foodList.preparation.length,
            shrinkWrap: true,
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            // scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '* ${widget.foodList.preparation[index]}',
                  textHeightBehavior: TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: true),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () async {
                  await BetaCount().count(field:"step by step");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageViewer1(
                                foodList: widget.foodList,
                              )));

                  // showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return Scaffold(
                  //         body: ListView(
                  //           children: <Widget>[
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Text('How to Prepare?',
                  //               style: TextStyle(
                  //                 fontSize:32,
                  //                 fontWeight:FontWeight.bold
                  //               ),),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(5.0),
                  //               child: ListView.builder(
                  //                   itemCount: widget.foodList.preparation.length,
                  //                   shrinkWrap: true,
                  //                   physics: NeverScrollableScrollPhysics(),
                  //                   itemBuilder: (BuildContext context, index) {
                  //                     return Container(
                  //                       child: Padding(
                  //                         padding: const EdgeInsets.all(8.0),
                  //                         child: Text(
                  //                           'Step ${index+1}) ${widget.foodList.preparation[index]}',
                  //                           textHeightBehavior: TextHeightBehavior(
                  //                               applyHeightToFirstAscent: false,
                  //                               applyHeightToLastDescent: false),
                  //                               style: TextStyle(
                  //                                 fontSize:20,
                  //                               ),
                  //                         ),
                  //                       ),
                  //                     );
                  //                   }),
                  //             ),
                  //                 SizedBox(height: 10,),
                  //                 Padding(
                  //                   padding: const EdgeInsets.all(8.0),
                  //                   child: RaisedButton(
                  //                     color: Colors.blue[300],
                  //                     shape: RoundedRectangleBorder(
                  //                       borderRadius: BorderRadius.circular(10),
                  //                     ),
                  //                     onPressed: ()=>Navigator.of(context).pop(),
                  //                     child: Text('Ok'),),
                  //                 )
                  //           ],
                  //         ),
                  //       );

                  //     }

                  //     );
                },
                child: Text('Show More'),
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
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
