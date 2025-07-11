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
    apiKey: 'AIzaSyAkNkfvRX_0GTsIa8phgiv2BcOBrq-Omzg',
    appId: '1:1038223354159:web:60f486a76ea74bbe1e59da',
    messagingSenderId: '1038223354159',
    projectId: 'evently-a23b0',
    authDomain: 'evently-a23b0.firebaseapp.com',
    storageBucket: 'evently-a23b0.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbztjAtiW1hrgLa5L07YD6-ZFV9908HSU',
    appId: '1:1038223354159:android:1b89ba1cdc13ad8b1e59da',
    messagingSenderId: '1038223354159',
    projectId: 'evently-a23b0',
    storageBucket: 'evently-a23b0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCivkRmVWDwNstbQSMRJ6HysJXU_18ub6s',
    appId: '1:1038223354159:ios:abdffcdd305612381e59da',
    messagingSenderId: '1038223354159',
    projectId: 'evently-a23b0',
    storageBucket: 'evently-a23b0.firebasestorage.app',
    iosBundleId: 'com.example.evently',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCivkRmVWDwNstbQSMRJ6HysJXU_18ub6s',
    appId: '1:1038223354159:ios:abdffcdd305612381e59da',
    messagingSenderId: '1038223354159',
    projectId: 'evently-a23b0',
    storageBucket: 'evently-a23b0.firebasestorage.app',
    iosBundleId: 'com.example.evently',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAkNkfvRX_0GTsIa8phgiv2BcOBrq-Omzg',
    appId: '1:1038223354159:web:5bdef14d4684cabe1e59da',
    messagingSenderId: '1038223354159',
    projectId: 'evently-a23b0',
    authDomain: 'evently-a23b0.firebaseapp.com',
    storageBucket: 'evently-a23b0.firebasestorage.app',
  );
}
