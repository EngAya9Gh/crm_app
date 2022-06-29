


import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {

  bool sendcode=true;

  void changeboolValue(){
    sendcode=!sendcode;
    notifyListeners();
  }

  bool isLoading=false;
  void changeboolValueisLoading(bool val){
    isLoading=val;
    notifyListeners();
  }
}