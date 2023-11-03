import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_quiz_app/controllers/question_paper/app_logger.dart';
import 'package:mobile_quiz_app/firebase_ref/references.dart';
import 'package:mobile_quiz_app/screens/home/home_screen.dart';
import 'package:mobile_quiz_app/screens/login/login_screen.dart';
import 'package:mobile_quiz_app/widgets/dialogs/dialogue_widget.dart';

class AuthConatroller extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;

  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });

    navigateToIntroduction();
  }

  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);
        await _auth.signInWithCredential(_credential);
        await saveUser(account);
        navigateToHomePage();
      }
    } on Exception catch (error) {
      AppLogger.e(error);
    }
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl
    });
    print("save user ok");
  }

  Future<void> signOut() async {
    AppLogger.d('Sign out');
    try {
      await _auth.signOut();
      navigateToHomePage();
      print("log out 2");
    } on FirebaseAuthException catch (e) {
      AppLogger.e(e);
    }
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  void showLoginAlertDialogue() {
    Get.dialog(Dialogs.questionStartDialogue(onTap: () {
      Get.back();
      naviagateToLoginPage();
      //navigate to login page
    }), barrierDismissible: false);
  }

  void navigateToHomePage() {
    Get.offAllNamed(HomeScreen.routeName);
  }

  void naviagateToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
