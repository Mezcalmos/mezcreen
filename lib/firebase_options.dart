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
    apiKey: 'AIzaSyD1YYiQAYL_qVlOAr__AoswtWWJd9CuHYg',
    appId: '1:826817699178:web:dff2529edbe464d0e6d913',
    messagingSenderId: '826817699178',
    projectId: 'mezcreen',
    authDomain: 'mezcreen.firebaseapp.com',
    storageBucket: 'mezcreen.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDY1BzeA2v5-S-cvXFl_quVa7WTxzsUvuI',
    appId: '1:826817699178:android:03a5c2a500b1770ee6d913',
    messagingSenderId: '826817699178',
    projectId: 'mezcreen',
    storageBucket: 'mezcreen.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgIiyeh4p1_l9kXVLVePYN9GWiYTksmYw',
    appId: '1:826817699178:ios:01e7e8263ba9e64be6d913',
    messagingSenderId: '826817699178',
    projectId: 'mezcreen',
    storageBucket: 'mezcreen.appspot.com',
    iosClientId: '826817699178-lvnvgl66v70acsa7p0i6dc80ik6hpjm7.apps.googleusercontent.com',
    iosBundleId: 'com.example.mezcreen',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgIiyeh4p1_l9kXVLVePYN9GWiYTksmYw',
    appId: '1:826817699178:ios:01e7e8263ba9e64be6d913',
    messagingSenderId: '826817699178',
    projectId: 'mezcreen',
    storageBucket: 'mezcreen.appspot.com',
    iosClientId: '826817699178-lvnvgl66v70acsa7p0i6dc80ik6hpjm7.apps.googleusercontent.com',
    iosBundleId: 'com.example.mezcreen',
  );
}
