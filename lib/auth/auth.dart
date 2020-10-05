// Authentication 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myshop/auth/databse.dart';
//import 'package:myshop/auth/sign_in.dart';
//import 'package:myshop/model/brew.dart';
import 'package:myshop/model/user.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserId _userFromFirebase(User user) {
    return user != null ? UserId(uid: user.uid) : null;
  }

  //auth stream change

  Stream<UserId> get user {
    return _auth.authStateChanges().map((_userFromFirebase));
  }

  //sign in ano
  Future SignInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// register with email
  registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DataBaseService(uid: user.uid).updateUserData("0", 100, "new user");
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password
  signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  signInWithPhone(AuthCredential credential) async {
    try {
      UserCredential result = await _auth.signInWithCredential(credential);
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
