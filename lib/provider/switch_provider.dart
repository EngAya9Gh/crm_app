

import 'package:flutter/cupertino.dart';

class switch_provider extends ChangeNotifier{

  bool isSwitched = false;

  void changeboolValue(bool val){
    isSwitched=val;
    notifyListeners();
  }

}