import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class About extends StatefulWidget {
  final Widget child;

  About({Key key, this.child}) : super(key: key);

  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
                                    height: 100.0,
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
         ],
          ),
           )
              ],
            ),
          ),
    );
  }
}
