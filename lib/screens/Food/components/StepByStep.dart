import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/foodListModel.dart';

class StepByStep extends StatefulWidget {
  final FoodListModel foodList;
  StepByStep({this.foodList});

  @override
  _StepByStepState createState() => _StepByStepState();
}

class _StepByStepState extends State<StepByStep> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 15, top: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.arrow_back,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Step ${index + 1} :',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    //prep ka info step by step
                    height: MediaQuery.of(context).size.height / 1.35,
                    width: MediaQuery.of(context).size.width / 0.75,
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 0.0, bottom: 80.0),
                        child: Text(
                          "${widget.foodList.preparation[index]}",
                          style: TextStyle(
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (index + 1 == widget.foodList.preparation.length)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 50,
                        child: RaisedButton(
                          elevation: 20,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Finish!",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (index + 1 < widget.foodList.preparation.length)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 4.7),
                        child: Text(
                          'Page ${index + 1} of ${widget.foodList.preparation.length} ',
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 50,
                            child: RaisedButton(
                              // color: Colors.blue[200],
                              elevation: 20,

                              onPressed: () {
                                if (index <
                                    widget.foodList.preparation.length - 1) {
                                  setState(() {
                                    index++;
                                  });
                                }
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
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
      ),
    );
  }
}
