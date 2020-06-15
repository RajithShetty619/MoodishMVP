import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'page45.dart';

class Page3 extends StatefulWidget {
  int colorVal;
  Page3(this.colorVal);
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 7);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      widget.colorVal = 0xffe91e63;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            indicatorWeight: 4.0,
            indicatorColor: Color(0xffe91e63),
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                icon: Icon(FontAwesomeIcons.compass,
                    color: _tabController.index == 0
                        ? Color(widget.colorVal)
                        : Colors.grey),
                child: Text('For You',
                    style: TextStyle(
                        color: _tabController.index == 0
                            ? Color(widget.colorVal)
                            : Colors.grey)),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.tv,
                    color: _tabController.index == 1
                        ? Color(widget.colorVal)
                        : Colors.grey),
                child: Text('TV',
                    style: TextStyle(
                        color: _tabController.index == 1
                            ? Color(widget.colorVal)
                            : Colors.grey)),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.solidStar,
                    color: _tabController.index == 2
                        ? Color(widget.colorVal)
                        : Colors.grey),
                child: Text('TopSelling',
                    style: TextStyle(
                        color: _tabController.index == 2
                            ? Color(widget.colorVal)
                            : Colors.grey)),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.solidBookmark,
                    color: _tabController.index == 3
                        ? Color(widget.colorVal)
                        : Colors.grey),
                child: Text('New Releases',
                    style: TextStyle(
                        color: _tabController.index == 3
                            ? Color(widget.colorVal)
                            : Colors.grey)),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.shapes,
                    color: _tabController.index == 4
                        ? Color(widget.colorVal)
                        : Colors.grey),
                child: Text('Genres',
                    style: TextStyle(
                        color: _tabController.index == 4
                            ? Color(widget.colorVal)
                            : Colors.grey)),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.film,
                    color: _tabController.index == 5
                        ? Color(widget.colorVal)
                        : Colors.grey),
                child: Text('Studio',
                    style: TextStyle(
                        color: _tabController.index == 5
                            ? Color(widget.colorVal)
                            : Colors.grey)),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.home,
                    color: _tabController.index == 6
                        ? Color(widget.colorVal)
                        : Colors.grey),
                child: Text('Family',
                    style: TextStyle(
                        color: _tabController.index == 6
                            ? Color(widget.colorVal)
                            : Colors.grey)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Center(child: Text('For you')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TV')),
            ),
             Container(
              height: 200.0,
              child: Center(child: Text('Top Sellings')),
            ),
            MovieReleaseTabs(),
             Container(
              height: 200.0,
              child: Center(child: Text('Genres')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Studio')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('Family')),
            ),
          ],
        ),
      ),
    );
  }
}
