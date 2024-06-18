// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAYjE-k4MD8_rvUXLM5wdhQw_2qqi8UcI8',
    appId: '1:924439862667:web:e88a66dfdaecd7a82c638e',
    messagingSenderId: '924439862667',
    projectId: 'medical-app-69eac',
    authDomain: 'medical-app-69eac.firebaseapp.com',
    storageBucket: 'medical-app-69eac.appspot.com',
    measurementId: 'G-WLSBQLLHP3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBb5CsB29HrdGqkdh-U5jtMyKqQOiEEgao',
    appId: '1:924439862667:android:2a26a697543cc7ab2c638e',
    messagingSenderId: '924439862667',
    projectId: 'medical-app-69eac',
    storageBucket: 'medical-app-69eac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbkndXNgjL-_7vOadnmf04PmrxOZeceBk',
    appId: '1:924439862667:ios:a1a862b19d8021ea2c638e',
    messagingSenderId: '924439862667',
    projectId: 'medical-app-69eac',
    storageBucket: 'medical-app-69eac.appspot.com',
    iosBundleId: 'com.example.medicalApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbkndXNgjL-_7vOadnmf04PmrxOZeceBk',
    appId: '1:924439862667:ios:a1a862b19d8021ea2c638e',
    messagingSenderId: '924439862667',
    projectId: 'medical-app-69eac',
    storageBucket: 'medical-app-69eac.appspot.com',
    iosBundleId: 'com.example.medicalApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAYjE-k4MD8_rvUXLM5wdhQw_2qqi8UcI8',
    appId: '1:924439862667:web:93ff1ae3eb5f26ce2c638e',
    messagingSenderId: '924439862667',
    projectId: 'medical-app-69eac',
    authDomain: 'medical-app-69eac.firebaseapp.com',
    storageBucket: 'medical-app-69eac.appspot.com',
    measurementId: 'G-Z12SP7WF5T',
  );
}