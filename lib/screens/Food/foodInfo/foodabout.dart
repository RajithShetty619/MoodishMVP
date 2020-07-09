import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodAbout extends StatefulWidget {
  

  FoodAbout({
    Key key,
    @required this.descbox,
    @required this.nutrient,
    @required this.preparation,
    @required this.taste,
    @required this.preptime,
    @required this.cuisine,
  }) : super(key: key);
  final descbox;
  final nutrient;
  final preparation;
  final taste;
  final preptime;
  final cuisine;

  _FoodAboutState createState() => _FoodAboutState();
}

class _FoodAboutState extends State<FoodAbout> {
  List<String> items = [
    'Best Known For :',
    'Cuisines Served :',
    'Hygiene :',
    'Offers :'
  ];
  // List<String> nutri = ['Carbs.png', 'Protien.png', 'Fats.png', 'Sugar.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: foodAbout(
        descbox: widget.descbox,
        nutrient: widget.nutrient,
        preparation: widget.preparation,
        taste: widget.taste,
        preptime: widget.preptime,
        cuisine: widget.cuisine,
      ),
    );
  }
}

class foodAbout extends StatelessWidget {
  const foodAbout({
    Key key,
    @required this.descbox, 
    @required this.nutrient,
    @required this.preparation,
    @required this.taste,
    @required this.preptime,
    @required this.cuisine,

  }) : super(key: key);

  final descbox;
  final nutrient;
  final preparation;
  final taste;
  final preptime;
  final cuisine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        
        Stack(
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
                        'Description',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(descbox),
                    ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nutrients',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(nutrient),
                      
                    ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: <Widget>[
                  //       Column(
                  //         children: <Widget>[
                  //           Container(
                  //             height: 80.0,
                  //             width: 80.0,
                  //             decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               image: DecorationImage(
                  //                 image: AssetImage('assets/${nutri[0]}'),
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 7.0,
                  //           ),
                  //           Text('27% Carbs')
                  //         ],
                  //       ),
                  //       SizedBox(
                  //         width: 20.0,
                  //       ),
                  //       Column(
                  //         children: <Widget>[
                  //           Container(
                  //             height: 80.0,
                  //             width: 80.0,
                  //             decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               image: DecorationImage(
                  //                 image: AssetImage('assets/${nutri[1]}'),
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 7.0,
                  //           ),
                  //           Text('36% Protien')
                  //         ],
                  //       ),
                  //       SizedBox(
                  //         width: 20.0,
                  //       ),
                  //       Column(
                  //         children: <Widget>[
                  //           Container(
                  //             height: 80.0,
                  //             width: 80.0,
                  //             decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               image: DecorationImage(
                  //                 image: AssetImage('assets/${nutri[2]}'),
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 7.0,
                  //           ),
                  //           Text('14% Fats')
                  //         ],
                  //       ),
                  //       SizedBox(
                  //         width: 20.0,
                  //       ),
                  //       Column(
                  //         children: <Widget>[
                  //           Container(
                  //             height: 80.0,
                  //             width: 80.0,
                  //             decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               image: DecorationImage(
                  //                 image: AssetImage('assets/${nutri[3]}'),
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 7.0,
                  //           ),
                  //           Text('23% Sugar')
                  //         ],
                  //       ),
                  //       SizedBox(
                  //         width: 20.0,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Preparation Time',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                   if(preparation != null) 
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child:Text(preptime)),
                  ),
                  if(preparation == null)
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child:Text('empty')),
                  SizedBox(
                    height: 10.0,
                  ),
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
                        child:Text(cuisine)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Taste',
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
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(taste),
                    )
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
