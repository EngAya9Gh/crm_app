


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class datetime_vm extends ChangeNotifier{

  late DateTime valuedateTime= DateTime(1, 1, 1);
  TimeOfDay selectedTime = TimeOfDay(hour: -1, minute: 00);

  void setdatetimevalue(DateTime val,TimeOfDay? timeday){
    valuedateTime=val;
    selectedTime=timeday!;
    notifyListeners();
  }

}