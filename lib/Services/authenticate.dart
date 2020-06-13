import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:google_sign_in/google_sign_in.dart'; 
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/models/name.dart';
import 'package:moodish_mvp/models/user.dart';

class Authenticate{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email','https://www.googleapis.com/auth/contacts.readonly',]);
  User _userFromFirebase(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get onAuthChanged{
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future newRegister( String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUserData(Name().name);
      return _userFromFirebase(user);

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

  Future googleSignIn() async {
    try{
      //clearing cache 
      if(await _googleSignIn.isSignedIn())
      {
        await _googleSignIn.signOut();
      }
      final GoogleSignInAccount googleUser = 
         await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = 
         await googleUser.authentication;
      print(googleAuth);
      // get the credentials to (access / id token)
      // to sign in via Firebase Authentication 
      final AuthCredential credential =
         GoogleAuthProvider.getCredential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken
         );
      await _auth.signInWithCredential(credential);

      return true;
      
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try{
      await _auth.signOut();
    }
    catch(e){
      print(e.toString());
    }
  } 
}
