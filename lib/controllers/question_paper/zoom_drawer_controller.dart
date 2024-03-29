import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:mobile_quiz_app/controllers/question_paper/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthConatroller>().getUser();
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthConatroller>().signOut();
    print("logged out 1");
  }

  void signIn() {}

  void recentScores() {
    _launch("/");
  }

  void website() {
    _launch("https://www.linkedin.com/in/supun-jayaweera/");
  }

  void facebook() {
    _launch("https://www.linkedin.com/in/supun-jayaweera/");
  }

  void carouselWebOne() {
    _launch("https://www.google.com/");
  }

  void carouselWebTwo() {
    _launch("https://www.youtube.com/");
  }

  void carouselWebThree() {
    _launch("http://lms.eng.ruh.ac.lk/my/");
  }

  void email() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'jayaweeraspn@gmail.com',
    );
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) throw 'could not launch $url';
  }
}
