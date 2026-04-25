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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDg7rtjGpo4cxh_uuqsDtExw8mB5NSn8qY',
    appId: '1:995078905468:android:7a31ab7e10309632da73f9',
    messagingSenderId: '995078905468',
    projectId: 'your-54cd2',
    storageBucket: 'your-54cd2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDg7rtjGpo4cxh_uuqsDtExw8mB5NSn8qY',
    appId: '1:995078905468:ios:7a31ab7e10309632da73f9',
    messagingSenderId: '995078905468',
    projectId: 'your-54cd2',
    storageBucket: 'your-54cd2.firebasestorage.app',
    iosBundleId: 'com.example.allogroupworldcup',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDg7rtjGpo4cxh_uuqsDtExw8mB5NSn8qY',
    appId: '1:995078905468:web:7a31ab7e10309632da73f9',
    messagingSenderId: '995078905468',
    projectId: 'your-54cd2',
    authDomain: 'your-54cd2.firebaseapp.com',
    storageBucket: 'your-54cd2.firebasestorage.app',
  );
}