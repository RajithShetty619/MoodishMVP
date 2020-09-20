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
  List<dynamic> cuisinePref =  Hive.box('preferenceBox').get('preference');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/prefsetting.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          SafeArea(
              child:Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: IconButton(
                              onPressed: ()=>Navigator.of(context).pop(),
                              icon: Icon(Icons.arrow_back,size: MediaQuery.of(context).size.width/10,color: Colors.white,),
                            ),
                          ),
                          Center(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.restaurant_menu,size: MediaQuery.of(context).size.width/10,color: Colors.orange[800],),
                                Text('Preferences',
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width/11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),)
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Divider(thickness: 2.0,),
                      ),
              InkWell(
                onTap: (){
                  setState(() {
                    cuisinePref = Hive.box('preferenceBox').get('preference');
                  });
                  showDialog(
                      context: context,
                      builder: (BuildContext idcontext) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SingleChildScrollView(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'Do You Want to Change Your\nCuisine? \n${cuisinePref.join(',')}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          RaisedButton(
                                            onPressed: () => Navigator.of(
                                                idcontext,
                                                rootNavigator: true)
                                                .pop(),
                                            child: Text('No'),
                                          ),
                                          RaisedButton(
                                            onPressed: () async{
                                              Navigator.of(
                                                  idcontext,
                                                  rootNavigator: true)
                                                  .pop();
                                              Navigator
                                                  .push(context,
                                                  MaterialPageRoute(builder: (context) {
                                                    return Cuisine(event:1,);
                                                  }));
                                            },
                                            child: Text('Yes'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image: AssetImage('assets/cuisinelogo.png'),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width/10,),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Cuisine',
                          style: TextStyle(
                              fontSize: 28,
                            color: Colors.white
                          ),),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  setState(() {
                    fdPref = Hive.box('preferenceBox').get('deter');
                  });
                  showDialog(
                      context: context,
                      builder: (BuildContext idcontext) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height/4.5,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Do You Want to Change Your\nPreference? : $fdPref',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        RaisedButton(
                                          onPressed: () => Navigator.of(
                                              idcontext,
                                              rootNavigator: true)
                                              .pop(),
                                          child: Text('No'),
                                        ),
                                        RaisedButton(
                                          onPressed: () async{
                                            Navigator.of(
                                                idcontext,
                                                rootNavigator: true)
                                                .pop();
                                              Navigator
                                                  .push(context,
                                                  MaterialPageRoute(builder: (context) {
                                                    return FoodPreference(event:1,);
                                                  }));
                                          },
                                          child: Text('Yes'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image: AssetImage('assets/preferencelogo.jpg'),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width/10,),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Preference',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white
                        ),),
                    ),
                  ],
                ),
              ),
            ]
                  ),
                ],
              )

          ),
        ],
      ),
    );
  }
}
