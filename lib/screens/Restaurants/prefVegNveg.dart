import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/screens/loadScreen.dart';

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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Which do you favour more?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'We will personalise the app primarily based on this.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            height: 95,
                            width: 95,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: showShadow1
                                  ? Border.all(color: Colors.green, width: 2)
                                  : Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(250),
                            ),
                            child: Center(
                                child: showShadow1
                                    ? Text(
                                        'veg',
                                        style: TextStyle(
                                            color: Colors.green[400]),
                                      )
                                    : Text('veg'))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            height: 95,
                            width: 95,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: showShadow2
                                  ? Border.all(color: Colors.red, width: 2)
                                  : Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(250),
                            ),
                            child: Center(
                                child: showShadow2
                                    ? Text(
                                        'nonveg',
                                        style:
                                            TextStyle(color: Colors.redAccent),
                                      )
                                    : Text('nonveg'))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          showShadow1 = false;
                          showShadow2 = false;
                          showShadow3 = false;
                        });
                        Box box = await Hive.openBox('preferenceBox');
                        box.put('deter', 'Veg &\nNonVeg');
                        DatabaseService().savePreference();
                        setState(() {
                          showShadow3 = true;
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            height: 95,
                            width: 95,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: showShadow3
                                  ? Border.all(color: Colors.orange, width: 2)
                                  : Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(250),
                            ),
                            child: Center(
                                child: showShadow3
                                    ? Text(
                                        'both',
                                        style: TextStyle(color: Colors.orange),
                                      )
                                    : Text('both'))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  "don't worry, You can change this later! ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () async {
                  if (widget.event == 1) {
                    Box box = await Hive.openBox('preferenceBox');
                    dynamic data = box.get('deter');
                    Navigator.of(context).pop(data);
                  } else
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoadingScreen();
                    }));
                },
                child: Container(
                  width: 100,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(15),
                    // color: Colors.blue[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'OK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
