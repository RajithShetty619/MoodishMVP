import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  String _email = '';
  String msg= '';
  final _formKey = new GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              getImageAsset(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Please enter Email Address to reset your Password :',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (String input){
                    if(input.isEmpty)
                      return 'Enter a email';
                    else if(input.contains('@'))
                      return null;
                    else
                      return 'Not an email';

                  },
                  onChanged: (val) {setState(() {
                    _email = val ;
                  });

                  },
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      prefixIcon: Icon(Icons.email),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlue)),
                      hintText: '@gmail.com'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RaisedButton(
                  color: Colors.orange[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),

                  elevation: 6.0,
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                      FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
                      setState(() {
                        msg='A link is sent on your email...\nClick the link to reset password!';
                      });



                    }
                  },
                  child: Center(
                    child: Text(
                      'Send Mail',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Text(msg,
              style: TextStyle(
                color: Colors.red,
                fontSize: 15.0,
                fontWeight: FontWeight.bold
              ),)


            ],
          ),
        ),
      ),
    );
  }
}
Widget getImageAsset() {
  AssetImage assetImage = AssetImage('assets/MoodishLogo.png');
  Image image = Image(
    image: assetImage,
    width: 300.0,
    height: 300.0,
  );
  return Container(
    alignment: Alignment(0.0, 0),
    child: image,
    padding: EdgeInsets.only(top: 35.0, bottom: 25.0),
  );
}