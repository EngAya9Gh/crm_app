import 'package:flutter/material.dart';

class navigatorProvider with ChangeNotifier {
  int currentIndex = 0;
  get() => currentIndex;
  void setCurrentIndex(value) {
    currentIndex = value;
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
