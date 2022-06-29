//
// import 'package:http/http.dart' as http;
// import 'package:firebase_messaging/firebase_messaging.dart';
// class FCM {
//
//   static const String server_token='AAAAF9_eV84:APA91bE6YQkzMLM1lf6sfdIASl49C-GOtNFUs3XEThFPebUzrtDRICj-SWpaMkGmPXfM0T-TRkMVXxtY8d53WSi4e4hP3nDxiOon8zTuOscSrLuPPwTwQcJnk5JOZMIY8p32r8nwC7HG';
//
//   var body={
//     //'token': "token",
//     "to":"",
//     "direct_boot_ok" : true,
//     "notification":{
//     "title":"FCM Message",
//     "body":"This is an FCM notification message!",
//     },
//     'priority':'high',
//     "data": {
//     'click_action':'FLUTTER_NOTIFICATION_CLICK',
//     'id':'1',
//     'name':'aya',
//     'Typenotify':
//     },
//     'to': FirebaseMessaging.instance.getToken()
//   };
//   //BLHC6fhpHX_VBbufktusXDMRhLtLI764Ic_ZcCc9Lh2puYzPEvwOpvxDfBmHKtRQu38OU_hUoalT42PxzHc8JPg
//   // String token = await messaging.getToken(
//   // vapidKey: "BLHC6fhpHX_VBbufktusXDMRhLtLI764Ic_ZcCc9Lh2puYzPEvwOpvxDfBmHKtRQu38OU_hUoalT42PxzHc8JPg",
//   // );
//   Future<void> sendnotification(Map<String,dynamic> body) async {
//      FirebaseMessaging messaging = FirebaseMessaging.instance;
//     try{
//       String? token = await messaging.getToken(
//       vapidKey: "BLHC6fhpHX_VBbufktusXDMRhLtLI764Ic_ZcCc9Lh2puYzPEvwOpvxDfBmHKtRQu38OU_hUoalT42PxzHc8JPg",
//       );
//        //https://fcm.googleapis.com/fcm/send
//       //https://fcm.googleapis.com/v1/projects/myproject-b5ae1/messages:send
//        http.Response response = await http.post(
//         Uri.parse('https://fcm.googleapis.com/fcm/send'),
//         body: body,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "key=$server_token"//"Bearer $"
//         },
//       );
//     }
//     catch(e) {
//
//     }
//     // "data":data,
//     // "notification":{
//     // "title":"FCM Message",
//     // "body":"This is an FCM notification message!",
//     // },
//
//   }
//
//   void getmessge(){
//     FirebaseMessaging.onMessage.listen(
//             (message) {
//              print( message.notification!.title);
//             print( message.notification!.body);
//             print(  message.data['iduser']);
//             print(  message.data['nameuser']);
//             });
//     FirebaseMessaging.onMessageOpenedApp.listen(
//             (message) {
//           print( message.notification!.title);
//           print( message.notification!.body);
//           print(  message.data['iduser']);
//           print(  message.data['nameuser']);
//         });
//   }
//
// }