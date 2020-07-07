import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Restaurants/taste.dart';

class Cuisine extends StatefulWidget {
  @override
  _CuisineState createState() => _CuisineState();
}

class _CuisineState extends State<Cuisine> {
  List<GridTileBuilder> cuisine = [
    GridTileBuilder(
        image: 'NorthIndian.jpeg', cuisine: 'North Indian', currentOpacity: 1),
    GridTileBuilder(
        image: 'SouthIndian.jpeg', cuisine: 'South Indian', currentOpacity: 1),
    GridTileBuilder(
        image: 'Chinese.png', cuisine: 'Chinese', currentOpacity: 1),
    GridTileBuilder(
        image: 'Dessert.jpg', cuisine: 'Desserts', currentOpacity: 1),
    GridTileBuilder(
        image: 'FastFood.png', cuisine: 'Fast Food', currentOpacity: 1),
    GridTileBuilder(
        image: 'Beverage.jpg', cuisine: 'Beverages', currentOpacity: 1),
    GridTileBuilder(
        image: 'Italian.jpg', cuisine: 'Italian', currentOpacity: 1),
    GridTileBuilder(
        image: 'Mexican.jpg', cuisine: 'Mexican', currentOpacity: 1),
    GridTileBuilder(image: 'Bakery.jpg', cuisine: 'Bakery', currentOpacity: 1),
  ];

  int i = 0;
  List<String> pref = []; //all the user preferences are saved here
  String err = '';
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: 'Cuisine',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 75,
                        color: Colors.orange),
                    children: [
                      TextSpan(
                          text: '.',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 90,
                              color: Colors.black))
                    ]),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Any 3 Cuisine of your type :',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 7.0,
                      mainAxisSpacing: 7.0,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: cuisine.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          dynamic _val = cuisine[index];
                          Future.delayed(Duration(milliseconds: 500), () {
                            setState(() {
                              cuisine.remove(_val);
                              print(pref);
                              if (pref.length == 9) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Taste();
                                }));
                              }
                            });
                          });
                          setState(() {
                            pref.add(_val.cuisine);
                            i++;
                            cuisine[index]._visible = !cuisine[index]._visible;
                          });
                        },
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity: cuisine[index]._visible ? 1.0 : 0.0,
                          child: Container(
                            height: 175.0,
                            width: 110.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/${cuisine[index].image}'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Text(
                                '${cuisine[index].cuisine}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18.0),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: (i + 1 > 3)
                          ? Align(
                              alignment: Alignment.center,
                              child: Text(''),
                            )
                          : Align(
                              alignment: Alignment.center,
                              child: Text(
                                err,
                                style: TextStyle(color: Colors.red),
                              ))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      onPressed: () {
                        if (i + 1 > 3)
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Taste();
                          }));
                        else
                          setState(() {
                            err = 'Select ${3 - i + 1} more!';
                          });
                      },
                      color: Colors.green,
                      child: Text('Next->'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GridTileBuilder {
  String image;
  String cuisine;
  double currentOpacity;
  bool _visible = true;
  GridTileBuilder({this.cuisine, this.image, this.currentOpacity});
}
