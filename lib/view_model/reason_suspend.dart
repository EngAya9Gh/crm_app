
import 'package:flutter/cupertino.dart';

class reason_suspend extends ChangeNotifier {

  List<String> list_reason_suspend = [
    'لم يتم افتتاح المنشئة',
    'العميل طالب التأجيل',
    'تم تأجيل بقية جلسات التدريب من قبل العميل',
    'عدم توفر الأجهزة',
    'عدم رد العميل',
    // 'تأجيل بحسب افادة المبيعات',

  ];
  List<String> list_reason_sales = [

    'تأجيل بحسب افادة المبيعات',
    'تأجيل بحسب افادة العميل',

  ];

  late String? selectedValuemanag = null;

  void changevalue(String? s) {
    print(s.toString());
    selectedValuemanag = s;
    notifyListeners();
  }
  void changevalue_sales(String? s) {
    print(s.toString());
    selectedValue_sales = s;
    notifyListeners();
  }

  late String? selectedValue_sales = null;

}