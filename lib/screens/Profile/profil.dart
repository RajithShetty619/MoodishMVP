import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/Services/database.dart';
import '../../Services/authenticate.dart';
import 'Edit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'settings.dart';

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
                    final _userdata = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfile(
                                  user: userData,
                                  image: _image,
                                )));
                    setState(() {
                      userData = _userdata;
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
                            //From here u can add a profile pic
                            //   image: DecorationImage(
                            //image: CachedNetworkImageProvider(avatars[1]),
                            //   fit: BoxFit.cover,
                            // ),
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
                    IconButton(
                      icon: Icon(
                        Icons.notifications,
                        size: 50.0,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext idcontext) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  height: 135,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Coming Soon.......!',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: RaisedButton(
                                            onPressed: () => Navigator.of(
                                                    idcontext,
                                                    rootNavigator: true)
                                                .pop(),
                                            child: Text('ok'),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.group,
                        size: 50,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext idcontext) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  height: 135,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Coming Soon.......!',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: RaisedButton(
                                            onPressed: () => Navigator.of(
                                                    idcontext,
                                                    rootNavigator: true)
                                                .pop(),
                                            child: Text('ok'),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 50,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileSetting()));
                      },
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
                  title: Text(
                    "Help & Support",
                    style: TextStyle(color: Colors.black38, fontSize: 24.0),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text("FAQ's",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: 150.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Linkify(
                                        onOpen: _onOpen,
                                        text:
                                            'You have got Questions? We have answers\nClick https://snapinsight.net/faq.php',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: RaisedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text('ok'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
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
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: 150.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Linkify(
                                        onOpen: _onOpen,
                                        text:
                                            'To View Terms And Conditions\nClick https://snapinsight.net/termsandconditions.php',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: RaisedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text('ok'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
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
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: 150.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Linkify(
                                        onOpen: _onOpen,
                                        text:
                                            'Contact Us?\nClick https://snapinsight.net/contacts.pho',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: RaisedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text('ok'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
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
                  onTap: () {},
                ),
                Divider(),
                SizedBox(height: 5.0),
                ListTile(
                  title: Text("About",
                      style: TextStyle(color: Colors.black38, fontSize: 24.0)),
                ),
                ListTile(
                  title: Text("Send FeedBack's",
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
                  onTap: () {},
                ),
                Divider(),

                //  SwitchListTile(
                //  title: Text("Email Notifications"),
                // subtitle: Text("On"),
                //  value: true,
                //       onChanged: (val){},
                //   ),
                //    SwitchListTile(
                //     title: Text("Push Notifications"),
                //    subtitle: Text("Off"),
                //   value: false,
                //   onChanged: (val){},
                //  ),
                Container(
                  height: 50,
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
                              Colors.orange[900],
                              Colors.orange,
                              Colors.orange[900],
                            ],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: FlatButton(
                          onPressed: () async {
                            await Authenticate().signOut();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            constraints: BoxConstraints(
                                minHeight: 50, maxWidth: double.infinity),
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
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

Future<void> _onOpen(LinkableElement link) async {
  if (await canLaunch(link.url)) {
    await launch(
      link.url,
      enableJavaScript: true,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $link';
  }
}
