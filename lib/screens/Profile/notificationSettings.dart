import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {

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
                    child: Text('Notification Settings',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width/15,
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
            ],
          )

      ),
    );
  }
}
