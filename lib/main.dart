import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_quiz_app/data_uploader_screen.dart';
import 'package:mobile_quiz_app/firebase_options.dart';
import 'package:get/get.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(home:DataUploaderScreen()));
// }


 Future<void> initFireBase() async {
  await Firebase.initializeApp(
    //  name: name,
      options: DefaultFirebaseOptions.currentPlatform,
    );
}

 void main(List<String> args) async {
   WidgetsFlutterBinding.ensureInitialized();
   await initFireBase();
   runApp(GetMaterialApp(
     home: DataUploaderScreen(),
   ));
 }