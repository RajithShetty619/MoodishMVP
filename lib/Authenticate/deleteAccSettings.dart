import 'package:flutter/material.dart';
import 'package:moodish_mvp/Authenticate/deleteAcc.dart';
import 'package:moodish_mvp/Authenticate/forgotPassword.dart';
class DeleteAccSettings extends StatefulWidget {
  @override
  _DeleteAccSettingsState createState() => _DeleteAccSettingsState();
}

class _DeleteAccSettingsState extends State<DeleteAccSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                  child: Text('Account Settings',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width/12,
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
                      return ForgotPassword();
                    }));
              },
              title: Text('Change Password',),
              subtitle: Text('Forgot Password?',style: TextStyle(color: Colors.grey),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Divider(thickness: 2.0,),
            ),
            ListTile(
              onTap: ()async{
                dynamic data = await  Navigator
                    .push(context,
                    MaterialPageRoute(builder: (context) {
                      return DeleteAcc();
                    }));
                if(data=="pop")
                  {
                    Navigator.of(context).pop('pop');
                  }

              },
              title: Text('Delete Account',),
              subtitle: Text('Wanna Delete Your Account?',style: TextStyle(color: Colors.grey),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Divider(thickness: 2.0,),
            )
          ],
        ),
      ),
    );
  }
}
//Bj00dFCBpgRFiW1ZODyvVHADLg33
