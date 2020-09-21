import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moodish_mvp/Services/authenticate.dart';

class DeleteAcc extends StatefulWidget {
  @override
  _DeleteAccState createState() => _DeleteAccState();
}

class _DeleteAccState extends State<DeleteAcc> {
  final _formKey = new GlobalKey<FormState>();
  String _email = '', _password = '';
  bool _obscureText = true;
  String error = '';
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                getImageAsset(),
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
                          borderSide: BorderSide(color: Colors.lightBlue)),
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
                          borderSide: BorderSide(color: Colors.lightBlue)),
                      hintText: 'Please Enter more than 6 characters'),
                  obscureText: _obscureText,
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
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
                            dynamic result = await _handleSubmit(context);
                            if (result == null) {
                              setState(() => error = 'Wrong password or Email');
                            } else {
                              await Authenticate()
                                  .deleteUser(_email, _password);
                              Navigator.of(context).pop('pop');
                            }
                          }
                        },
                        child: Center(
                          child: Text(
                            'Delete Account',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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
          ),
        ),
      ),
    );
  }

  Future _handleSubmit(BuildContext context) async {
    try {
      Dialogs.showLoadingDialog(context, _keyLoader); //invoking login
      dynamic result = await Authenticate().deleteUser(_email, _password);
      Navigator.of(_keyLoader.currentContext, rootNavigator: true)
          .pop(result); //close the dialog
    } catch (error) {
      print(error);
      return null;
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
