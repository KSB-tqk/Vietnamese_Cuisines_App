import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_test/components/user.dart';

class AuthenticationService with ChangeNotifier {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static UserFood userFood;

  AuthenticationService(_firebaseAuth);

  Stream<User> get authStateChange => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    String err = "Đăng nhập thành công!";
    UserFood userFood;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return err;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-disabled":
          err = "Email không chính xác!";
          break;
        case "invalid-email":
          err = "Email không hợp lệ!";
          break;
        case "user-not-found":
          err = "Không tìm thấy Email!";
          break;
        case "wrong-password":
          err = "Mật khẩu không đúng!";
          break;
      }
      return err;
    }
  }

  Future<String> signUp(
      {String email, String password, String username}) async {
    String err = "Đăng ký thành công!";
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => print("Lay data"));
      username = _firebaseAuth.currentUser.displayName;
      return err;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          err = "Email đã tồn tại!";
          break;
        case "invalid-email":
          err = "Email không hợp lệ!";
          break;
        case "operation-not-allowed":
          err = "Email hoặc mật khẩu không đúng!";
          break;
        case "weak-password":
          err = "Mật khẩu không đủ kí tự!";
          break;
      }
      return err;
    }
  }

  // update UserInfo in to firebase
  Future setUpUserFirestore() async {
    var snapshot = await _firestore
        .collection('Users')
        .doc(_firebaseAuth.currentUser.uid)
        .get();
    if (snapshot.exists) {
      userFood = UserFood.fromJson(snapshot.data());
    } else {
      userFood = UserFood(
          email: _firebaseAuth.currentUser.email,
          userName: _firebaseAuth.currentUser.displayName,
          idUser: _firebaseAuth.currentUser.uid);

      await _firestore
          .collection('Users')
          .doc(_firebaseAuth.currentUser.uid)
          .set(userFood.toJson());
    }
    return null;
  }
}
