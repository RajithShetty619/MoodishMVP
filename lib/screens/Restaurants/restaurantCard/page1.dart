import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:restaurants/about.dart';
//import 'package:restaurants/photo.dart';

import 'about.dart';
import 'homeforyoutabs.dart';
import 'hometopchartstabs.dart';
import 'photo.dart';

class Page1 extends StatefulWidget {

  Page1(this.colorVal);
  int colorVal;

  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin{
TabController _tabController;

@override
     void initState() {
       super.initState();
      _tabController = new TabController(vsync: this, length: 6);
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
      length:4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorWeight: 4.0,
            indicatorColor:Color(0xffff5722),
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                //icon:Icon(FontAwesomeIcons.eyeSlash, color: _tabController.index == 0
                 //         ? Color( widget.colorVal)
                  //        : Colors.grey),
                child:Text('   Overview     ',style: TextStyle( color: _tabController.index == 0
                          ?  Color( widget.colorVal)
                          : Colors.grey)),
              ),
              Tab(
               // icon: Icon(FontAwesomeIcons.chartBar, color: _tabController.index == 1
                //          ? Color( widget.colorVal)
              //            : Colors.grey),
                child: Text('     Review      ',style: TextStyle( color: _tabController.index == 1
                          ?  Color( widget.colorVal)
                          : Colors.grey)),
              ),
              Tab(
              //  icon: Icon(FontAwesomeIcons.shapes, color: _tabController.index == 2
                     //     ? Color( widget.colorVal)
                    //      : Colors.grey),
                child: Text('       Photo     ',style: TextStyle( color: _tabController.index == 2
                          ?  Color( widget.colorVal)
                          : Colors.grey)),
              ),
              Tab(
               // icon: Icon(FontAwesomeIcons.solidBookmark, color: _tabController.index == 3
                 //         ? Color( widget.colorVal)
                  //        : Colors.grey),
                child: Text('      About    ',style: TextStyle( color: _tabController.index == 3
                          ?  Color( widget.colorVal)
                          : Colors.grey)),
              ),
              Tab(
                //icon: Icon(FontAwesomeIcons.solidStar, color: _tabController.index == 4
                  //        ? Color( widget.colorVal)
                    //      : Colors.grey),
                child: Text('',style: TextStyle( //color: _tabController.index == 3
                         // ?  Color( widget.colorVal)
                         // : Colors.grey
                         )),
              ),
              Tab(
               // icon: Icon(FontAwesomeIcons.lockOpen, color: _tabController.index == 5
                 //         ? Color( widget.colorVal)
                  //        : Colors.grey),
                child: Text('',style: TextStyle( //color: _tabController.index == 3
                        //  ?  Color( widget.colorVal)
                          //: Colors.grey
                          )),
              ),
            ],
          ),
        ),
         body: TabBarView(
           controller: _tabController,
            children: <Widget>[
              HomeForYouTabs(),
              StarFeedback(),
                Photo(),
              About(),
          
            
            Container(
              height: 200.0,
              child: Center(child: Text('')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('')),
            ),
            ],
         ),
      ),
    );
  }
}

