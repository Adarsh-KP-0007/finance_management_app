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
    apiKey: 'AIzaSyBEbUbRBJ-Pjs_6iwC5ryg2t0hnVuKKwyI',
    appId: '1:789896676126:web:5b7dc805045cd8b0fe7f0f',
    messagingSenderId: '789896676126',
    projectId: 'finance-management-app-5f7ae',
    authDomain: 'finance-management-app-5f7ae.firebaseapp.com',
    databaseURL:
        'https://finance-management-app-5f7ae-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'finance-management-app-5f7ae.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQvIzP39SG0QIQ_BAufsk143miMvi2nQY',
    appId: '1:789896676126:android:9266582afa146376fe7f0f',
    messagingSenderId: '789896676126',
    projectId: 'finance-management-app-5f7ae',
    databaseURL:
        'https://finance-management-app-5f7ae-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'finance-management-app-5f7ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB32drNj1c-VERKYz_jnn1Ob6A2uZrW4DM',
    appId: '1:789896676126:ios:c93110d12373e0bcfe7f0f',
    messagingSenderId: '789896676126',
    projectId: 'finance-management-app-5f7ae',
    databaseURL:
        'https://finance-management-app-5f7ae-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'finance-management-app-5f7ae.appspot.com',
    iosBundleId: 'com.codeforany.trackizer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB32drNj1c-VERKYz_jnn1Ob6A2uZrW4DM',
    appId: '1:789896676126:ios:8e5fa62206092ce1fe7f0f',
    messagingSenderId: '789896676126',
    projectId: 'finance-management-app-5f7ae',
    databaseURL:
        'https://finance-management-app-5f7ae-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'finance-management-app-5f7ae.appspot.com',
    iosBundleId: 'com.codeforany.financeManagementApp.RunnerTests',
  );
}
