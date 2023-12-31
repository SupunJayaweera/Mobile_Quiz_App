// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCxMcSi7G-dsNUF6UpsK7BhZ3Z4W1vg_7M',
    appId: '1:590573096795:web:8d3a3058e92fc95ee6147e',
    messagingSenderId: '590573096795',
    projectId: 'mobile-quiz-app-ced46',
    authDomain: 'mobile-quiz-app-ced46.firebaseapp.com',
    storageBucket: 'mobile-quiz-app-ced46.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhsZlixF9uiLU6Xy9JQgfFZv7yT0GNbjI',
    appId: '1:590573096795:android:1bb23a25e7e2311fe6147e',
    messagingSenderId: '590573096795',
    projectId: 'mobile-quiz-app-ced46',
    storageBucket: 'mobile-quiz-app-ced46.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9tvLdFjoVSkSa_YXwjoUdlmnc82fjnho',
    appId: '1:590573096795:ios:f51047bd32b53d93e6147e',
    messagingSenderId: '590573096795',
    projectId: 'mobile-quiz-app-ced46',
    storageBucket: 'mobile-quiz-app-ced46.appspot.com',
    iosBundleId: 'com.example.mobileQuizApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9tvLdFjoVSkSa_YXwjoUdlmnc82fjnho',
    appId: '1:590573096795:ios:f6a545ffc197aefde6147e',
    messagingSenderId: '590573096795',
    projectId: 'mobile-quiz-app-ced46',
    storageBucket: 'mobile-quiz-app-ced46.appspot.com',
    iosBundleId: 'com.example.mobileQuizApp.RunnerTests',
  );
}
