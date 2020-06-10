import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/screens/loading.dart';
import 'package:moodish_mvp/screens/mainScreen.dart';
import 'signUp.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  bool _obscureText = true;
  final _formKey = new GlobalKey<FormState>();
  String _email = '' , _password = '' ;
  String error = '';
  final Authenticate _auth = Authenticate();
  bool loading = false;
  bool _googleLoggedIn = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  _googleLogin ()async{
    try{
      setState(() => loading = true);
      await _googleSignIn.signIn();
      setState(() {
        _googleLoggedIn = true;
      });
    }
    catch(e){
      print(e.toString());
    }
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return loading ? Loading() : SafeArea(
        child : Scaffold(
            resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset: true,
            body : SingleChildScrollView(
                child : Form(
                  key: _formKey,
                  child : Container(
                    child: Column(
                      children: <Widget>[
                        getImageAsset(),
                        Container(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
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
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                validator: (String input){
                                  if(input.isEmpty)
                                    return 'Enter a Password';
                                  else if(input.length<6)
                                    return 'Password too short';
                                  else
                                    return null;
                                },
                                onChanged: (val) {setState(() {
                                  _password = val ;
                                });

                                },
                                decoration: InputDecoration(
                                    labelText: 'PASSWORD',
                                    labelStyle: TextStyle(color: Colors.blueGrey),
                                    prefixIcon: Icon(Icons.vpn_key),
                                    suffixIcon: IconButton(
                                        icon: Icon(_obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        }),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.lightBlue)),
                                    hintText: 'Please Enter more than 6 characters'),
                                obscureText: _obscureText,
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                height: 40.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.lightBlueAccent,
                                  color: Colors.blue,
                                  child: RaisedButton(
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0)
                                    ),

                                    elevation: 6.0,
                                    onPressed: () async{
                                      if(_formKey.currentState.validate()){
                                        setState(() => loading = true);

                                        dynamic result = await _auth.signIn(_email, _password);

                                        if(result == null){
                                          setState(() => error = 'Wrong password or Email');
                                          loading = false;}
                                        else
                                          Navigator.push(context, MaterialPageRoute(builder: (context){
                                            return MainScreen();
                                          }));

                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.0,),
                              SignInButton(
                                Buttons.Google,
                                onPressed: () {
                                  if(_googleLoggedIn)
                                    return MainScreen();
                                  else
                                    return _googleLogin();
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                alignment: Alignment(1.0, 0),
                                padding: EdgeInsets.only(top: 15.0),
                                child: InkWell(
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment(1.0, 0),
                                padding: EdgeInsets.only(top: 20.0),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return SignUp();
                                    }));
                                  },
                                  child: Text(
                                    'New Here?',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0,),
                              Text(
                                error,
                                style: TextStyle(color: Colors.red, fontSize:  12.0),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
            )
        )
    );
  }
}

Widget getImageAsset() {
  AssetImage assetImage = AssetImage('assets/snapinsightlogo.png');
  Image image = Image(
    image: assetImage,
    width: 200.0,
    height: 200.0,
  );
  return Container(
    alignment: Alignment(0.0, 0),
    child: image,
    padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
  );
}
