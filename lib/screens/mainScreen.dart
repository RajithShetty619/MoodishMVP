import 'package:custom_navigator/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/pages/foodHome.dart';
import 'package:moodish_mvp/screens/Profile/profil.dart';
import 'package:moodish_mvp/screens/Restaurants/home.dart';
import 'package:moodish_mvp/screens/Restaurants/mood.dart';
import 'package:moodish_mvp/screens/search/search.dart';
import 'package:flutter/cupertino.dart';

class MainScreen extends StatefulWidget {
  final String mood;
  MainScreen({this.mood});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        /* ///////////////////////////////////PUT ALERT BOX HERE /////////////////////////////////// */
        /* return true if want to exit the app  else false*/
        return false;
      },
      child: Scaffold(
        body: Center(
            child: IndexedStack(
          index: _selectedIndex,
          children: [
            FoodHome(
              mood: widget.mood,
            ),
            Restaurant(),
            Search(),
            Profile(),
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              title: Text('Food'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              title: Text('Restaurant'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.lightBlue[300],
          // unselectedItemColor: Colors.grey[400],
          // unselectedLabelStyle: TextStyle(
          //   background: Paint(),
          //   color: Colors.grey[400],
          // ),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
