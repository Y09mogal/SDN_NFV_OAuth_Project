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
    apiKey: 'AIzaSyDT_Pw9V9c_AtMUKM1m3PVF1zrUhWg1HGk',
    appId: '1:39926660401:web:25e71131de35c792678410',
    messagingSenderId: '39926660401',
    projectId: 'sdnoauth',
    authDomain: 'sdnoauth.firebaseapp.com',
    storageBucket: 'sdnoauth.appspot.com',
    measurementId: 'G-D99FQQ2VJ5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGy6HGzfgnlb6semnlNWGthfICtsITyd0',
    appId: '1:39926660401:android:b4d3eac026c1ef0c678410',
    messagingSenderId: '39926660401',
    projectId: 'sdnoauth',
    storageBucket: 'sdnoauth.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2tqjoV1dXs1rjc-dmlnzwqJd6E_BqFvE',
    appId: '1:39926660401:ios:aacab6eae2c00b25678410',
    messagingSenderId: '39926660401',
    projectId: 'sdnoauth',
    storageBucket: 'sdnoauth.appspot.com',
    iosBundleId: 'com.example.ydmSdnProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2tqjoV1dXs1rjc-dmlnzwqJd6E_BqFvE',
    appId: '1:39926660401:ios:01cf3b6d763c3f83678410',
    messagingSenderId: '39926660401',
    projectId: 'sdnoauth',
    storageBucket: 'sdnoauth.appspot.com',
    iosBundleId: 'com.example.ydmSdnProject.RunnerTests',
  );
}
