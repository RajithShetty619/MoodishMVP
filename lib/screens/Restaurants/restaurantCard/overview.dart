import 'package:flutter/material.dart';
//import 'package:rest/starfeedback.dart';

import 'map.dart';
import 'starfeedback.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OverView extends StatefulWidget {
  final Widget child;

  OverView({Key key, this.child}) : super(key: key);

  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
                      child: Stack(
              children: <Widget>[ Container(
              height: 150.0,
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
                                    height: 500.0,
                                    width: 200.0,
                                    
                                                            child: Stack(
                                        children: <Widget>[
                                          Text("Today/'s Offers"),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                                              //SizedBox(height: 50),
                                              child:Container(
                                                height: 100,
                                                width: 100,
                                                color:Colors.blue,
                                                child: Stack(
                                                  children: <Widget>[
                                                    Center(child: Icon(Icons.menu, size:20)),
                                                  ]
                                                )
                                              )
                                              
                                          ),
                                        
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
                                            child: Scaffold(
                                              appBar:AppBar(
                                                       backgroundColor: Colors.white,
                                                       title: TextField(decoration:InputDecoration(
                                                         
                                                         icon: Icon(Icons.search),
                                                         hintText:"Search here" ) ,
                                                         
                                                         ),
                                     actions: <Widget>[
                                       IconButton(icon: Icon(Icons.search,),
                                       onPressed:(){
                                         
                                       },
                                       )

                                     ],   
                            )
                              ),
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
              )),
              Divider(color: Colors.black,height: 2,),
         Padding(
          padding: EdgeInsets.fromLTRB(10,160,0,0),
          child: Stack(
            children: <Widget>[
              Text('Description',style:TextStyle(fontSize: 30,),textAlign:TextAlign.left  ,),
              SizedBox(height:10),
               Padding(
                  padding: EdgeInsets.fromLTRB(20,40,0,10),
                 child: Text("afssad fgh dfgdg dfhdfd aewrt gcbvh krt sffghdfsdfsd sdfsz bvnrtty ftryt iowanhshd asbjda jadihu")),
          SizedBox(height:30.0),
             Padding(
               padding: EdgeInsets.fromLTRB(200,80,0,10),
                            child: InkWell(
                onTap: (){},

             child: Stack(
               children: <Widget>[

                 Text(
                  'Read Me',
            style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  
            ),
            
          ),
        SizedBox(width: 6,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Divider(color:Colors.black,height: 2),
          ),
       

          ],

             ),
                            ),
             ),
           Padding(
      padding: EdgeInsets.fromLTRB(
          5,
          150,
          5,
          0),
      child: InkWell(
        onTap: (){
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Maps(),
    ),
          );

        },
              child: Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.location_on),
            SizedBox(width: 10,),
            Text(
              'Location',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(width:220.0),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
            Divider(color: Colors.black,height: 2,),
          ],
        ),
      ),
          ),
           Padding(
            padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
            child: RaisedButton(
    onPressed: () {
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
    color: Colors.white,
    child: Padding(
      padding: EdgeInsets.fromLTRB(
          0,
          0,
          5,
          0),
      child: Row(
      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.phone),
          SizedBox(width: 10,),
          Text(
            '+91-02831-48912',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(width:115.0),
          Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
          Divider(color: Colors.black,height: 2,),
        ],
      ),
    ),),),
    Padding(
            padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
            child: RaisedButton(
    onPressed: () {
         /*       showDatePicker(
                  context: context,
                 // initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2021)
                ).then((date) {
                  setState(() {
                  //  _dateTime = date;
                  });
                });*/
},
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
          Icon(Icons.date_range),
          SizedBox(width: 10,),
          Text(
            'Book-Table',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(width:175.0),
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

    Padding(
            padding: const EdgeInsets.fromLTRB(0, 280, 0, 0),
            child: RaisedButton(
    onPressed: () {
    },
    color: Colors.white,
    child: InkWell(
      onTap: (){
         Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => StarFeedback()),);
      },
          child: Padding(
        padding: EdgeInsets.fromLTRB(
            5,
            0,
            5,
            50),
        child: Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.star,color: Colors.white,),
            SizedBox(width: 10,),
            Text(
              'Ratting',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(width:200.0),
            
            Divider(color: Colors.black,height: 2,),
          ],
        ),
      ),
    ),
  ),
          ),
            ],
          ),
           )
              ],
            ),
          ),
    );
  }
}
