import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodish_mvp/Services/database.dart';  
import '../../Services/authenticate.dart';
import 'Edit.dart';

class Profile extends StatefulWidget {
    
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ImageProvider _image;
  Map<String,String> userData = {};
  @override
  void initState() {
    super.initState();

    data() async {
      try {
        String _url = await DatabaseService().downloadPhoto();
        ImageProvider _file =await NetworkImage(_url);
        setState(() {
          _image = _file;
        });
      } catch (e) {
        print(e);
      }
      Map<String,String> _userData = await DatabaseService().returnUser();
      setState(() {
        userData = _userData;
      });
      print(userData);
    }

    data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
//        appBar: AppBar(backgroundColor: Colors.grey, actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.notifications),
//            onPressed: () {},
//          ),
//          IconButton(
//            icon: Icon(Icons.group),
//            onPressed: () {},
//          ),
//          IconButton(
//            icon: Icon(Icons.settings),
//            onPressed: () {},
//          ),
//        ]),
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
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile( )));
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
                              width: 2.0,
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
                                userData["name"]??'name',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                userData["email"]??'email',
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
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.group,
                        size: 50,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 50,
                      ),
                      onPressed: () {},
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
                  onTap: () {},
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
                  onTap: () {},
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
                  onTap: () {},
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
                              Colors.blue[900],
                              Colors.blueAccent,
                              Colors.blue[900],
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
