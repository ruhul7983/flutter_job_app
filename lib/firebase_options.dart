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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDpbsZxmT_i7G9hDyAW1toHUs7RXHdWeuU',
    appId: '1:168855959811:web:325030a466000797581136',
    messagingSenderId: '168855959811',
    projectId: 'jobapp-3ce29',
    authDomain: 'jobapp-3ce29.firebaseapp.com',
    storageBucket: 'jobapp-3ce29.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxgJbZjK2Vv8JnI9Pe6nSbzbp2bwVoJAg',
    appId: '1:168855959811:android:a98507b4654507cd581136',
    messagingSenderId: '168855959811',
    projectId: 'jobapp-3ce29',
    storageBucket: 'jobapp-3ce29.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWu0zcRce47t-pYQapPb4Yab_T9Vvt0Ck',
    appId: '1:168855959811:ios:01e5d1478e625ccb581136',
    messagingSenderId: '168855959811',
    projectId: 'jobapp-3ce29',
    storageBucket: 'jobapp-3ce29.appspot.com',
    iosClientId: '168855959811-a92k128mppopbt7en86s23ddokn6n3h7.apps.googleusercontent.com',
    iosBundleId: 'com.example.jobApp',
  );
}