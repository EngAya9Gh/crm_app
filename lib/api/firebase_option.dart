import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDQVScJ2gMSCwAWh1zTnjtzOk2SGWSjStI',
    appId: '1:102540138446:web:a8933eabd8a1d0cee5fd9f',
    messagingSenderId: '102540138446',
    projectId: 'crmapp-8f9de',
    authDomain: 'crmapp-8f9de.firebaseapp.com',
   // databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
    storageBucket: 'crmapp-8f9de.appspot.com',
    measurementId: 'G-KJC7EKRNM6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPc1bZGUTKYilLcLMJbxd8I4RInrPo8AQ',
    appId: '1:102540138446:android:bc175820eaf396efe5fd9f',
    messagingSenderId: '102540138446',
    projectId: 'crmapp-8f9de',
    //databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
    storageBucket: 'crmapp-8f9de.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHAsf51D0A407EklG1bs-5wA7EbyfNFg0',
    appId: '1:448618578101:ios:0b11ed8263232715ac3efc',
    messagingSenderId: '448618578101',
    projectId: 'react-native-firebase-testing',
    databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
    storageBucket: 'react-native-firebase-testing.appspot.com',
    androidClientId:
    '448618578101-a9p7bj5jlakabp22fo3cbkj7nsmag24e.apps.googleusercontent.com',
    iosClientId:
    '448618578101-evbjdqq9co9v29pi8jcua8bm7kr4smuu.apps.googleusercontent.com',
    iosBundleId: 'io.flutter.plugins.firebase.messaging',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHAsf51D0A407EklG1bs-5wA7EbyfNFg0',
    appId: '1:448618578101:ios:0b11ed8263232715ac3efc',
    messagingSenderId: '448618578101',
    projectId: 'react-native-firebase-testing',
    databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
    storageBucket: 'react-native-firebase-testing.appspot.com',
    androidClientId:
    '448618578101-a9p7bj5jlakabp22fo3cbkj7nsmag24e.apps.googleusercontent.com',
    iosClientId:
    '448618578101-evbjdqq9co9v29pi8jcua8bm7kr4smuu.apps.googleusercontent.com',
    iosBundleId: 'io.flutter.plugins.firebase.messaging',
  );
}