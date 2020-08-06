import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/foodListModel.dart';

class PageViewer1 extends StatefulWidget {
  final FoodListModel foodList;

  const PageViewer1({Key key, this.foodList}) : super(key: key);

  @override
  _PageViewer1State createState() => _PageViewer1State();
}

class _PageViewer1State extends State<PageViewer1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
            itemCount: widget.foodList.preparation.length,
            //List count idhar use kar
            itemBuilder: (BuildContext context, int index) {
              return SingleChildScrollView(
                child: Container(
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.black)
                  // ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(45),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_back,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
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
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.black)

                          // ),
                          child: SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: 0.0,
                                  bottom: 80.0),
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
                                // color: Colors.blue[200],
                                elevation: 20,

                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Back to Info Screen",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (index + 1 < widget.foodList.preparation.length)
                        Text(
                          'Page ${index +1} of ${widget.foodList.preparation.length} ',
                          style:
                              TextStyle(color: Colors.grey[400], fontSize: 18),
                        ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
