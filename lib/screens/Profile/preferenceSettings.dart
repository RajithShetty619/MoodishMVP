import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/screens/Restaurants/cuisine.dart';
import 'package:moodish_mvp/screens/Restaurants/prefVegNveg.dart';

class ProfileSetting extends StatefulWidget {
  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  String fdPref = Hive.box('preferenceBox').get('deter');
  List<dynamic> cuisinePref = Hive.box('preferenceBox').get('preference');
  loadData() async {
    Box box = await Hive.openBox('preferenceBox');
    String det = await box.get('deter');
    List<String> cui = await box.get('preference');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    size: MediaQuery.of(context).size.width / 10,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Preferences',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(
              thickness: 2.0,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: RichText(
                text: TextSpan(
                  text: 'Cuisines You prefer',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 3.0,
                mainAxisSpacing: 1.0,
              ),
              scrollDirection: Axis.vertical,
              itemCount: cuisinePref.length,
              physics: NeverScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                          child: Text(
                        '${cuisinePref[index]}',
                        style: TextStyle(color: Colors.orange),
                      ))),
                );
              }),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  cuisinePref = Hive.box('preferenceBox').get('preference');
                });
                dynamic data = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return Cuisine(
                    event: 1,
                  );
                }));
                setState(() {
                  cuisinePref = data;
                });
              },
              // color: Colors.green,
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
                    'Change',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                fdPref = Hive.box('preferenceBox').get('deter');
              });
            },
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: RichText(
                  text: TextSpan(
                    text: 'You Favour this more',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: 110,
                    width: 110,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: (fdPref != 'both')
                          ? ((fdPref == 'veg')
                              ? Border.all(color: Colors.green, width: 2)
                              : Border.all(color: Colors.red, width: 2))
                          : Border.all(color: Colors.orange, width: 2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        '${fdPref}',
                        style: TextStyle(
                            color: (fdPref != 'both')
                                ? ((fdPref == 'veg')
                                    ? Colors.green
                                    : Colors.red)
                                : Colors.orangeAccent,
                                fontSize: 16),
                      ),
                    ))),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  fdPref = Hive.box('preferenceBox').get('deter');
                });
                dynamic data = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return FoodPreference(
                    event: 1,
                  );
                }));
                setState(() {
                  fdPref = data;
                });
              },
              // color: Colors.green,
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
                    'Change',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
