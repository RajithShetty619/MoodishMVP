import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'group.dart';

class EditProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditProfileState();
  }
}

class EditProfileState extends State<EditProfile> {
  String _name;
  String _email;
  String _password;
  String _birthdate;
  String _phoneNumber;
  String _location;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _builURL() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'birthdate'),
      keyboardType: TextInputType.datetime,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Birthdate is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _birthdate = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _birthdate = value;
      },
    );
  }

  Widget _buildCalories() {
   return TextFormField(
      decoration: InputDecoration(labelText: 'Location'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Location is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }
  Widget Profile(){
    Container(
                         width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              shape: BoxShape.circle,
                           //   image: DecorationImage(
                                //image: CachedNetworkImageProvider(avatars[1]),
                             //   fit: BoxFit.cover,
                             // ),
                              border: Border.all(color: Colors.black,width: 2.0,),
                            ),

                      );
                    
              //      SizedBox(height: 30,),
                //   Divider(color: Colors.black,),
                  //  SizedBox(height: 30,),
                   // Text("Edit",style: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.bold,),),
                  //  SizedBox(height: 6,),
                    //Text("msg",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
                  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
              child: Container(

          margin: EdgeInsets.all(20),
          
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10,),
                Container(
                         width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              shape: BoxShape.circle,
                           //   image: DecorationImage(
                                //image: CachedNetworkImageProvider(avatars[1]),
                             //   fit: BoxFit.cover,
                             // ),
                              border: Border.all(color: Colors.black,width: 2.0,),
                            ),


                ),
                    SizedBox(height: 10,),Text("Edit",style: TextStyle(fontSize: 15,color: Colors.blueGrey,fontWeight: FontWeight.bold,),),
                 
                   Divider(color: Colors.black,),
                    SizedBox(height: 30,),
                    //  SizedBox(height: 6,),
                
                _buildName(),
                _buildEmail(),
                _buildPassword(),
                _builURL(),
                _buildPhoneNumber(),
                _buildCalories(),
                SizedBox(height: 20),
               
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
                            if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(_name);
                    print(_email);
                    print(_phoneNumber);
                    print(_birthdate);
                    print(_password);
                    print(_location);

                    Navigator.push(context, MaterialPageRoute(builder: (context) => group()));
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

/*class EditProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
                  child: Container(
            
            padding: EdgeInsets.only(left: 16,right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                          SizedBox(height: 40,),
                    Center(
                      child: Container(
                         width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              shape: BoxShape.circle,
                           //   image: DecorationImage(
                                //image: CachedNetworkImageProvider(avatars[1]),
                             //   fit: BoxFit.cover,
                             // ),
                              border: Border.all(color: Colors.black,width: 2.0,),
                            ),

                      ),
                    ),
                    SizedBox(height: 30,),
                   Divider(color: Colors.black,),
                    SizedBox(height: 30,),
                   // Text("Edit",style: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.bold,),),
                  //  SizedBox(height: 6,),
                    //Text("msg",style: TextStyle(fontSize: 20,color: Colors.grey.shade400),),
                  ],
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      style: TextStyle(color:Colors.black),
                      decoration: InputDecoration(
                        labelText: "Full Name",
                         
                        labelStyle: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600),
                        
                          hoverColor: Colors.white,
                          fillColor: Colors.white,
                        
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                    SizedBox(height: 16,),
                    TextField(
                      style: TextStyle(color:Colors.black),
                      decoration: InputDecoration(
                      
                        labelText: "Email ID",
                        labelStyle: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                    SizedBox(height: 16,),
                    TextField(
                      obscureText: true,
                      
                      style: TextStyle(color:Colors.black),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                     SizedBox(height: 16,),
                    TextField(
                      obscureText: true,
                      
                      style: TextStyle(color:Colors.black),
                       
                      decoration: InputDecoration(
                        labelText: "Birthdate",
                      
                        hintText: "+91-1381378132",
                        labelStyle: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                     SizedBox(height: 16,),
                    TextField(
                      obscureText: true,
                      
                      style: TextStyle(color:Colors.black),
                      
                      decoration: InputDecoration(
                        labelText: "Location",
                        labelStyle: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                     SizedBox(height: 16,),
                    TextField(
                      obscureText: true,
                      
                      style: TextStyle(color:Colors.black),
                      
                      decoration: InputDecoration(
                        labelText: "Phone",
                        hintText: "+91-1381378132",
                        labelStyle: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                    SizedBox(height: 30,),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => group()));
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
                   // SizedBox(height: 16,),
                   // Container(
                  //    height: 50,
                     // width: double.infinity,
                      //child: FlatButton(
                      //  onPressed: (){},
                      //  color: Colors.indigo.shade50,
                      //  shape: RoundedRectangleBorder(
                       //   borderRadius: BorderRadius.circular(6)
                     //   ),
                        ///child: Row(
                         // mainAxisAlignment: MainAxisAlignment.center,
                        //  children: <Widget>[
                          //  Image.asset("images/facebook.png",height: 18,width: 18,),
                          //  SizedBox(width: 10,),
                          //  Text("Connect with Facebook",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo),)
                         // ],
                       // ),
                     // ),
                   // ),
                    SizedBox(height: 30,),
                  ],
                ),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/