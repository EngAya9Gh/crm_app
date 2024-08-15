import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/models/page_model.dart';
import '../../../../core/config/theme/theme.dart';
import '../../../../core/utils/extensions/build_context.dart';
import '../../../../function_global.dart';
import '../../../../ui/widgets/custom_widget/customDrawer.dart';
import '../../../../ui/widgets/custom_widget/home_app_bar.dart';
import '../../../../view_model/notify_vm.dart';
import '../../../../view_model/product_vm.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../../view_model/typeclient.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../task_management/presentation/pages/task_management_list_page.dart';
import '../widgets/adaptive_body.dart';
import 'care.dart';
import 'managment.dart';
import 'sales_section.dart';
import 'support.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        String typeNotify = message.data['Typenotify'];
        String data_notify = message.data['Typenotify'];
        route_notifyto(typeNotify, context, message.data, null);
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {}
      Provider.of<notifyvm>(context, listen: false).addcounter();
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      Provider.of<notifyvm>(context, listen: false).addcounter();
      // Provider.of<notifyvm>(context,listen: false).getcounter();
      String typeNotify = event.data['Typenotify'];
      route_notifyto(typeNotify, context, event.data, null);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<UserProvider>(context, listen: false).getAllUsers();
      Provider.of<RegionProvider>(context, listen: false).getRegions();
      Provider.of<notifyvm>(context, listen: false).getcounter();
      Provider.of<product_vm>(context, listen: false).getproduct_vm();
      Provider.of<ClientTypeProvider>(context, listen: false)
          .getreasons('ticket');
    });
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 60)).then((_) async {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double sizeh = MediaQuery.of(context).size.height;
    var paddval = 1.0;
    paddval = sizeh / 3;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        //drawerScrimColor: Colors.white,
        backgroundColor: Colors.grey[200],
        appBar: HomeAppBar(
          backgroundColor: Colors.grey.shade200,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: context.colorScheme.black,
              size: 25.r,
            ),
            tooltip: 'Menu',
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        drawer: CustomDrawer(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: AdaptiveBody(pages: generalPages),
          ),
        ),
      ),
    );
  }
}

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
