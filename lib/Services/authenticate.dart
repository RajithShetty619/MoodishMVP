import 'package:firebase_auth/firebase_auth.dart';

class Authenticate{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future newRegister( String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signIn( String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;

    }catch(e){
      print(e.toString());
      return null;
    }
  }



}
