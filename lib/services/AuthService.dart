


import 'package:crm_smart/api/api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../constants.dart';

class  AuthServices{

  Future<bool> send_otp(String email) async {
    String? result;
    try{
      result= await Api()
        .post( url:url+"Auth/send_otp.php",body: {
          'email':email
    } );
   // 
    return result=="done"? true:false;}
        catch(e){

          return false;
        }
  }
  Future<String?> verfiy_otp(String email,String otp) async {
    String? result;

    try {
      final fcm = await FirebaseMessaging.instance.getToken();

      
      // 
      result = await Api().post(url: url + "Auth/check_otp.php", body: {
        'email': email,
        'otp': otp,
        'token': fcm,
      });
      return result != "code is wrong" ? result : "false";
    }
    catch(e){

    return "false";
    }
  }

}