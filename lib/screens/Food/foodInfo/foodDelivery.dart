import 'package:flutter/material.dart';
class FoodDelivery extends StatefulWidget {
  @override
  _FoodDeliveryState createState() => _FoodDeliveryState();
}

class _FoodDeliveryState extends State<FoodDelivery> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text('Delivery Options :',
            style: TextStyle(
              fontSize: 22.0
            ),),
          ),
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){},
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/irish_house.png'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            child: Text('Swiggy',
                              style: TextStyle(
                                  fontSize: 40.0
                              ),),
                          ),
                        ),
                        SizedBox(width: 75.0,)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){},
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/irish_house.png'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            child: Text('Zomato',
                              style: TextStyle(
                                  fontSize: 40.0
                              ),),
                          ),
                        ),
                        SizedBox(width: 75.0,)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){},
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/irish_house.png'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            child: Text('Restaurant',
                              style: TextStyle(
                                  fontSize: 34.0
                              ),),
                          ),
                        ),
                        SizedBox(width: 75.0,)
                      ],
                    ),
                  ),
                ),
              )




            ],
          ),
        ),
      ],
    );
  }
}
