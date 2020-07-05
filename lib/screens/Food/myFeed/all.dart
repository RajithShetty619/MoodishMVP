import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllTabs extends StatefulWidget {
  @override
  _AllTabsState createState() => _AllTabsState();
}

class _AllTabsState extends State<AllTabs> {
  List<AllCard> _info =[
    AllCard(image: 'Salty.jpg',title: 'Chips',cuisine: 'Indian-Cheap-10 mins',name: 'Name')
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 500.0,
                    width: double.maxFinite,
                    child: ListView.builder(
                      shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context , index){
                          return Card(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 200.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    image: DecorationImage(
                                      image: AssetImage('assets/${_info[0].image}')
                                    )
                                  ),

                                ),
                                Text(_info[0].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(height: 5.0,),
                                Text(_info[0].cuisine),
                                SizedBox(height: 2.0,),
                                Text(_info[0].name)
                              ],
                            ),
                          );
                        }),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context , index){
                          return Material(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 150.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      image: DecorationImage(
                                          image: AssetImage('assets/${_info[0].image}')
                                      )
                                  ),

                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context , index){
                          return Card(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 150.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      image: DecorationImage(
                                          image: AssetImage('assets/${_info[0].image}')
                                      )
                                  ),

                                )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AllCard{
  String image;
  String title;
  String cuisine;
  String name;
  AllCard({this.image,this.title,this.cuisine,this.name});
}