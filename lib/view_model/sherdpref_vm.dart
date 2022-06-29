import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sherdpref extends ChangeNotifier{

  late SharedPreferences preferences;
  Future<SharedPreferences> getsherdprefuser() async {
    preferences= await SharedPreferences.getInstance();
    return preferences;
  }
  UserModel? usercurrent;

  void setvalue(user){
    print('in set usercurrent in product vm');
    usercurrent=user;
    notifyListeners();
  }


}