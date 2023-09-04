import 'package:flutter/cupertino.dart';

class selected_button_provider extends ChangeNotifier {
  int isSelected = 0;

  void selectValue(val) {
    isSelected = val;
    notifyListeners();
  }

  int isSelectedtypepay = 1;

  void selectValuetypepay(val) {
    print('in provider typepay');
    print(int.parse('1'));
    isSelectedtypepay = val;
    notifyListeners();
  }

  int isSelectedtypeinstall = 1;

  void selectValuetypeinstall(val) {
    isSelectedtypeinstall = val;
    notifyListeners();
  }

  int isSelectedreadyinstall = 1;

  void selectValuereadyinstall(val, {bool isInit = false}) {
    isSelectedreadyinstall = val;
    if (!isInit) {
      notifyListeners();
    }
  }

  int isSelectCurrency = 1;

  void selectValueCurrency(val) {
    isSelectCurrency = val;
    notifyListeners();
  }

  int isbarsales = 0;

  void selectValuebarsales(val, {bool isInit = false}) {
    isbarsales = val;
    if (!isInit) notifyListeners();
  }

  int isbarsalestype = 0;

  void selectValuebarsalestype(val) {
    isbarsalestype = val;
    notifyListeners();
  }
}
