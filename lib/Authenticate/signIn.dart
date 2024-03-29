import 'dart:io';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:apple_sign_in/apple_sign_in_button.dart' as button;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Authenticate/forgotPassword.dart';
import 'package:moodish_mvp/Services/authenticate.dart';
import 'signUp.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  bool _obscureText = true;

  bool _showAppleSignin = false;

  @override
  void initState() {
    super.initState();

    _useAppleSignin();
  }

  _useAppleSignin() {
    if (Platform.isIOS) {
      setState(() {
        _showAppleSignin = true;
      });
    }
  }

  final _formKey = new GlobalKey<FormState>();
  String _email = '', _password = '';
  String error = '';
  final Authenticate _auth = Authenticate();
  bool loading = false;
  bool _googleLoggedIn = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);
  _googleLogin() async {
    try {
      setState(() => loading = true);
      GoogleIdentity user = await _googleSignIn.signIn();
      setState(() {
        _googleLoggedIn = true;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
                child: Form(
              key: _formKey,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    getImageAsset(),
                    Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (String input) {
                              if (input.isEmpty)
                                return 'Enter a email';
                              else if (input.contains('@'))
                                return null;
                              else
                                return 'Not an email';
                            },
                            onChanged: (val) {
                              setState(() {
                                _email = val;
                              });
                            },
                            decoration: InputDecoration(
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(color: Colors.blueGrey),
                                prefixIcon: Icon(Icons.email),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.lightBlue)),
                                hintText: '@gmail.com'),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (String input) {
                              if (input.isEmpty)
                                return 'Enter a Password';
                              else if (input.length < 6)
                                return 'Password too short';
                              else
                                return null;
                            },
                            onChanged: (val) {
                              setState(() {
                                _password = val;
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
                                    borderSide:
                                        BorderSide(color: Colors.lightBlue)),
                                hintText:
                                    'Please Enter more than 6 characters'),
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
                                color: Colors.orange[600],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                elevation: 6.0,
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    dynamic result =
                                        await _handleSubmit(context);

                                    if (result == null) {
                                      setState(() =>
                                          error = 'Wrong password or Email');
                                      loading = false;
                                    } else {
                                      Navigator.pop(context);
                                    }
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
                          SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: appleSignIn(_auth),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            alignment: Alignment(1.0, 0),
                            padding: EdgeInsets.only(top: 15.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ForgotPassword();
                                }));
                              },
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment(1.0, 0),
                            padding: EdgeInsets.only(top: 20.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SignUp();
                                }));
                              },
                              child: Text(
                                'New Here?',
                                style: TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            error,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))));
  }

  Future _handleSubmit(BuildContext context) async {
    try {
      Dialogs.showLoadingDialog(context, _keyLoader); //invoking login
      dynamic result = await _auth.signIn(_email, _password);
      Navigator.of(_keyLoader.currentContext, rootNavigator: true)
          .pop(result); //close the dialog
    } catch (error) {
      print(error);
      return null;
    }
  }

  Widget appleSignIn(_auth) {
    if (_showAppleSignin == true) {
      return AppleSignInButton(
        onPressed: () async {
          await _auth.signInWithApple();
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return MainScreen();
          // }));
        },
        style: button.ButtonStyle.whiteOutline,
      );
    } else {
      return Container();
    }
  }
}

Widget getImageAsset() {
  AssetImage assetImage = AssetImage('assets/MoodishLogo.png');
  Image image = Image(
    image: assetImage,
    width: 250.0,
    height: 250.0,
  );
  return Container(
    alignment: Alignment(0.0, 0),
    child: image,
    padding: EdgeInsets.only(top: 30.0, bottom: 25.0),
  );
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(key: key, children: <Widget>[
                Center(
                  child: Column(children: [
                    Text(
                      'Wait a Moment...',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SpinKitCircle(
                      color: Colors.deepOrange,
                      size: 50.0,
                    ),
                  ]),
                )
              ]));
        });
  }
}
