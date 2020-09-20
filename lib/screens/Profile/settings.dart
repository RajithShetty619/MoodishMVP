import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/Authenticate/deleteAccSettings.dart';
import 'package:moodish_mvp/Authenticate/forgotPassword.dart';
import 'package:moodish_mvp/screens/Profile/Edit.dart';
import 'package:moodish_mvp/screens/Profile/preferenceSettings.dart';
import 'package:app_settings/app_settings.dart';

class Settings extends StatefulWidget {
  final ImageProvider image;
  final Map<String, dynamic> user;
  Settings({this.image, this.user});
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: ()=>Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back,size: MediaQuery.of(context).size.width/10,color: Colors.black,),
                    ),
                  ),
                  Center(
                    child: Text('Settings',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width/11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Divider(thickness: 2.0,),
              ),
              ListTile(
                onTap: (){
                  Navigator
                      .push(context,
                      MaterialPageRoute(builder: (context) {
                        return ProfileSetting();
                      }));
                },
                title: Text('Change Preferences',),
                subtitle: Text('Cuisine, Food Preference(Veg or NonVeg)',style: TextStyle(color: Colors.grey),),
              ),

              ListTile(
                onTap: (){
                  Navigator
                      .push(context,
                      MaterialPageRoute(builder: (context) {
                        return DeleteAccSettings();
                      }));
                },
                title: Text('Account Settings',),
                subtitle: Text('Change your password',style: TextStyle(color: Colors.grey),),
              ),
              ListTile(
                onTap: (){
                  Navigator
                      .push(context,
                      MaterialPageRoute(builder: (context) {
                        return EditProfile(user: widget.user,image: widget.image,);
                      }));
                },
                title: Text('Edit Profile',),
                subtitle: Text('Change Profile pic ,Phone no. etc',style: TextStyle(color: Colors.grey),),
              ),
              ListTile(
                onTap: (){
                  AppSettings.openAppSettings();
                },
                title: Text('App Permission',),
                subtitle: Text('Change App Permissions',style: TextStyle(color: Colors.grey),),
              ),
              ListTile(
                onTap: (){
                  AppSettings.openNotificationSettings();
                },
                title: Text('Notification Settings',),
                subtitle: Text('Modify Notification Settings',style: TextStyle(color: Colors.grey),),
              )
            ],
          )

      ),
    );
  }
}
