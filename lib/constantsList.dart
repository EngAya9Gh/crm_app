import 'core/common/models/page_model.dart';
import 'features/home/presentation/pages/care.dart';
import 'features/home/presentation/pages/managment.dart';
import 'features/home/presentation/pages/sales.dart';
import 'features/home/presentation/pages/sales_section/All_clinets_page.dart';
import 'features/home/presentation/pages/sales_section/All_invoice_page.dart';
import 'features/home/presentation/pages/sales_section/race_all.dart';
import 'features/home/presentation/pages/sales_section/relation_page.dart';
import 'features/home/presentation/pages/sales_section/reports_page.dart';
import 'features/home/presentation/pages/support.dart';
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

final List<String> listSelectCategory = [
  'كل العملاء',
  'العملاء المشتركين ',
  'كل طلبات الموافقة ',
  'تقرير مبيعات المناطق والفروع',
  'التقرير الربعي للمناطق والموظفين',
  'تقرير مبيعات جميع الموظفين',
  'تقرير تارجت جميع الموظفين',
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

// sales
final List<PageModel> salesPages = [
  PageModel(
    page: sales_client(),
    title: 'العملاء',
    image: 'assest/images/All_clients1.png',
  ),
  PageModel(
    page: All_invoice_page(),
    title: 'الفواتير',
    image: 'assest/images/All_invoice.png',
  ),
  PageModel(
    page: relation_page(),
    title: 'علاقات عامة',
    image: 'assest/images/relationship.png',
  ),
  // PageModel(
  //   page: marketingpage(),
  //   title: 'التسويق الإلكتروني',
  //   image: 'assest/images/digitalmarketing.png',
  // ),
  // PageModel(
  //   page: ManagementPage(),
  //   title: 'إدارة',
  //   image: 'assest/images/administrator.png',
  // ),
  PageModel(
    page: reports_page(),
    title: 'تقارير واحصائيات',
    image: 'assest/images/reports.png',
  ),
  PageModel(
    page: race_page(),
    title: 'السباقات',
    image: 'assest/images/race.png',
  ),
  // PageModel(
  //   page: TaskManagementListPage(),
  //   title: 'إدارة المهام',
  //   image: 'assest/images/managetask1.png',
  // ),
];

// general
List<PageModel> generalPages = [
  PageModel(
    page: SalesSection(),
    title: 'المبيعات',
    image: 'assest/images/bill.png',
  ),
  PageModel(
    page: supportpage(),
    title: 'الدعم الفني',
    image: 'assest/images/technical-support.png',
  ),
  PageModel(
    page: carepage(),
    title: 'العناية بالعملاء',
    image: 'assest/images/social-care.png',
  ),
  // PageModel(
  //   page: marketingpage(),
  //   title: 'التسويق الإلكتروني',
  //   image: 'assest/images/digitalmarketing.png',
  // ),
  PageModel(
    page: ManagementPage(),
    title: 'إدارة',
    image: 'assest/images/administrator.png',
  ),
  // PageModel(
  //   page: financepage(),
  //   title: 'الإدارة المالية',
  //   image: 'assest/images/money.png',
  // ),
  // PageModel
  //   page: race_page(),
  //   title: 'السباقات',
  //   image:
  // 'assest/images/race.png',
  // ),
  PageModel(
    page: TaskManagementListPage(),
    title: 'إدارة المهام',
    image: 'assest/images/managetask1.png',
  ),
];
