import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/di/di_container.dart';

class sherdpref extends ChangeNotifier {
  late SharedPreferences preferences;
  SharedPreferences getsherdprefuser() {
    preferences = getIt<SharedPreferences>();
    return preferences;
  }

  UserModel? usercurrent;

  void setvalue(user) {
    usercurrent = user;
    notifyListeners();
  }
}
