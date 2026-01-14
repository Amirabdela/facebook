// Generated manually based on user provided info.
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    throw UnimplementedError('Platform not configured (Android/iOS not set up in this manual file yet).');
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA_qUBkOqv3-L0_GpuOwbIvX0j-oF9J_Vs',
    appId: '1:1234567890:web:321abc456def7890',
    messagingSenderId: '750525689015',
    projectId: 'facebook-4adbb',
    authDomain: 'facebook-4adbb.firebaseapp.com',
    storageBucket: 'facebook-4adbb.firebasestorage.app',
  );
}
