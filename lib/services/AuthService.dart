


import 'dart:convert';

import 'package:crm_smart/api/api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../constants.dart';

class  AuthServices{

  Future<bool> send_otp(String email) async {
    String? result;
    try{
      result= await Api()
        .postNew( url:url_laravel+"checkEmail",body: {
          'email':email
    } );
   //
      print(result);
    return jsonDecode(result!)["message"]=="Done"? true:false;}
        catch(e){

          return false;
        }
  }
  Future<String?> verfiy_otp(String email,String otp) async {
    String? result;

    try {
      final fcm = await FirebaseMessaging.instance.getToken();

      
      // 
      result = await Api().postNew(url: url_laravel + "login", body: {
        'email': email,
        'otp': otp,
        'token': fcm,
      });
      return jsonDecode(result!)["message"]!= "code is wrong" ? result : "false";
    }
    catch(e){

    return "false";
    }
  }

}