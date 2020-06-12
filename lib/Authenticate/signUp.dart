import 'package:flutter/material.dart';
import 'package:moodish_mvp/Authenticate/loading.dart';
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/models/name.dart';
 
import 'package:moodish_mvp/screens/mainScreen.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _checkBoxValue = false;
  final _formKey = new GlobalKey<FormState>();
  final _controller = TextEditingController();
  String pass1 , pass2;
  String _email = '' , _password = '' ;
  String error = '';
  String _name = '';
  final Authenticate _auth = Authenticate();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return loading ? Loading() : SafeArea(
        child : Scaffold(
            resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
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
                                controller: _controller,
                                decoration: InputDecoration(
                                  labelText: 'USERNAME',
                                  labelStyle: TextStyle(color: Colors.blueGrey),
                                  prefixIcon: Icon(Icons.people),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.lightBlue)),
                                ),
                                onChanged: (val) {setState(() {
                                  _name = val ;
                                  Name().name = _name;
                                });

                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
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
                                decoration: InputDecoration(
                                    labelText: 'EMAIL',
                                    labelStyle: TextStyle(color: Colors.blueGrey),
                                    prefixIcon: Icon(Icons.email),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.lightBlue)),
                                    hintText: '@gmail.com'),
                                onChanged: (val) {setState(() {
                                  _email = val ;
                                });

                                },                  ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                controller: _controller,
                                validator: (pass1){
                                  if(pass1.isEmpty)
                                    return 'Enter a Password';
                                  else if(pass1.length<6)
                                    return 'Password too short';
                                  else
                                    return null;
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
                                        borderSide: BorderSide(color: Colors.lightBlue)),
                                    hintText: 'Please Enter more than 8 characters'),
                                obscureText: _obscureText1,
                              ),
                              SizedBox(height: 10.0),
                              TextFormField(
                                validator: (pass2){
                                  if(pass2.isEmpty)
                                    return 'Enter a Password';
                                  else if(pass2.length<6)
                                    return 'Password too short';
                                  else if(_controller.text!=pass2)
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
                                        borderSide: BorderSide(color: Colors.lightBlue)),
                                    hintText: 'Please Enter more than 8 characters'),
                                onChanged: (val) {setState(() {
                                  _password = val ;
                                });

                                },
                                obscureText: _obscureText,
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                alignment: Alignment(1.0, 0.0),
                                child: Row(
                                  children: <Widget>[
                                    Text('Agree to Terms & Conditions'),
                                    Checkbox(value: _checkBoxValue, onChanged: (bool value){
                                      setState(() {
                                        _checkBoxValue = value;
                                      },
                                      );
                                    })
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
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0)
                                    ),
                                    onPressed: () async{
                                      if(_formKey.currentState.validate()){
                                        setState(() => loading = true);
                                        dynamic result = await _auth.newRegister(_email, _password);
                                        if(result == null){
                                          setState(() => error = 'Please Enter a Valid Email');
                                          loading = false;}
                                        else
                                          Navigator.push(context, MaterialPageRoute(builder: (context){
                                            return MainScreen();
                                          }));

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
    padding: EdgeInsets.only(top: 50.0, bottom: 25.0),
  );
}
