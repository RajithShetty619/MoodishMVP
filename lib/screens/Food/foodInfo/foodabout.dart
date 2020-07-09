import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodAbout extends StatefulWidget {
  final Widget child;

  FoodAbout({
    Key key,
    this.child,
    @required this.name,
    @required this.descbox,
  }) : super(key: key);

  final name;
  final descbox;

  _FoodAboutState createState() => _FoodAboutState();
}

class _FoodAboutState extends State<FoodAbout> {
  List<String> items = [
    'Best Known For :',
    'Cuisines Served :',
    'Hygiene :',
    'Offers :'
  ];
  List<String> nutri = ['Carbs.png', 'Protien.png', 'Fats.png', 'Sugar.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: foodAbout(
        nutri: nutri,
        name: widget.name,
        descbox: widget.descbox,
      ),
    );
  }
}

class foodAbout extends StatelessWidget {
  const foodAbout({
    Key key,
    @required this.nutri,
    @required this.name,
    @required this.descbox,
  }) : super(key: key);
  final name;
  final descbox;

  final List<String> nutri;

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
                  SingleChildScrollView(
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
                            Text('27% Carbs')
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
                            Text('36% Protien')
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
                            Text('14% Fats')
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
                                  image: AssetImage('assets/${nutri[3]}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text('23% Sugar')
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                  ),
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
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                          "afssad fgh dfgdg dfhdfd aewrt gcbvh krt sffghdfsdfsd sdfsz bvnrtty ftryt iowanhshd asbjda jadihu")),
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
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                          "afssad fgh dfgdg dfhdfd aewrt gcbvh krt sffghdfsdfsd sdfsz bvnrtty ftryt iowanhshd asbjda jadihu")),
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
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                          "afssad fgh dfgdg dfhdfd aewrt gcbvh krt sffghdfsdfsd sdfsz bvnrtty ftryt iowanhshd asbjda jadihu")),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
