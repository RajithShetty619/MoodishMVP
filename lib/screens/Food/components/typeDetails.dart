import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/components/TodaySpecial.dart';

class Detailed_Type extends StatefulWidget {
  @override
  _Detailed_TypeState createState() => _Detailed_TypeState();
}

class _Detailed_TypeState extends State<Detailed_Type> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Type'),
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
 
                gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
              .2,
              .9
            ], colors: [
              Colors.black.withOpacity(.6),
              Colors.black.withOpacity(.2),
            ])), 
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(  
                            icon: Icon(
                              Icons.arrow_back,
                              size: 40,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }), 
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton( 
                            icon: Icon(
                              Icons.favorite_border,
                              size: 40,
                              color: Colors.black,
                            ),
                            onPressed: () {}), 
                      ),
                    ],
                  ),
                  SizedBox(height: 300),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[ 
                      Text(
                        'Food',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'description',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ), 
                      SizedBox(height: 20),
                      FlatButton(
                        onPressed: () {},
                        child: IconButton( 
                          icon: Icon(
                            Icons.restaurant,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: () {},
                        ), 
                        // label: Text(''),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          FlatButton.icon( 
                              onPressed: () {},
                              icon: Icon(
                                Icons.info_outline,
                                color: Colors.black,
                              ),
                              label: Text(
                                'More info',
                                style: TextStyle(color: Colors.black),
                              )),
                          FlatButton.icon(
                              onPressed: () => _onButtonPressed(),
                              icon: Icon(
                                Icons.filter_center_focus,
                                color: Colors.black,
                              ),
                              label: Text(
                                'Filter',
                                style: TextStyle(color: Colors.black),
                              )) 
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ), 
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) => EntryItem(
                      data[index],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  } 
}
