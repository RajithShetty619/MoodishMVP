import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Page6 extends StatefulWidget {
   int colorVal;
  Page6(this.colorVal);
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
     void initState() {
       super.initState();
      _tabController = new TabController(vsync: this, length: 6);
      _tabController.addListener(_handleTabSelection);
     }
     void _handleTabSelection() {
        setState(() {
          widget.colorVal=0xff2196f3;
         });
     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
      
    );
  }
}
