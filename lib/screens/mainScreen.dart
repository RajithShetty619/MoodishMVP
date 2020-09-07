import 'package:custom_navigator/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/screens/Food/pages/foodHome.dart';
import 'package:moodish_mvp/screens/Profile/profil.dart';
import 'package:moodish_mvp/screens/Restaurants/home.dart';
import 'package:moodish_mvp/screens/Restaurants/mood.dart';
import 'package:moodish_mvp/screens/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MainScreen extends StatefulWidget {
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
        bool value;
        await Alert(
          context: context,
          type: AlertType.warning,
          title: "Do You Want To Leave The App?",
          desc: "Press No to continue or Yes to Exit!",
          buttons: [
            DialogButton(
              child: Text(
                "Yes",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();

                setState(() {
                  value = true;
                });
              },
              color: Colors.green[600],
            ),
            DialogButton(
              child: Text(
                "No",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                setState(() {
                  value = false;
                });
              },
              color: Colors.red[700],
            )
          ],
        ).show();
        /* return true if want to exit the app  else false*/
        return value;
      },
      child: Scaffold(
        body: Center(
            child: IndexedStack(
          index: _selectedIndex,
          children: [
            FoodHome(),
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
          selectedItemColor: Color.fromARGB(255,253,139,25),
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
