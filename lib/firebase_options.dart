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
    apiKey: 'AIzaSyB3WvHAIKQgcl0P5N2cZ1zq0heLzix8ovY',
    appId: '1:414000535462:web:3409e7048e8499f38d6167',
    messagingSenderId: '414000535462',
    projectId: 'librolandia-11103',
    authDomain: 'librolandia-11103.firebaseapp.com',
    storageBucket: 'librolandia-11103.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjNauePb7YVEYt_JVJoX08AQYOI0c7zY4',
    appId: '1:414000535462:android:e978f12d0e0d081b8d6167',
    messagingSenderId: '414000535462',
    projectId: 'librolandia-11103',
    storageBucket: 'librolandia-11103.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcLq47eJvmnjxuRht4P9girv2VB9am5-Y',
    appId: '1:414000535462:ios:14de9772a89e52668d6167',
    messagingSenderId: '414000535462',
    projectId: 'librolandia-11103',
    storageBucket: 'librolandia-11103.appspot.com',
    iosClientId: '414000535462-2it4faa6pjdrv52jgul4knpaulgd5qae.apps.googleusercontent.com',
    iosBundleId: 'com.example.appDeLibros',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcLq47eJvmnjxuRht4P9girv2VB9am5-Y',
    appId: '1:414000535462:ios:14de9772a89e52668d6167',
    messagingSenderId: '414000535462',
    projectId: 'librolandia-11103',
    storageBucket: 'librolandia-11103.appspot.com',
    iosClientId: '414000535462-2it4faa6pjdrv52jgul4knpaulgd5qae.apps.googleusercontent.com',
    iosBundleId: 'com.example.appDeLibros',
  );
}
