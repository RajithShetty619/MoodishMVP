import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/models/user.dart';
import 'package:moodish_mvp/screens/mainScreen.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  var _controller = TextEditingController();
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _checkBoxValue = false;
  final _formKey = new GlobalKey<FormState>();
  String err = '';
  String pass1, pass2;
  String _email = '', _password = '';
  String error = '';
  String _name = '';
  final Authenticate _auth = Authenticate();
  bool loading = false;
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
                  children: <Widget>[
                    getImageAsset(),
                    Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _controller,
                            decoration: InputDecoration(
                              labelText: 'USERNAME',
                              labelStyle: TextStyle(color: Colors.blueGrey),
                              prefixIcon: Icon(Icons.people),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.lightBlue)),
                            ),
                            onChanged: (val) {
                              setState(() {
//                                  Authenticate(name: val);
                                _name = val;
//                                  print(_name);
//                                print(val);
//                                  Authenticate().name = _name;
                              });
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
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
                            decoration: InputDecoration(
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(color: Colors.blueGrey),
                                prefixIcon: Icon(Icons.email),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.lightBlue)),
                                hintText: '@gmail.com'),
                            onChanged: (val) {
                              setState(() {
                                _email = val;
                              });
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            validator: (pass1) {
                              if (pass1.isEmpty)
                                return 'Enter a Password';
                              else if (pass1.length < 6)
                                return 'Password too short';
                              else
                                return null;
                            },
                            onChanged: (val) {
                              pass1 = val;
                            },
                            decoration: InputDecoration(
                                labelText: 'NEW PASSWORD',
                                labelStyle: TextStyle(color: Colors.blueGrey),
                                prefixIcon: Icon(Icons.keyboard),
                                suffixIcon: IconButton(
                                    icon: Icon(_obscureText1
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText1 = !_obscureText1;
                                      });
                                    }),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.lightBlue)),
                                hintText:
                                    'Please Enter more than 8 characters'),
                            obscureText: _obscureText1,
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            validator: (pass2) {
                              if (pass2.isEmpty)
                                return 'Enter a Password';
                              else if (pass2.length < 6)
                                return 'Password too short';
                              else if (pass1 != pass2)
                                return 'Password doesnt match';
                              else
                                return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'CONFIRM PASSWORD',
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
                                    'Please Enter more than 8 characters'),
                            onChanged: (val) {
                              setState(() {
                                _password = val;
                              });
                            },
                            obscureText: _obscureText,
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            alignment: Alignment(1.0, 0.0),
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                    value: _checkBoxValue,
                                    activeColor: Colors.black,
                                    onChanged: (bool value) {
                                      setState(
                                        () {
                                          _checkBoxValue = value;
                                        },
                                      );
                                    }),
                                Text('Agree to Terms & Conditions'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
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
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    // dynamic result =
                                    //     await _handleSubmit(context);
                                    dynamic result =
                                        await _handleSubmit(context);
                                    if (result == null) {
                                      setState(() => error =
                                          'Email or Password is wrong!');
                                      loading = false;
                                    }
                                    if (_checkBoxValue == false) {
                                      setState(() => err =
                                          'Please Accept the Terms and Conditions!');
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Container(
                                                height: 175,
                                                child: Column(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Text(
                                                        err,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: RaisedButton(
                                                          onPressed: () =>
                                                              Navigator.of(
                                                                      context,
                                                                      rootNavigator:
                                                                          true)
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
                                    } else {
                                      Navigator.pop(context);
                                    }
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'SIGNUP',
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
                            height: 5.0,
                          ),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))));
  }

  Future<User> _handleSubmit(BuildContext context) async {
    try {
      Dialogs.showLoadingDialog(context, _keyLoader); //invoking login
      dynamic result = await _auth.newRegister(_email, _name, _password);
      Navigator.of(_keyLoader.currentContext, rootNavigator: true)
          .pop(result); //close the dialog
    } catch (error) {
      print(error);
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
    padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
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
