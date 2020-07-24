import 'package:flutter/material.dart';
//import 'package:rest/photo.dart';
//import 'package:rest/starfeedback.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'about.dart';
import 'overview.dart';
import 'photo.dart';
import 'starfeedback.dart';

class HomeTopTabs extends StatefulWidget {
String desc;
  HomeTopTabs({this.colorVal,this.desc});
  int colorVal;

  _HomeTopTabsState createState() => _HomeTopTabsState();
}

class _HomeTopTabsState extends State<HomeTopTabs> with SingleTickerProviderStateMixin{
TabController _tabController;

@override
     void initState() {
       super.initState();
      _tabController = new TabController(vsync: this, length: 3);
      _tabController.addListener(_handleTabSelection);
     }
     void _handleTabSelection() {
        setState(() {
          widget.colorVal=0xffff5722;
         });
     }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorWeight: 4.0,
            indicatorColor:Color(0xffff5722),
            unselectedLabelColor: Colors.grey,
            
            tabs: <Widget>[
              Tab(
               /* icon:Icon(FontAwesomeIcons.compass, color: _tabController.index == 0
                          ? Color( widget.colorVal)
                          : Colors.grey),*/
                child:Padding(
                  
                  padding: EdgeInsets.fromLTRB(0,0,25,0),
                    child: Text('OverView',style: TextStyle( color: _tabController.index == 0
                              ?  Color( widget.colorVal)
                              : Colors.grey)),
                
                ),
              ),
              Tab(
               /* icon: Icon(FontAwesomeIcons.chartBar, color: _tabController.index == 1
                          ? Color( widget.colorVal)
                          : Colors.grey),*/
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25,0,25,0),
                                  child: Text('Review',style: TextStyle( color: _tabController.index == 1
                            ?  Color( widget.colorVal)
                            : Colors.grey,fontSize: 15)),
                ),
                
              ),
//              Tab(
//               /* icon: Icon(FontAwesomeIcons.shapes, color: _tabController.index == 2
//                          ? Color( widget.colorVal)
//                          : Colors.grey),*/
//                child: Padding(
//                  padding: EdgeInsets.fromLTRB(25,0,25,0),
//                                  child: Text('Photo',style: TextStyle( color: _tabController.index == 2
//                            ?  Color( widget.colorVal)
//                            : Colors.grey)),
//                ),
//              ),
              Tab(
             /*   icon: Icon(FontAwesomeIcons.solidBookmark, color: _tabController.index == 3
                          ? Color( widget.colorVal)
                          : Colors.grey),*/
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0,0,25,0),
                                  child: Text('About',style: TextStyle( color: _tabController.index == 2
                            ?  Color( widget.colorVal)
                            : Colors.grey)),
                ),
              ),
             
            ],
          ),
        ),
         body: TabBarView(
           controller: _tabController,
            children: <Widget>[
             OverView(desc: widget.desc,),
            StarFeedback(),
              About(desc: widget.desc,),
          
            ],
         ),
      ),
    );
  }
}

