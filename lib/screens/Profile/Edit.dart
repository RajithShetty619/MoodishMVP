import 'package:flutter/material.dart';
import 'package:moodish_mvp/Authenticate/forgotPassword.dart';
import 'package:moodish_mvp/Services/database.dart'; 
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:image_picker/image_picker.dart'; 
import 'package:geolocator/geolocator.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
class EditProfile extends StatefulWidget {
  final ImageProvider image;
  final Map<String,String> user;
  EditProfile({this.image,this.user});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Map<String,String>_user;
  ImageProvider _image;
  final userData1 = DatabaseService();
  Position _currentPosition;
  String _currentAddress ='Mumbai,Maharashtra';
  Geolocator geolocator = Geolocator();
  ImageProvider image;
  getImage() async {
    final fileImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    ImageProvider image = FileImage(fileImage);

    // final Directory _dir = await getApplicationDocumentsDirectory();
    // final String _path = _dir.path;
    setState(() { 
      _image = image;
    });
    DatabaseService().uploadPhoto(fileImage);
  }
  @override
  void initState() {
    super.initState();
    info()async{
      try{
        setState(() {

        });
      }catch(e){
        print(e);
      }
    }

    data() async {
      try {
        setState(() {
          _image = widget.image;
        });
        setState(() {
          _user=widget.user;
        });
      } catch (e) {
        print(e);
      }
    }

    data();
  }
  getCurrentLocation()async{
    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((Position position) {_currentPosition=position;});
    print(position);
  }
  _getAddressFromLatLng() async {
    try {
      setState(() {
        _currentAddress='Wait a Moment...';
      });
      List<Placemark> p = await geolocator.placemarkFromCoordinates(_currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = "${place.subLocality},${place.locality}-${place.postalCode}";
      });
      print(_currentAddress);
      userData1.editUserData(field: 'location', value: _currentAddress);
    } catch (e) {
      print(e);
    }
  }

  // File _storedImage;
  // Future<void> _takePicture() async {
  //   final imageFile = await ImagePicker.pickImage(
  //     source: ImageSource.gallery,
  //   );
  //   if (imageFile == null) {
  //     return;
  //   }
  //   setState(() {
  //     _storedImage = imageFile;
  //   });
  //   final appDir = await getApplicationDocumentsDirectory();
  //   final fileName = Directory(imageFile.path);

  //   final savedImage = await imageFile.copy('${appDir}/$fileName');
  // }

  @override
  Widget build(BuildContext context) {
    String phone='Contact';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        getImage();
                      },
                      borderRadius: BorderRadius.circular(150),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: _image == null
                                    ? AssetImage('assets/anonuser.png')
                                    : _image)),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  thickness: 2.0,
                ),
              ),
              getListTile('Username', _user['name'], context, 3),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  thickness: 2.0,
                ),
              ),
              getListTile('Email', _user['email'], context, 4),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  thickness: 2.0,
                ),
              ),
              getListTile('Password', '********', context, 1),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  thickness: 2.0,
                ),
              ),
              getListTile('Birthdate', _user['Birthdate']??'Enter your Birthdate!', context, 2),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  thickness: 2.0,
                ),
              ),
              getListTile('Phone number', _user['PhoneNo.']??'Enter your Phone no.!', context, 5),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  thickness: 2.0,
                ),
              ),
            InkWell(
              onTap: () {
                getCurrentLocation();
                _getAddressFromLatLng();
                print(_currentAddress);
                },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Location:',
                      style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      _user['location']??_currentAddress,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  thickness: 2.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
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
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 100.0, left: 100.0),
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget getListTile(
    String category, String name, BuildContext context, int tile) {
  String username;
  String phoneNo;
  String birth;
  final userData = DatabaseService();
  birthDate()async{
      var datePicked = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: DateTime(1994),
      firstDate: DateTime(1960),
      lastDate: DateTime(2012),
      dateFormat: "dd-MMMM-yyyy",
      locale: DateTimePickerLocale.en_us,
      looping: true,
    );

      birth= '${datePicked.day.toString()}/${datePicked.month.toString()}/${datePicked.year.toString()}';
      userData.editUserData(field: 'Birthdate',value: birth);
  }

  return InkWell(
    onTap: () {
      if (tile == 1)
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ForgotPassword();
        }));
      if (tile == 2)
        {
          birthDate();
        }
//        {Alert(
//            context: context,
//            title: category,
//            content: TextField(
//              keyboardType: TextInputType.datetime,
//              onChanged: (val){
////                birthDate = val;
////                userData.editUserData(field: 'Birthdate',value: birthDate);
//              },
//              decoration: InputDecoration(
//                icon: Icon(Icons.edit),
//                labelText: 'Edit',
//                hintText: name,
//              ),
//            ),
//            buttons: [
//              DialogButton(
//                onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
//                child: Text(
//                  "Save",
//                  style: TextStyle(color: Colors.white, fontSize: 20),
//                ),
//              )
//            ]).show();}
      if(tile==3) {
        Alert(
            context: context,
            title: category,
            content: TextField(
              onChanged: (val) {
                username = val;
                userData.editUserData(field: 'name', value: username);
              },
              decoration: InputDecoration(
                icon: Icon(Icons.edit),
                labelText: 'Edit',
                hintText: name,
              ),
            ),
            buttons: [
              DialogButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]).show();
      }

      if (tile == 4) return null;
      if(tile==5)
        {
          Alert(
              context: context,
              title: category,
              content: TextField(
                keyboardType: TextInputType.number,
                onChanged: (val){
                  phoneNo = val;
                  userData.editUserData(field: 'Phoneno.',value: phoneNo);

                },
                decoration: InputDecoration(
                  icon: Icon(Icons.edit),
                  labelText: 'Edit',
                  hintText: name,
                ),
              ),
              buttons: [
                DialogButton(
                  onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show();
        }
    },
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            '$category :',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20.0),
          ),
        )
      ],
    ),
  );
}

//_onAlertWithCustomContentPressed(String category, String name, context, int tile) {
//  String username;
//  String phoneNo;
//  final userData = DatabaseService();
//  Alert(
//      context: context,
//      title: category,
//      content: TextField(
//        onChanged: (val){
//          if(tile==3){
//            username = val;
//            userData.editUserData(field: 'Username',value: username);
//          }
//          if(tile==5)
//            {
//              phoneNo = val;
//              userData.editUserData(field: 'PhoneNo.',value: phoneNo);
//            }
//
//        },
//        decoration: InputDecoration(
//          icon: Icon(Icons.edit),
//          labelText: 'Edit',
//          hintText: name,
//        ),
//      ),
//      buttons: [
//        DialogButton(
//          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
//          child: Text(
//            "Save",
//            style: TextStyle(color: Colors.white, fontSize: 20),
//          ),
//        )
//      ]).show();
//}

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
