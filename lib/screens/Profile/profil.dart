import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/screens/Profile/profileCard.dart';
import 'package:share/share.dart';
import '../../Services/authenticate.dart';
import 'Edit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'settings.dart';
import 'notificationSettings.dart';
import 'likedFood.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ImageProvider _image;
  Map<String, dynamic> userData = {};
  @override
  void initState() {
    super.initState();

    data() async {
      try {
        String _url = await DatabaseService().downloadPhoto();
        ImageProvider _file = NetworkImage(_url);
        setState(() {
          _image = _file;
        });
      } catch (e) {
        print(e);
      }
      Map<String, dynamic> _userData = await DatabaseService().returnUser();
      setState(() {
        userData = _userData;
      });
    }

    data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Theme(
        data: Theme.of(context).copyWith(
          brightness: Brightness.light,
          primaryColor: Colors.purple,
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () async {
                    final data = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfile(
                                  user: userData,
                                  image: _image,
                                )));
                    setState(() {
                      userData = data["_user"];
                      _image = data["_image"];
                    });
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: _image == null
                                    ? AssetImage('assets/anonuser.png')
                                    : _image),
                            color: Colors.grey,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 0.7,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                userData["name"] ?? 'name',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                userData["email"] ?? 'email',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black38),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Edit",
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Divider(
                  thickness: 2.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationSettings()));
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.notifications,
                            size: 40.0,
                          ),
                          Center(
                              child: Text(
                            'Notifications',
                            style: TextStyle(color: Colors.black),
                          ))
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Settings(
                                      user: userData,
                                      image: _image,
                                    )));
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            size: 40,
                          ),
                          Center(
                              child: Text(
                            'Settings',
                            style: TextStyle(color: Colors.black),
                          ))
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LikedFood()));
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            size: 40,
                          ),
                          Center(
                              child: Text(
                            'Liked',
                            style: TextStyle(color: Colors.black),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  thickness: 2.0,
                ),
                ListTile(
                  title: Text("My Profile",
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileCard(
                                  user: userData,
                                  image: _image,
                                )));
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Help & Support",
                    style: TextStyle(color: Colors.black38, fontSize: 24.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("FAQs",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {
                    launch('https://snapinsight.net/faq.php');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("Legal & TC",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {
                    launch('https://snapinsight.net/termsandconditions.php');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("Contact Us",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {
                    launch('https://snapinsight.net/contactus.php');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("Own a Rest?",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {
                    launch('https://snapinsight.net/moodish/restreg.php');
                  },
                ),
                Divider(),
                SizedBox(height: 5.0),
                ListTile(
                  title: Text("About",
                      style: TextStyle(color: Colors.black38, fontSize: 24.0)),
                ),
                ListTile(
                  title: Text("Send FeedBack",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  title: Text("Rate Us",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {
                    launch(Platform.isIOS
                        ? "https://apps.apple.com/us/app/id1527896738"
                        : 'http://play.google.com/store/apps/details?id=net.moodish.snapinsight');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("Share our App",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {
                    final RenderBox box = context.findRenderObject();
                    Share.share(
                        'Moodish - Recipes and Restaurants discovery \nhttp://play.google.com/store/apps/details?id=net.moodish.snapinsight',
                        subject:
                            "http://play.google.com/store/apps/details?id=net.moodish.snapinsight",
                        sharePositionOrigin:
                            box.localToGlobal(Offset.zero) & box.size);
                  },
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    child: FlatButton(
                      onPressed: () async {
                        await Authenticate().signOut();
                      },
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: InkWell(
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.white,
                                Colors.white,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: FlatButton(
                            onPressed: () async {
                              setState(() {
                                Authenticate().signOut();
                              });
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              constraints: BoxConstraints(
                                  minHeight: 50, maxWidth: double.infinity),
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange[600],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
