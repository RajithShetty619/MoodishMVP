import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Authenticate/loading.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/screens/loadScreen.dart';
import 'package:moodish_mvp/screens/mainScreen.dart';

class FoodPreference extends StatefulWidget {
  int event;
  FoodPreference({this.event});
  @override
  _FoodPreferenceState createState() => _FoodPreferenceState();
}

class _FoodPreferenceState extends State<FoodPreference> {
  bool showShadow1 = false;
  bool showShadow2 = false;
  bool showShadow3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.event == 1)
            Navigator.of(context).pop();
          else
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoadingScreen();
            }));
        },
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.chevron_right),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Fdprefbg.jpg'),
                    fit: BoxFit.cover)),
          ),
          SafeArea(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Center(
                  child: Text(
                    'Food Preference',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    showShadow1 = false;
                                    showShadow2 = false;
                                    showShadow3 = false;
                                  });
                                  Box box = await Hive.openBox('preferenceBox');
                                  box.put('deter', 'veg');
                                  DatabaseService().savePreference();
                                  setState(() {
                                    showShadow1 = true;
                                  });
                                },
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: showShadow1
                                              ? Colors.blue[900]
                                              : Colors.transparent,
                                          width: 4),
                                      image: DecorationImage(
                                          image: AssetImage('assets/veg.jpg'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            Text(
                              'Vegetarian',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    showShadow1 = false;
                                    showShadow2 = false;
                                    showShadow3 = false;
                                  });
                                  Box box = await Hive.openBox('preferenceBox');
                                  box.put('deter', 'nonveg');
                                  DatabaseService().savePreference();
                                  setState(() {
                                    showShadow2 = true;
                                  });
                                },
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: showShadow2
                                              ? Colors.blue[900]
                                              : Colors.transparent,
                                          width: 4),
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/nonveg.jpg'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            Text(
                              'Non-Vegetarian',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    showShadow1 = false;
                                    showShadow2 = false;
                                    showShadow3 = false;
                                  });
                                  Box box = await Hive.openBox('preferenceBox');
                                  box.put('deter', 'Veg&NonVeg');
                                  DatabaseService().savePreference();
                                  setState(() {
                                    showShadow3 = true;
                                  });
                                },
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: showShadow3
                                              ? Colors.blue[900]
                                              : Colors.transparent,
                                          width: 4),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/vegnonveg.jpg'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            Text(
                              'Veg&Non-Veg',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
