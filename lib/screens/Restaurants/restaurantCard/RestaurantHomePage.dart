import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';
import 'page6.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  HomePage({Key key, this.child}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
     Widget image_slider_carousel = Container(
        height:250,
              child: Carousel(
          boxFit: BoxFit.cover,
          images: [
           AssetImage('img/variety-of-fruits-890507.jpg'),
           AssetImage('img/spinach-chicken-pomegranate-salad-5938.jpg'),
           AssetImage('img/3.png'),
           AssetImage('img/4.png')
          //  AssetImage('/root/restaurants/img/4.png'),
          //  AssetImage('/root/restaurants/img/5.png'),
          ],
        ),
      );
    return DefaultTabController(
      length: 5,
      child: Scaffold(
       
          body: 
          
          Stack(
                      children:<Widget>[ 
            Container(child: image_slider_carousel),
            
            
               
              Container(
                
              padding: EdgeInsets.fromLTRB(0,300,0,0),
                child: TabBarView(
                children: <Widget>[
                  Page1(0xffff5722),//ff5722
                  Page22(0xff3f51b5),//3f51b5
                  Page3(0xffe91e63),//e91e63
                  Page4(0xff9c27b0), //9c27b0
                  Page6(0xff2196f3), //2196f3 //4CAF50
                ],
            ),
              ),
              Padding(
                    padding: EdgeInsets.fromLTRB(8,250,0,0),
                  child: Text(
                    "Classic Restaurant",
                    style: TextStyle(color: Colors.black, fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),

                ),
                Container(
                
                  padding:  EdgeInsets.fromLTRB(8,280,0,0),
                  child: Divider(color:Colors.black,)),
                Container(
                 
                    padding: EdgeInsets.fromLTRB(10,300,0,0),
                  child: Text.rich(TextSpan(children: [
                                    WidgetSpan(
                                      child: Icon(Icons.location_on, size: 16.0, color: Colors.black,)
                                    ),
                                    TextSpan(
                                      text: "Mumbai, Maharashtra"
                                    )
                                  ]), style: TextStyle(color: Colors.black, fontSize: 12.0),),
                 ),
                    Padding(
                         padding: EdgeInsets.fromLTRB(4,320,0,0),
                      child: Row(
                  children: <Widget>[
                      const SizedBox(width: 16.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "8.4/85 reviews",
                          style: TextStyle(color: Colors.black, fontSize: 13.0),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      )
                  ],
                ),
                    ),
               
                       ], )),
    );
  }
}

