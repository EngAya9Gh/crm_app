


import 'package:flutter/cupertino.dart';

class LoadProvider with ChangeNotifier {

  bool isLoadingdelete=false;
  void changebooldelete(bool val){
    isLoadingdelete=val;
    notifyListeners();
  }
  bool isLoadingViewClient=false;
  void changeboolViewClient(bool val){
    isLoadingViewClient=val;
    notifyListeners();
  }

  bool isLoadingAddinvoice=false;
  void changebooladdinvoice(bool val){
    isLoadingAddinvoice=val;
    notifyListeners();
  }

  bool isLoadingAddProd=false;
  void changeboolValueisLoading(bool val){
    isLoadingAddProd=val;
    notifyListeners();
  }
  bool isLoadingAddUser=false;
  void changeboolValueUser(bool val){
    isLoadingAddUser=val;
    notifyListeners();
  }
  bool isLoadingAddclient=false;
  void changebooladdclient(bool val){
    isLoadingAddclient=val;
    notifyListeners();
  }
  bool isLoadingUpdateUser=false;
  void changeboolUpdateUser(bool val){
    isLoadingUpdateUser=val;
    notifyListeners();
  }
  bool isLoadingupdateprod=false;
  void changeLoadingupdateprod(bool val){
    isLoadingupdateprod=val;
    notifyListeners();
  }

  bool isLoadinglevelcombox=false;
  void changeboolisLoadinglevel(bool val){
    isLoadinglevelcombox=val;
    notifyListeners();
  }
}