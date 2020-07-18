import 'package:flutter/material.dart';
import 'package:moodish_mvp/Authenticate/forgotPassword.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap:(){},
                      borderRadius: BorderRadius.circular(150),
                      child:Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text('Edit',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                      ),)

                  ],
                ),
              ),
              SizedBox(height: 5.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Divider(thickness: 2.0,),
              ),
              getListTile('Name','Varun Singh',context,0),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Divider(thickness: 2.0,),
              ),
              getListTile('Email','varunsingh1308@gmail.com',context,0),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Divider(thickness: 2.0,),
              ),
              getListTile('Password','********',context,1),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Divider(thickness: 2.0,),
              ),
              getListTile('Birthdate','13/08',context,2),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Divider(thickness: 2.0,),
              ),
              getListTile('Phone number','9326562724',context,0),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Divider(thickness: 2.0,),
              ),
              getListTile('Location','Mumbai,Maharashtra',context,3),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Divider(thickness: 2.0,),
              ),
              SizedBox(height: 20.0,),
              InkWell(
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.blue[900],
                        Colors.blueAccent,
                        Colors.blue[900],
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,right: 100.0,left: 100.0),
                      child: Text('Save',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white
                        ),),
                    ),
                    onPressed: (){},
                  ),
                ),
              ),
              SizedBox(height: 20.0,)

            ],
          ),
        ),
      ),
    );
  }
}

Widget getListTile(String category,String name,BuildContext context,int tile){
  return InkWell(
    onTap: (){
      if(tile==0)
      _onAlertWithCustomContentPressed(category, name, context);
      if(tile==1)
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
              return ForgotPassword();
            }));
      if(tile==2)
        {/*put calendar fot birthdate*/}
      if(tile==3)
        {/*put google map key*/}
    },
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(category,
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold
            ),),
        ),
        Text(name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 20.0
          ),)
      ],
    ),
  );
}

_onAlertWithCustomContentPressed(String category,String name,context) {
  Alert(
      context: context,
      title: category,
      content: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.edit),
          labelText: name,
        ),
      ),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Save",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}




//import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'group.dart';
//
//class EditProfile extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return EditProfileState();
//  }
//}
//
//class EditProfileState extends State<EditProfile> {
//  String _name;
//  String _email;
//  String _password;
//  String _birthdate;
//  String _phoneNumber;
//  String _location;
//
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//  Widget _buildName() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'Name'),
//      maxLength: 10,
//      validator: (String value) {
//        if (value.isEmpty) {
//          return 'Name is Required';
//        }
//
//        return null;
//      },
//      onSaved: (String value) {
//        _name = value;
//      },
//    );
//  }
//
//  Widget _buildEmail() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'Email'),
//      validator: (String value) {
//        if (value.isEmpty) {
//          return 'Email is Required';
//        }
//
//        if (!RegExp(
//                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
//            .hasMatch(value)) {
//          return 'Please enter a valid email Address';
//        }
//
//        return null;
//      },
//      onSaved: (String value) {
//        _email = value;
//      },
//    );
//  }
//
//  Widget _buildPassword() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'Password'),
//      keyboardType: TextInputType.visiblePassword,
//      validator: (String value) {
//        if (value.isEmpty) {
//          return 'Password is Required';
//        }
//
//        return null;
//      },
//      onSaved: (String value) {
//        _password = value;
//      },
//    );
//  }
//
//  Widget _builURL() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'birthdate'),
//      keyboardType: TextInputType.datetime,
//      validator: (String value) {
//        if (value.isEmpty) {
//          return 'Birthdate is Required';
//        }
//
//        return null;
//      },
//      onSaved: (String value) {
//        _birthdate = value;
//      },
//    );
//  }
//
//  Widget _buildPhoneNumber() {
//    return TextFormField(
//      decoration: InputDecoration(labelText: 'Phone number'),
//      keyboardType: TextInputType.phone,
//      validator: (String value) {
//        if (value.isEmpty) {
//          return 'Phone number is Required';
//        }
//
//        return null;
//      },
//      onSaved: (String value) {
//        _birthdate = value;
//      },
//    );
//  }
//
//  Widget _buildCalories() {
//   return TextFormField(
//      decoration: InputDecoration(labelText: 'Location'),
//      maxLength: 10,
//      validator: (String value) {
//        if (value.isEmpty) {
//          return 'Location is Required';
//        }
//
//        return null;
//      },
//      onSaved: (String value) {
//        _name = value;
//      },
//    );
//  }
//  Widget Profile(){
//    return
//    Container(
//                         width: 120,
//                            height: 120,
//                            decoration: BoxDecoration(
//                              color: Colors.blueGrey,
//                              shape: BoxShape.circle,
//                           //   image: DecorationImage(
//                                //image: CachedNetworkImageProvider(avatars[1]),
//                             //   fit: BoxFit.cover,
//                             // ),
//                              border: Border.all(color: Colors.black,width: 2.0,),
//                            ),
//
//                      );
//
//              //      SizedBox(height: 30,),
//                //   Divider(color: Colors.black,),
//                  //  SizedBox(height: 30,),
//                   // Text("Edit",style: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.bold,),),
//                  //  SizedBox(height: 6,),
//                    //Text("msg",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//
//      body: SingleChildScrollView(
//              child: Container(
//
//          margin: EdgeInsets.all(20),
//
//          child: Form(
//            key: _formKey,
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                SizedBox(height: 10,),
//                Container(
//                         width: 120,
//                            height: 120,
//                            decoration: BoxDecoration(
//                              color: Colors.blueGrey,
//                              shape: BoxShape.circle,
//                           //   image: DecorationImage(
//                                //image: CachedNetworkImageProvider(avatars[1]),
//                             //   fit: BoxFit.cover,
//                             // ),
//                              border: Border.all(color: Colors.black,width: 2.0,),
//                            ),
//
//
//                ),
//                    SizedBox(height: 10,),Text("Edit",style: TextStyle(fontSize: 15,color: Colors.blueGrey,fontWeight: FontWeight.bold,),),
//
//                   Divider(color: Colors.black,),
//                    SizedBox(height: 30,),
//                    //  SizedBox(height: 6,),
//
//                _buildName(),
//                _buildEmail(),
//                _buildPassword(),
//                _builURL(),
//                _buildPhoneNumber(),
//                _buildCalories(),
//                SizedBox(height: 20),
//
//                Container(
//                      height: 50,
//                      child: FlatButton(
//                        onPressed: (){},
//                        padding: EdgeInsets.all(0),
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(6),
//                        ),
//                        child: InkWell(
//                         onTap: (){
//                            if (!_formKey.currentState.validate()) {
//                      return;
//                    }
//
//                    _formKey.currentState.save();
//
//                    print(_name);
//                    print(_email);
//                    print(_phoneNumber);
//                    print(_birthdate);
//                    print(_password);
//                    print(_location);
//
//                    Navigator.push(context, MaterialPageRoute(builder: (context) => group()));
//                  },
//                                                  child: Ink(
//
//                            decoration: BoxDecoration(
//                              gradient: LinearGradient(
//                                begin: Alignment.centerLeft,
//                                end: Alignment.centerRight,
//                                colors: [
//                                  Color(0xffeeeeee),
//                                  Color(0xff263238),
//                                  Color(0xffeeeeee),
//                                ],
//                              ),
//                              borderRadius: BorderRadius.circular(6),
//                            ),
//                            child: Container(
//                              alignment: Alignment.center,
//                              constraints: BoxConstraints(minHeight: 50,maxWidth: double.infinity),
//                              child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
