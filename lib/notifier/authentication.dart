import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_test/components/favorite.dart';
import 'package:flutter_app_test/components/food.dart';
import 'package:flutter_app_test/components/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AuthenticationService with ChangeNotifier {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserFood userFood;
  FavoriteFood favoriteFood;
  AuthenticationService(_firebaseAuth);

  Stream<User> get authStateChange => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    String err = "Đăng nhập không thành công!";
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Đăng nhập thành công!";
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

  Future<String> signUp({String email, String password}) async {
    String err = "Đăng ký không thành công!";
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => print("Lay data"));
      return "Đăng ký thành công!";
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
          userName: _firebaseAuth.currentUser.email
              .substring(0, _firebaseAuth.currentUser.email.indexOf('@')),
          idUser: _firebaseAuth.currentUser.uid);

      await _firestore
          .collection('Users')
          .doc(_firebaseAuth.currentUser.uid)
          .set(userFood.toJson());
    }

    await setFavoriteFoodUser();

    return null;
  }

  // Setup món danh sách món ăn yêu thích của từng User
  Future setFavoriteFoodUser() async {
    var snapshot =
        await _firestore.collection('Favorite').doc(userFood.idUser).get();
    if (snapshot.exists) {
      favoriteFood = FavoriteFood.fromJson(snapshot.data());
    } else {
      favoriteFood = FavoriteFood(idUser: userFood.idUser, listIdFood: []);
      await _firestore
          .collection('Favorite')
          .doc(userFood.idUser)
          .set(favoriteFood.toJson());
    }
  }

  // Cập nhật danh sách food yêu thích
  Future updateFavoriteFood() async {
    notifyListeners();
    await _firestore
        .collection('Favorite')
        .doc(_firebaseAuth.currentUser.uid)
        .set(favoriteFood.toJson());
  }

  Future<List<Food>> getListFoodFavorite() async {
    var snapshot = await FirebaseFirestore.instance
        .collection('Food')
        .doc('Foods')
        .collection('FoodInfo')
        .where("idFood", whereIn: favoriteFood.listIdFood)
        .get();

    List<Food> foodFavorite = [];
    snapshot.docs.forEach((element) {
      foodFavorite.add(Food.fromJson(element.data()));
    });
    return foodFavorite;
  }

  // update username
  Future updateUser() async {
    await _firestore
        .collection('Users')
        .doc(_firebaseAuth.currentUser.uid)
        .set(userFood.toJson());
    notifyListeners();
  }

  Future changePassWord(String newPassWord) async {
    await _firebaseAuth.currentUser.updatePassword(newPassWord);
    notifyListeners();
  }

  // kiểm tra mật khẩu hiện tại của user
  Future<bool> validateCurrentPassword(String passWord) async {
    var authCredentials = EmailAuthProvider.credential(
        email: _firebaseAuth.currentUser.email, password: passWord);
    try {
      var authResult = await _firebaseAuth.currentUser
          .reauthenticateWithCredential(authCredentials);
      return authResult.user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future sendResetPassWord(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
