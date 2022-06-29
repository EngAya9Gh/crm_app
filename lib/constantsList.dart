import 'package:crm_smart/ui/screen/home/pageshome/Emarketing.dart';
import 'package:crm_smart/ui/screen/home/pageshome/care.dart';
import 'package:crm_smart/ui/screen/home/pageshome/finance.dart';
import 'package:crm_smart/ui/screen/home/pageshome/managment.dart';
import 'package:crm_smart/ui/screen/home/pageshome/sales.dart';
import 'package:crm_smart/ui/screen/home/pageshome/support.dart';
import 'package:flutter/cupertino.dart';

List<String> listtext = [
  'مشرف مبيعات',
  'موظف مبيعات',
  'إدارة العناية بالعملاء',
  'موظف عناية بالعملاء ',
  'موظف دعم فني',
  'إدارة الدعم الفني',
  'موظف عناية بالعملاء',
  'مدير دعم',
  'إدارة عليا',
  'الإدارة المالية',
  'إدارة التحصيل',
  'إدارة العمليات'
];
final List<String> itemCategory = [
  'المبيعات',
  'الدعم الفني',
  'العناية بالعملاء',
  'التسويق الإلكتروني',
  'إدارة',
  'التحصيل',
];

final List<String> listSelectCategory = [
  'كل العملاء',
  'العملاء المشتركين ',
  'كل طلبات الموافقة ',
  'تقرير مبيعات المناطق والفروع',
  'التقرير الربعي للمناطق والموظفين',
  'تقرير مبيعات جميع الموظفين',
  'تقرير تارجت جميع الموظفين',
];
final List<Widget> listwidget=[
  sales(),
  supportpage(),
  carepage(),
  marketingpage(),
  managmentpage(),
  financepage()
];
final List<dynamic> listHome = [
  [
    'كل العملاء',
    'العملاء المشتركين ',
    'كل طلبات الموافقة ',
    'تقرير مبيعات المناطق والفروع',
    'التقرير الربعي للمناطق والموظفين',
    'تقرير مبيعات جميع الموظفين',
    'تقرير تارجت جميع الموظفين',
  ],
  [
    'كل العملاءالمشتركين',
    'تقرير عملاء الإنتظار',
    'تقرير التركيب للعملاء',
    'عدد الخدمات المتقدمة للعملاء',
    'اخر الملاحظات والتعليقات',
  ],
  [
    'العناية بالعملاء',
    'تذاكر دعم فني مفتوحة',
    'عملاء بحاجة إلى خدمة',
    'عملاء بدون أرقام -أو أرقامهم خاطئة',
    'عملاء لايستخدمون النظام',
    'تقرير العناية بالعملاء',
    'آخر الملاحظات والتعليقات',
  ],
  [
    'عملاء التسويق الإلكتروني',
    'كل عملاء التسويق الإلكتروني',
    'تقرير التسويق الإلكتروني',
    'آخر الملاحظات والتعليقات',
  ],
  [
    'إدارة المستخدمين',
    'المجموعات والصلاحيات',
    'المنتجات',
    'الطلبات والمهام',
  ],
  [
    'جميع العملاء المشتركين',
    'عملاء متأخرين بالسداد',
    'عملاء رافضين السداد',
  ],
];

List<String> imageList = [
  'assest/images/bill.png',
  'assest/images/technical-support.png',
  'assest/images/social-care.png',
  'assest/images/digitalmarketing.png',
  'assest/images/administrator.png',
  'assest/images/money.png'
];