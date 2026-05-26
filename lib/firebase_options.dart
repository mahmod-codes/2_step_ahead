import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
        return linux;
      case TargetPlatform.fuchsia:
        throw UnsupportedError('Firebase is not configured for Fuchsia.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'replace-with-firebase-api-key',
    appId: 'replace-with-firebase-app-id',
    messagingSenderId: 'replace-with-sender-id',
    projectId: 'replace-with-project-id',
    authDomain: 'replace-with-project-id.firebaseapp.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'replace-with-firebase-api-key',
    appId: '1:000000000000:android:0000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'replace-with-project-id',
    storageBucket: 'replace-with-project-id.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'replace-with-firebase-api-key',
    appId: '1:000000000000:ios:0000000000000000000000',
    messagingSenderId: '000000000000',
    projectId: 'replace-with-project-id',
    iosBundleId: 'com.example.flutterApplication1',
    storageBucket: 'replace-with-project-id.appspot.com',
  );

  static const FirebaseOptions macos = ios;
  static const FirebaseOptions windows = web;
  static const FirebaseOptions linux = web;
}
