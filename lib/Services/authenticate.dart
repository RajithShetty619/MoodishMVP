import 'dart:ffi';

import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moodish_mvp/Authenticate/signUp.dart';
import 'package:moodish_mvp/Services/database.dart';
import 'package:moodish_mvp/models/name.dart';
import 'package:moodish_mvp/models/user.dart';

class Authenticate {
  String name;
  Authenticate({this.name});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);
  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future<String> returnUid() async {
    FirebaseUser user = await _auth.currentUser();
    String _uid = user.uid;
    return _uid;
  }

  Stream<User> get onAuthChanged {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future<String> getToken() async {
    FirebaseUser user = await _auth.currentUser();
    IdTokenResult _token = await user.getIdToken();
    print(_token);
    return _token.token;
  }

  Future newRegister(String email, String name, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      await DatabaseService()
          .updateUserData(email: email, name: name, uid: user.uid);
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future googleSignIn() async {
    try {
      //clearing cache
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      print(googleAuth);
      // get the credentials to (access / id token)
      // to sign in via Firebase Authentication
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      AuthResult _user = await _auth.signInWithCredential(credential);
      await DatabaseService().updateUserData(
          email: googleUser.email,
          name: googleUser.displayName,
          uid: _user.user.uid);

      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Apple sign In yupp

  Future signInWithApple() async {
    final AuthorizationResult result = await AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    switch (result.status) {
      case AuthorizationStatus.authorized:
        final AppleIdCredential _aauth = result.credential;
        final OAuthProvider oAuthProvider =
            new OAuthProvider(providerId: "apple.com");

        final AuthCredential credential = oAuthProvider.getCredential(
          idToken: String.fromCharCodes(_aauth.identityToken),
          accessToken: String.fromCharCodes(_aauth.authorizationCode),
        );

        AuthResult fireResult = await _auth.signInWithCredential(credential);

        //Update user Information::::
        if (_aauth.fullName != null) {
          _auth.currentUser().then((value) async {
            UserUpdateInfo user = UserUpdateInfo();
            user.displayName =
                "${_aauth.fullName.givenName} ${_aauth.fullName.familyName}";
            await value.updateProfile(user);
            await DatabaseService().updateUserData(
                email: _aauth.email,
                name: _aauth.fullName.givenName + _aauth.fullName.familyName,
                uid: fireResult.user.uid);
          });
        }

        break;
      case AuthorizationStatus.error:
        print(
            "*******SignIn Failed******* \n ${result.error.localizedDescription}");
        break;
      case AuthorizationStatus.cancelled:
        print('--------User Cancelled--------');
        break;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
