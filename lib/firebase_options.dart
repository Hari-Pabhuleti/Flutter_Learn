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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDMqwF2uJ3vg8jya_LzKlGpNekGdTcG79s',
    appId: '1:636399033551:web:5b18eb091150f8d674ebba',
    messagingSenderId: '636399033551',
    projectId: 'flutter-e-commerce-d4e98',
    authDomain: 'flutter-e-commerce-d4e98.firebaseapp.com',
    storageBucket: 'flutter-e-commerce-d4e98.appspot.com',
    measurementId: 'G-97JZB2THH1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCigTg17phbsIeC9tOGdQ904CccWqSUZtw',
    appId: '1:636399033551:android:75eb6eeda386c47b74ebba',
    messagingSenderId: '636399033551',
    projectId: 'flutter-e-commerce-d4e98',
    storageBucket: 'flutter-e-commerce-d4e98.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAE_WM9g89vkjEZNjTl9_3Ns74H3mC7t90',
    appId: '1:636399033551:ios:030bf7f8975bf1bf74ebba',
    messagingSenderId: '636399033551',
    projectId: 'flutter-e-commerce-d4e98',
    storageBucket: 'flutter-e-commerce-d4e98.appspot.com',
    androidClientId: '636399033551-f6auq2d5f2ko8iopembrledtfm3g68fv.apps.googleusercontent.com',
    iosClientId: '636399033551-5si0rlfcc1d7epdua6i4fnoe42ggbfs2.apps.googleusercontent.com',
    iosBundleId: 'com.example.fullstack',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDMqwF2uJ3vg8jya_LzKlGpNekGdTcG79s',
    appId: '1:636399033551:web:c827721e4d1cd18974ebba',
    messagingSenderId: '636399033551',
    projectId: 'flutter-e-commerce-d4e98',
    authDomain: 'flutter-e-commerce-d4e98.firebaseapp.com',
    storageBucket: 'flutter-e-commerce-d4e98.appspot.com',
    measurementId: 'G-Y7YDDZJE7X',
  );
}