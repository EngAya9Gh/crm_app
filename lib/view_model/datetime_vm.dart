import 'package:flutter/material.dart';

class datetime_vm extends ChangeNotifier {
  late DateTime valuedateTime = DateTime(1, 1, 1);
  late DateTime valuedateTime2 = DateTime(1, 1, 1);
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  void setdatetimevalue(DateTime val, TimeOfDay? timeday) {
    valuedateTime = val;
    selectedStartTime = timeday!;
    notifyListeners();
  }

  void setdatetimevalueEnd(DateTime val, TimeOfDay? timeday) {
    // valuedateTime = val;
    selectedEndTime = timeday!;
    notifyListeners();
  }

  void setdatetimevalue1(DateTime val, {bool isInit = false}) {
    valuedateTime = val;
    if (isInit) notifyListeners();
  }

  void setdatetimevalue2(DateTime val) {
    valuedateTime2 = val;
    // selectedTime=timeday!;
    notifyListeners();
  }
}
