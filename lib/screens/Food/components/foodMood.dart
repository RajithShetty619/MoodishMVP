import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/foodInfo/food_info.dart';

class Mood_Food extends StatelessWidget {
  const Mood_Food({
    Key key,
    @required this.image,
    @required this.descrip1,
    @required this.descrip2,
  }) : super(key: key);

  final image;
  final descrip1;
  final descrip2;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9 / 1.2,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Food_Info()));
        },
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
                  .1,
                  .5
                ], colors: [
                  Colors.black.withOpacity(.6),
                  Colors.black.withOpacity(.3),
                ])),
            child: Padding(
              padding: EdgeInsets.all(7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      descrip1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        descrip2,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(300),
                        ),
                        // color: Colors.blue[300],
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),

                  // SizedBox(height: 10),
                  /* Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                FlatButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      'More info',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                FlatButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.filter_center_focus,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      'Filter',
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
