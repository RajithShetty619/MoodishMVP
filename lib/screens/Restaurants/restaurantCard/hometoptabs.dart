import 'package:flutter/material.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/gallery.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/restMenu.dart';
import 'starfeedback.dart';
import 'overview.dart';
import 'about.dart';

class HomeTopTabs extends StatefulWidget {
  final RestListModel rest;
  HomeTopTabs({this.rest});
  @override
  _HomeTopTabsState createState() => _HomeTopTabsState();
}

class _HomeTopTabsState extends State<HomeTopTabs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Colors.white,
          flexibleSpace: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: SafeArea(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(),
                    ),
                    TabBar(
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey[500],
                      labelColor: Colors.black,
                      indicatorWeight: 2.3,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Color(0xffff5722),
                      controller: _tabController,
                      tabs: <Widget>[
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Overview',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 20),
                            ),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Rating',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 20),
                            ),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Gallery',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            OverView(
              rest: widget.rest,
            ),
            StarFeedback(widget.rest),
            Gallery(restaurant: widget.rest,)
          ],
        ),
      ),
    );
  }
}
