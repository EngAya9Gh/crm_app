// Please see this file for the latest firebase-js-sdk version:
// https://github.com/firebase/flutterfire/blob/master/packages/firebase_core/firebase_core_web/lib/src/firebase_sdk_version.dart
importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-messaging-compat.js");

firebase.initializeApp({
  databaseURL: "...",
  apiKey: 'AIzaSyDQVScJ2gMSCwAWh1zTnjtzOk2SGWSjStI',
      appId: '1:102540138446:web:a8933eabd8a1d0cee5fd9f',
      messagingSenderId: '102540138446',
      projectId: 'crmapp-8f9de',
      authDomain: 'crmapp-8f9de.firebaseapp.com',
      storageBucket: 'crmapp-8f9de.firebasestorage.app',
      measurementId: 'G-KJC7EKRNM6',
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});