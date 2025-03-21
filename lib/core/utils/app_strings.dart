abstract class AppStrings {
  // local storage
  static const _SecureStorage secureStorage = _SecureStorage();
  static const _Prefs prefs = _Prefs();
  static const _EmployeesSalesReportsHydratedCubitKeys employeesSalesReportsCubit = _EmployeesSalesReportsHydratedCubitKeys();

  static const _RegionsSalesReportsHydratedCubitKeys regionsSalesReportsCubit = _RegionsSalesReportsHydratedCubitKeys();

  static const _ProductsSalesReportsHydratedCubitKeys productsSalesReportsCubit = _ProductsSalesReportsHydratedCubitKeys();

  static const _ClientsDebtsReportsHydratedCubitKeys clientsDebtsReportsCubit = _ClientsDebtsReportsHydratedCubitKeys();

  static const _ClientsStatusReportsHydratedCubitKeys clientsStatusReportsCubit = _ClientsStatusReportsHydratedCubitKeys();

  static const _ClientsCareReportsHydratedCubitKeys clientsCareReportsCubit = _ClientsCareReportsHydratedCubitKeys();

  static const _PeriodicCommunicationReportsHydratedCubitKeys periodicCommunicationReportsCubit = _PeriodicCommunicationReportsHydratedCubitKeys();

  static const _ManageWithdrawnInvoice manageWithdrawnInvoice = _ManageWithdrawnInvoice();

  static const _Global global = _Global();

  /////label login page
  static const String messageEmpty = 'الحقل فارغ';
  static const String hintEmailText = "Enter your Email";
  static const String hintCodeText = "Enter your code";
  static const String codeVerifyError = "The Pin Code is incorrect or your account is unActive";
  static const String emailError = "This Email is not exist";
  static const String textButtonCode = "Send Code";
  static const String textButtonCode2 = "Verfiy Code";

//////label main main_page
  static const String labelNameProduct = "اسم المنتج";
  static const String labelNamePrice = "سعر المنتج";
  static const String labelNamePackage = "اسم الباقة ";
  static const String labelTurnVat = "تفعيل الضريبة";
  static const String marketLabel = 'عميل عن طريق التسويق الالكتروني';
  static const String labelButtonAddProduct = "إضافة منتج";

///////////label text product///////////
  static const String labelErrorAddProd = "لقد حصل خطأ ما ";
  static const String labelDoneAddProduct = "تمت إضافة المنتج بنجاح";

//////////////////label text user/////////
  static const String labelManage = 'الإدارات';
  static const String labelLevel = 'المستوى';
  static const String labelRegion = 'المنطقة';
  static const String labelMobile = 'رقم الجوال';
  static const String labelAddedUser = " تمت إضافة البيانات بنجاح";
  static const String labelEditUser = " تم تعديل البيانات بنجاح";

/////////////////////////label client////////////////////
  static const String labelClientName = 'اسم العميل';
  static const String labelDescActivity = 'وصف النشاط';
  static const String labelClientEnterprise = 'اسم المؤسسة';
  static const String labelClientMobile = 'رقم الجوال';
  static const String labelClientTypeJob = 'نوع النشاط';
  static const String labelClientCity = 'المدينة';
  static const String labelUsernameClient = 'عنوان العميل';
  static const String labelClientLocation = 'الموقع';

  static const String labelClientRegion = 'المنطقة';
  static const String labelClientDate = 'تاريخ الرفع';
  static const String labelClientType = 'حالة العميل';
  static const String labelClientNameUser = 'اسم الموظف';
  static const String labelClientAdd = 'إضافة العميل';

  static const String labelEmpty = 'هذا الحقل مطلوب';

/////////////////////////////////////////

  static const String labelAmountPaid = 'المبلغ المدفوع';
  static const String labelRenew = 'التجديد السنوي';
  static const String labelInvoiceSource = 'مصدر الفاتورة';
  static const String labelRenew2Year = ' تجديد الموارد البشرية ';

  static const String labelTypePay = 'طريقة الدفع';
  static const String labelTypeInstall = 'طريقة التركيب للعميل';
  static const String labelReadyInstall = 'حالة العميل';

  static const String labelNote = 'ملاحظات المبيعات';
  static const String labelImage = '  مرفق السجل التجاري';
  static const String labelTotal = 'إجمالي الفاتورة';
  static const String labelAddInvoice = 'حفظ';

  static const String labelNotUse = ' عملاء لا يستخدمون النظام ';
  static const String periodicCommunicaitonReportsLabel = 'تقرير الاتصال الدوري ';
  static const String labelWrongNumber = ' عملاء أرقامهم خاطئة ';

  // agents and distributors
  static const String labelAgentsAndDistributors = 'الوكلاء والموزعين';
  static const String agentSearchHint = "اسم الوكيل/الموزع .....";
  static const String agentSearchHintClient = "اسم المؤسسة...";
}

class _SecureStorage {
  const _SecureStorage();

  final String token = 'token';
}

class _Prefs {
  const _Prefs();

  final String isFirstTime = 'isFirstTime';
}

class _EmployeesSalesReportsHydratedCubitKeys {
  const _EmployeesSalesReportsHydratedCubitKeys();

  final String reportTypeNotifier = 'reportTypeNotifier';
  final String periodTypeNotifier = 'periodTypeNotifier';
  final String productTypeNotifier = 'productTypeNotifier';
  final String invoiceTypeNotifier = 'invoiceTypeNotifier';
  final String isMarketingNotifier = 'isMarketingNotifier';
  final String dateFromController = 'dateFromController';
  final String dateToController = 'dateToController';
}

class _RegionsSalesReportsHydratedCubitKeys {
  const _RegionsSalesReportsHydratedCubitKeys();

  final String reportTypeNotifier = 'reportTypeNotifier';
  final String periodTypeNotifier = 'periodTypeNotifier';
  final String regionNotifier = 'regionNotifier';
  final String productTypeNotifier = 'productTypeNotifier';
  final String isMarketingNotifier = 'isMarketingNotifier';
  final String dateFromController = 'dateFromController';
  final String dateToController = 'dateToController';
}

class _ProductsSalesReportsHydratedCubitKeys {
  const _ProductsSalesReportsHydratedCubitKeys();

  final String reportTypeNotifier = 'reportTypeNotifier';
  final String periodTypeNotifier = 'periodTypeNotifier';
  final String productTypeNotifier = 'productTypeNotifier';
  final String invoiceTypeNotifier = 'invoiceTypeNotifier';
  final String regionNotifier = 'regionNotifier';
  final String userNotifier = 'userNotifier';
  final String isMarketingNotifier = 'isMarketingNotifier';
  final String dateFromController = 'dateFromController';
  final String dateToController = 'dateToController';
}

class _ClientsDebtsReportsHydratedCubitKeys {
  const _ClientsDebtsReportsHydratedCubitKeys();

  final String reportTypeNotifier = 'reportTypeNotifier';
  final String regionNotifier = 'regionNotifier';
  final String userNotifier = 'userNotifier';
  final String isMarketingNotifier = 'isMarketingNotifier';
}

class _ClientsStatusReportsHydratedCubitKeys {
  const _ClientsStatusReportsHydratedCubitKeys();

  final String reportTypeNotifierValue = 'reportTypeNotifierValue';
  final String periodTypeNotifierValue = 'periodTypeNotifierValue';
  final String regionNotifierValue = 'regionNotifierValue';
  final String userNotifierValue = 'userNotifierValue';
  final String isMarketingNotifierValue = 'isMarketingNotifierValue';
  final String dateFromControllerText = 'dateFromControllerText';
  final String dateToControllerText = 'dateToControllerText';
}

class _ClientsCareReportsHydratedCubitKeys {
  const _ClientsCareReportsHydratedCubitKeys();

  final String reportTypeNotifier = 'reportTypeNotifier';
  final String periodTypeNotifier = 'periodTypeNotifier';
  final String careTypeNotifier = 'careTypeNotifier';
  final String isMarketingNotifier = 'isMarketingNotifier';
  final String dateFromController = 'dateFromController';
  final String dateToController = 'dateToController';
}

class _PeriodicCommunicationReportsHydratedCubitKeys {
  const _PeriodicCommunicationReportsHydratedCubitKeys();

  final String dateFromController = 'dateFromController';
  final String dateToController = 'dateToController';
}

class _ManageWithdrawnInvoice {
  const _ManageWithdrawnInvoice();

  final String statusNotifier = 'statusNotifier';
  final String branchNotifier = 'branchNotifier';
  final String selectedUserSales = 'selectedUserSales';
  final String withDrawnUser = 'withDrawnUser';
  final String sortType = 'sortType';
  final String fromDate = 'fromDate';
  final String toDate = 'toDate';
  final String drawnFrom = 'DrawnFrom';
  final String drawnTo = 'DrawnTo';
}

class _Global {
  const _Global();

  final String searchHint = "المؤسسة ,العميل , رقم الهاتف....";
  final String noDataExist = 'لا يوجد بيانات';
}
