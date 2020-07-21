import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Profile/profil.dart';
import 'package:moodish_mvp/screens/Restaurants/home.dart';

import 'Food/pages/foodHome.dart';

class MainScreen extends StatefulWidget {
  final List<String> mood;
  MainScreen({this.mood});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    FoodHome(),
    Restaurant(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      )),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.person),
            title: Text('Profile'),

            //onTap(){

            // }
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue[300],
        onTap: _onItemTapped,
      ),
    );
  }
}
