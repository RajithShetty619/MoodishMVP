import 'package:flutter/material.dart';
import 'main.dart';
import 'Edit.dart';
import 'profil.dart';

class friends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
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
            color: Colors.black,
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
                          color: Colors.blueGrey,
                          shape: BoxShape.circle,
                       //   image: DecorationImage(
                            //image: CachedNetworkImageProvider(avatars[1]),
                         //   fit: BoxFit.cover,
                         // ),
                          border: Border.all(color: Colors.white,width: 2.0,),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Name", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0, color: Colors.black,
                            ),),
                            Text("Edit",style: TextStyle(
                              color: Colors.blueGrey,
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.black,thickness: 3.0,),
                const SizedBox(height: 20.0),
                ListTile(
                  title: Text("Friends Joined",style: TextStyle(
                            color: Colors.black,fontSize: 20.0
                          ),),
                  onTap: (){},
                ),
                SizedBox(height: 75.0),
                 Divider(color: Colors.blueGrey,thickness: 2.0,),
                ListTile(
                  title: Text("Friends Joined",style: TextStyle(
                            color: Colors.black,fontSize: 20.0
                          ),),
                  onTap: (){},
                ),
                SizedBox(height: 75.0),

                 Divider(color: Colors.blueGrey,thickness: 2.0,),
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
                              child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
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