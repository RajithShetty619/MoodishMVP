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
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Fdprefbg.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          SafeArea(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Center(
                  child: Text('Food Preference',style: TextStyle(color: Colors.white,fontSize: 38,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Divider(thickness: 2,color: Colors.white,),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/5,),

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
                                onTap: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext idcontext) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height/4.2,
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
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage('assets/veg.jpg'),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                              ),
                            ),
                            Text('Vegetarian',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)
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
                                onTap: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext idcontext) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height/4.2,
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
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage('assets/nonveg.jpg'),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                              ),
                            ),
                            Text('Non-Vegetarian',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)
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
                                onTap: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext idcontext) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height/4.2,
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
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage('assets/vegnonveg.jpg'),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                              ),
                            ),
                            Text('Veg&Non-Veg',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)
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
