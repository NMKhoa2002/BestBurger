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
    apiKey: 'AIzaSyAZf2lYMfSVFcQf2o4sVrqcAy00Qe3U-M8',
    appId: '1:862424184901:web:82856fed089316eccbcb2c',
    messagingSenderId: '862424184901',
    projectId: 'best-burger-d7980',
    authDomain: 'best-burger-d7980.firebaseapp.com',
    storageBucket: 'best-burger-d7980.appspot.com',
    measurementId: 'G-FPJYY9R9M3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZNf4eWfX3xVnWsSeGuTDKtgWz-py4XnQ',
    appId: '1:862424184901:android:4ab488aebe9d1346cbcb2c',
    messagingSenderId: '862424184901',
    projectId: 'best-burger-d7980',
    storageBucket: 'best-burger-d7980.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDlRK1OfuC5H1nghxyneZ09tJEWNY3olgA',
    appId: '1:862424184901:ios:262100f68360db03cbcb2c',
    messagingSenderId: '862424184901',
    projectId: 'best-burger-d7980',
    storageBucket: 'best-burger-d7980.appspot.com',
    iosBundleId: 'com.example.bestBurger',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDlRK1OfuC5H1nghxyneZ09tJEWNY3olgA',
    appId: '1:862424184901:ios:332f38936494be14cbcb2c',
    messagingSenderId: '862424184901',
    projectId: 'best-burger-d7980',
    storageBucket: 'best-burger-d7980.appspot.com',
    iosBundleId: 'com.example.bestBurger.RunnerTests',
  );
}
