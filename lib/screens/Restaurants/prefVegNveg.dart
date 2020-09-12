import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/screens/mainScreen.dart';
class FoodPreference extends StatefulWidget {
  int event;
  FoodPreference({this.event});
  @override
  _FoodPreferenceState createState() => _FoodPreferenceState();
}

class _FoodPreferenceState extends State<FoodPreference> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Center(
            child: RichText(
              text: TextSpan(
                  text: 'Food Preference',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width/9,
                      color: Colors.green),
                  children: [
                    TextSpan(
                        text: '.',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 65,
                            color: Colors.pinkAccent))
                  ]),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.all(10),
            child: Divider(thickness: 2,),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext idcontext) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height/4,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Are you Sure you want this\nas your Food Preference',
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
                                              Box box = await Hive.openBox('preferenceBox');
                                              box.put('deter', 'Vegetarian');
                                              DatabaseService().savePreference();
                                              Navigator.of(
                                                  idcontext,
                                                  rootNavigator: true)
                                                  .pop();
                                              if(widget.event==1){
                                                Navigator.of(context).pop();
                                              }
                                              else
                                              Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return MainScreen();
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
                  child: Container(
                    height: 175,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/veg.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Vegetarian',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext idcontext) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height/4,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Are you Sure you want this\nas your Food Preference',
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
                                            onPressed: ()async{
                                              Box box = await Hive.openBox('preferenceBox');
                                              box.put('deter', 'Non-Vegetarian');
                                              DatabaseService().savePreference();
                                              Navigator.of(
                                                  idcontext,
                                                  rootNavigator: true)
                                                  .pop();
                                              if(widget.event==1){
                                                Navigator.of(context).pop();
                                              }
                                              else
                                                Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return MainScreen();
                                                }));},
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
                  child: Container(
                    height: 175,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/nonveg.jpg'),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Non-Vegetarian',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext idcontext) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height/4,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Are you Sure you want this\nas your Food Preference',
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
                                            onPressed: ()async{
                                              Box box = await Hive.openBox('preferenceBox');
                                              box.put('deter', 'Veg&NonVeg');
                                              DatabaseService().savePreference();
                                              Navigator.of(
                                                  idcontext,
                                                  rootNavigator: true)
                                                  .pop();
                                              if(widget.event==1){
                                                Navigator.of(context).pop();
                                              }
                                              else
                                              Navigator
                                            .push(context,
                                                MaterialPageRoute(builder: (context) {
                                                  return MainScreen();
                                                }));},
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
                  child: Container(
                    height: 175,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/vegnonveg.jpg'),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Veg &\nNon-Vegetarian',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
