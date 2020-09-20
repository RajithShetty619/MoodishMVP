import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  bool showMore = false;
  bool showMoreDelay = false;
  List<String> nutri = ['Carbs.png', 'Protien.png', 'Fats.png', 'Sugar.png'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Preparation Time:',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Spacer(),
              if(widget.foodList.time != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child:Container(width:MediaQuery.of(context).size.width/3.5,child: Text(widget.foodList.time,overflow: TextOverflow.ellipsis,))),
                ),
              if(widget.foodList.time == null)
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text('empty')),


            ],
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nutrients:',
                style: TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20),
            child: SingleChildScrollView(
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
                      Text('${widget.foodList.carbohydrates} Carbs' )
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
                      Text('${widget.foodList.protein} Protien')
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
                      Text('${widget.foodList.fat} Fats')
                    ],
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
            ),
          ),
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
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                childAspectRatio: 2.2
                  ),
              // primary: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: widget.foodList.ingredients.length<8?widget.foodList.ingredients.length:showMore?widget.foodList.ingredients.length:8,
               shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "\u2714 ${widget.foodList.ingredients[index]}",
                          maxLines: 3,
                          softWrap: true,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                               fontSize: 20),
                        ),
                      ),
                    ));
              }),
          widget.foodList.ingredients.length>8?
              showMoreDelay?
              Center(
                child: SpinKitHourGlass(
                  duration: Duration(milliseconds: 700),
                  color: Colors.orange,
                ),
              )
                  :showMore==false?Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    child: RaisedButton(
                      onPressed: (){
                        setState(() {
                          showMoreDelay=true;
                        });
                        Future.delayed(Duration(milliseconds: 700),(){
                          setState(() {
                            showMoreDelay=false;
                            showMore=true;
                          });
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                        child: Text('Show More'),

                    ),
                  ),
                ),
              ):Container():Container(),

          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Preparation:',
                style: TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: MediaQuery.of(context).size.height / 2.8,
            child: ListView.builder(
              itemCount: widget.foodList.preparation.length,
              scrollDirection: Axis.horizontal,
              // scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Step ${index+1}\n ${widget.foodList.preparation[index]}',
                        textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                            applyHeightToLastDescent: true),
                        maxLines: 4,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
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
                  BetaCount().count(field: "step by step");
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
