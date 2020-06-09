import 'package:flutter/material.dart';
import 'main.dart';
import 'Edit.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications),onPressed: () {},),
                    IconButton(icon: Icon(Icons.group),onPressed: () {},),
           IconButton(icon: Icon(Icons.settings),onPressed: () {},),
 
 
 
        ] 
      ),
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
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                  },
                                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          //From here u can add a profile pic
                       //   image: DecorationImage(
                            //image: CachedNetworkImageProvider(avatars[1]),
                         //   fit: BoxFit.cover,
                         // ),
                          border: Border.all(color: Colors.black,width: 2.0,),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Name", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,color: Colors.black,
                            ),),
                            Text("Edit",style: TextStyle(
                              color: Colors.grey.shade400,
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20.0),
                ListTile(
                  title: Text("Help & Support",style: TextStyle(
                            color: Colors.black,fontSize: 20.0
                          ),),
                  onTap: (){},
                ),
             
                Divider(thickness: 2.0,color: Colors.black,),
                ListTile(
                  title: Text("FAQ's",style: TextStyle(
                            color: Colors.black,)),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey.shade400,),
                  onTap: (){},
                ),
                Divider(),
                ListTile(
                  title: Text("Legal & TC",style: TextStyle(
                            color: Colors.black,)),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey.shade400,),
                  onTap: (){},
                ),
                Divider(),
                ListTile(
                  title: Text("Contact Us",style: TextStyle(
                            color: Colors.black,)),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey.shade400,),
                  onTap: (){},
                ),
                Divider(),
                ListTile(
                  title: Text("Own a Rest?",style: TextStyle(
                            color: Colors.black,)),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey.shade400,),
                  onTap: (){},
                ),
                Divider(),
                SizedBox(height: 5.0),
                ListTile(
                  title: Text("About",style: TextStyle(
                            color: Colors.black,fontSize: 20.0)),
                ),
                Divider(thickness: 2.0,color: Colors.black,),
                ListTile(
                  title: Text("Send FeedBack's",style: TextStyle(
                            color: Colors.black,)),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey.shade400,),
                  onTap: (){},
                ),
                Divider(),
                ListTile(
                  title: Text("Rate Us",style: TextStyle(
                            color: Colors.black,)),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey.shade400,),
                  onTap: (){},
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
                        onPressed: (){},
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: InkWell(
                         onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));
                  },
                                                  child: Ink(
                            
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xffeeeeee),
                                  Color(0xff263238),
                                  Color(0xffeeeeee),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(minHeight: 50,maxWidth: double.infinity),
                              child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.left,),
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