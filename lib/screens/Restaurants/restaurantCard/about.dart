

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:share/share.dart';
import 'map.dart';
import 'package:quiver/core.dart';

class About extends StatefulWidget {
  final Widget child;

  About({Key key, this.child}) : super(key: key);

  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
   return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
       //   ImageContainer(),
          SizedBox(
            height: 20.0,
          ),
          InstalledApps(),
          SizedBox(
            height: 20.0,
          ),
          RecommendedApps(),
        ],
      ),
    );
  }

 /* Widget ImageContainer() {
    return Container(
      height: 200.0,
      child: Image.network(
          'https://www.bluemoongame.com/wp-content/uploads/2018/12/Marvel_Strike_Force_Alliance_War_Update.png',
          fit: BoxFit.cover),
    );
  }*/


Widget RecommendedApps() {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(3.0),
            child: labelContainer('Recommended for you'),
          ),
          Padding(
            padding: EdgeInsets.all(3.0),
            child: appsContainer(),
          ),
        ],
      ),
    );
  }

  Widget InstalledApps() {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      child: Column(
        children: <Widget>[
          //Padding(
          //  padding: EdgeInsets.all(8.0),
         //   child: labelContainer('Previously installed apps'),
         // ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: appsRecommendedContainer(),
          ),
        ],
      ),
    );
  }

  Widget labelContainer(String labelVal) {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Discription",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0),
          ),
          
        ],
      ),
    );
  }

  Widget imageSection(String imageVal, String appVal,String rateVal) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage(imageVal),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20.0), 
          ),
        ),
        SizedBox(
          height: 3.0,
        ),
        Text(
          appVal,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(children: <Widget>[
          Text(
          rateVal,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold,),
        ),
        Icon(FontAwesomeIcons.solidStar,size: 10.0,),
        ],)
      ],
    );
  }

    Widget appsRecommendedContainer() {
    return Container(
        height: 120.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
             InkWell(
               onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: new Text("+91-01237-12372"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Call"),
                          onPressed: (){},
                        )
                      ],
                    );
                  }
              );
               },
               child: Tab(icon:Icon(Icons.call,size: 85.0,),
               child: Text("Phone")
               )),
            SizedBox(
              width: 20.0,
            ),
             InkWell(
               onTap: (){
                 showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                       shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(10.0))
               ),
                      content: Column(
                        
                        children: [
                          SingleChildScrollView(
                                                      child: Container(
                              height: 200.0,
                              width: 200.0,
                              
                                                      child: Stack(
                                  children: <Widget>[
                                    Text("Today/'s Offers"),
                                    //SizedBox(height: 50),
                                   // Text("Today/'s Offers"),
                                  ],
                                ),
                             
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(""),
                          onPressed: (){},
                        )
                      ],
                    );
                  }
              );
               },
               child: Tab(icon:Icon(Icons.local_offer,size: 85.0,),
               child: Text("Offers")
               )),
            SizedBox(
              width: 20.0,
            ),
            InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: (Builder){
                  return Container(
                    height: 900.0,
                    color: Colors.blue,
                    child: Center(child: new Text("Menu")),
                  );
                });
              },
              child: Tab(icon:Icon(Icons.restaurant_menu,size: 85.0,),
               child: Text("Menu")
               )),
            SizedBox(
              width: 20.0,
            ),
           InkWell(
             onTap: (){
              showModalBottomSheet(context: context, builder: (Builder){
                  return Container(
                    height: 900.0,
                    color: Colors.white,
                   child: new Text("Share",style: TextStyle(fontSize: 50,),textAlign: TextAlign.left,)
                  );
                });
               
             },
             child: Tab(
                icon: Icon(Icons.share,size: 85.0,),
                child:Text("Share"),
             )),
            SizedBox(
              width: 20.0,
            ),
           
          ],
        ));
  }

  Widget appsContainer() {
    
     DateTime _dateTime;

    return Stack(
        children: [

           Padding(
            padding: const EdgeInsets.fromLTRB(220, 60, 0, 0),
            child: RaisedButton(
    onPressed: () {},
    color: Colors.white,
    child: Padding(
      padding: EdgeInsets.fromLTRB(
          5,
          0,
          5,
          0),
      child: Row(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
         
          
          Text(
            'Read Me',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
          Divider(color: Colors.black,height: 2,),
        ],
      ),
    ),
  ),
          ),
          Text("     afssad fgh dfgdg dfhdfd \n     aewrt gcbvh krt sffghdfsdfsd sdfsz bvnrtty ftryt \n      iowanhshd asbjda jadihu"),
          SizedBox(height:30.0),
             Padding(
               padding: const EdgeInsets.fromLTRB(0, 130, 0, 0),
             ),
           Padding(
            padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
            child: RaisedButton(
    onPressed: () {},
    color: Colors.white,
    child: Padding(
      padding: EdgeInsets.fromLTRB(
          5,
          0,
          5,
          200),
      child: Row(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          
          SizedBox(width: 10,),
          Text(
            'Best Known For',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(width:130.0),
         
          Divider(color: Colors.black,height: 2,),
        ],
      ),
    ),
  
         
  ),
          ),
 

            ],
       
        );
  
}
}
//class ShareSet {
 // final String name;
 // final String description;

//}
var myFeedbackText = "COULD BE BETTER";
  var sliderValue = 0.0;
  IconData myFeedback1= FontAwesomeIcons.star,myFeedback2= FontAwesomeIcons.star,myFeedback3= FontAwesomeIcons.star,
      myFeedback4= FontAwesomeIcons.star,myFeedback5 = FontAwesomeIcons.star;
  Color myFeedbackColor1 = Colors.grey,myFeedbackColor2 = Colors.grey,myFeedbackColor3 = Colors.grey,
myFeedbackColor4 = Colors.grey,myFeedbackColor5 = Colors.grey;
