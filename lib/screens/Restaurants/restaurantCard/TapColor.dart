import 'package:flutter/material.dart';

class HomeTabTabs extends StatefulWidget {
  @override
  HomeTabTabs(this.colorval);
  int colorval;

  _HomeTabTabsState createState() => _HomeTabTabsState();
}

class _HomeTabTabsState extends State<HomeTabTabs> with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
