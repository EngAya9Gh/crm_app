



import 'package:flutter/cupertino.dart';

class selected_button_provider extends ChangeNotifier{

  int isSelected= 0;
  void selectValue(val){
    isSelected=val;
    notifyListeners();
  }
  int isSelectedtypepay= 0;
  void selectValuetypepay(val){
    print('in provider typepay');
    print(int.parse('1'));
    isSelectedtypepay=val;
    notifyListeners();
  }
  int isSelectedtypeinstall= 0;
  void selectValuetypeinstall(val){
    isSelectedtypeinstall=val;
    notifyListeners();
  }

  int isbarsales= 0;
  void selectValuebarsales(val){
    isbarsales=val;
    notifyListeners();
  }
  int isbarsalestype= 0;
  void selectValuebarsalestype(val){
    isbarsalestype=val;
    notifyListeners();
  }

}