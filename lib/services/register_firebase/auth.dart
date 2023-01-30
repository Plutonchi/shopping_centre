import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shopping_centre/presentation/page/home_page.dart';
import 'package:shopping_centre/presentation/page/registration/signin_page.dart';

import '../../presentation/model/user_model.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final Future<FirebaseApp> initialization = Firebase.initializeApp();
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseMessaging fcm = FirebaseMessaging.instance;
Logger logger = Logger();

class UserController extends GetxController {
  static UserController instance = Get.find();
  Rx<User?>? firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String? userCollection = 'users';
  Rx<UserModel> userModel = UserModel().obs;
  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser!);
    firebaseUser!.bindStream(auth.userChanges());
    ever(firebaseUser!, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(
        () =>  SignIn(),
      );
    } else {
      userModel.bindStream(listenToUser());
      Get.offAll(
        () => const HomePage(),
      );
    }
  }

  showLoading() {
    Get.defaultDialog(
        title: "Loading...",
        content: const CircularProgressIndicator(),
        barrierDismissible: false);
  }

  dismissLoadingWidget() {
    Get.back();
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  void signIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then(
            (value) => _clearControllers(),
          );
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signUp() async {
    try {
      showLoading();
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then(
            (value) => _clearControllers(),
          );
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signOut() async {
    auth.signOut();
  }

  _addUserToFirebase(String userId) {
    firebaseFirestore.collection(userCollection!).doc(userId).set({
      "name": name.text.trim(),
      "id": userId,
      "email": email.text.trim(),
      "cart": [],
    });
  }

  _updateUserData(Map<String, dynamic> data) {
    logger.i("UPDATED");
    firebaseFirestore
        .collection(userCollection!)
        .doc(firebaseUser!.value!.uid)
        .update(data);
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(userCollection!)
      .doc(firebaseUser!.value!.uid)
      .snapshots()
      .map(
        (snapshot) => UserModel.fromSnapshot(snapshot),
      );
}
