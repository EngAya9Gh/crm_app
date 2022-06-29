import 'package:crm_smart/ui/screen/client/clients.dart';
import 'package:crm_smart/ui/screen/invoice/invoces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class  navigatorProvider with ChangeNotifier  {

int currentIndex=0;
get()=>currentIndex;
void setCurrentIndex(value){
  currentIndex=value;
  notifyListeners();
}
List<Widget> pages = <Widget>[
  //client_dashboard(),
  Icon(
    Icons.note,
    size: 150,
  ),
  //invoices(),
  Icon(
    Icons.chat,
    size: 150,
  ),
];
}