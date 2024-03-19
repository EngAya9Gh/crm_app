import 'package:crm_smart/ui/screen/home/pageshome/care.dart';
import 'package:crm_smart/ui/screen/home/pageshome/managment.dart';
import 'package:crm_smart/ui/screen/home/pageshome/sales.dart';
import 'package:crm_smart/ui/screen/home/pageshome/sales_section/All_clinets_page.dart';
import 'package:crm_smart/ui/screen/home/pageshome/sales_section/All_invoice_page.dart';
import 'package:crm_smart/ui/screen/home/pageshome/sales_section/Emarketing.dart';
import 'package:crm_smart/ui/screen/home/pageshome/sales_section/race_all.dart';
import 'package:crm_smart/ui/screen/home/pageshome/sales_section/relation_page.dart';
import 'package:crm_smart/ui/screen/home/pageshome/sales_section/reports_page.dart';
import 'package:crm_smart/ui/screen/home/pageshome/support.dart';
import 'package:flutter/cupertino.dart';

import 'features/task_management/presentation/pages/task_management_list_page.dart';

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
  // 'التسويق الإلكتروني',
  'إدارة',
  // 'التحصيل',
  // 'السباقات',
  'إدارة المهام',
];
final List<String> itemCategory_sales = [
  'العملاء',
  'الفواتير',
  'علاقات عامة',
  'التسويق الإلكتروني',
  'تقارير واحصائيات',
  // 'التحصيل',
  'السباقات',
  // 'إدارة المهام',
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
final List<Widget> listwidget = [
  sales(),
  supportpage(),
  carepage(),
  // marketingpage(),
  ManagementPage(),
  // financepage(),
  // race_page(),
  TaskManagementListPage(),
];
final List<Widget> listwidget_sales = [
  sales_client(),
  All_invoice_page(),
  relation_page(),
  marketingpage(),
  // ManagementPage(),
  reports_page(),
  race_page(),
  // TaskManagementListPage(),
];
List<String> sourceClientsList = [
  'ميداني',
  'فيسبوك',
  'غوغل',
  'تويتر',
  'الموقع',
  'الرقم الموحد',
  'واتس كنترول',
  'انستغرام',
  'سناب',
  'غوغل ماب',
  'تيك توك',
  'عميل موصى به',
  'نسخة تجريبية',
  'ماسنجر دايركت',
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
  // 'assest/images/digitalmarketing.png',
  'assest/images/administrator.png',
  // 'assest/images/money.png',
  // 'assest/images/race.png',
  'assest/images/managetask1.png',
];
List<String> imageList_sales = [
  'assest/images/All_clients1.png',
  'assest/images/All_invoice.png',
  'assest/images/relationship.png',
  'assest/images/digitalmarketing.png',
  'assest/images/reports.png',
  // 'assest/images/money.png',
  'assest/images/race.png',
  // 'assest/images/managetask1.png',
];

List<String> clientsClassificationList = [
  'لايخدمه النظام',
  'اهتمام مختلف',
  'الرقم غير صحيح',
  'مع موظف آخر',
  'غير معروف',
  'لا يرد',
  'مكرر',
  'أخرى',
];
List<String> clientsRegistrationTyeList = [
  'صحيح',
  'خاطئ',
];
