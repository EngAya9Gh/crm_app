import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/ui/screen/home/build_card.dart';
import 'package:crm_smart/ui/widgets/custom_widget/appbar.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customDrawer.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/notify_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../function_global.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        //Provider.of<notifyvm>(context,listen: false).addcounter();
        String typeNotify = message.data['Typenotify'];
        String data_notify = message.data['Typenotify'];
        route_notifyto(typeNotify, context, message.data, null);
      }
    });
    //FirebaseMessaging.onBackgroundMessage.call(message);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // try{

      if (message.notification != null) {}
      //Provider.of<notifyvm>(context,listen: false).getcounter();
      //if(message.data['data'])
      Provider.of<notifyvm>(context, listen: false).addcounter();
      // } catch(e){}
      //add notify to listnotify
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      Provider.of<notifyvm>(context, listen: false).addcounter();
      // Provider.of<notifyvm>(context,listen: false).getcounter();
      String typeNotify = event.data['Typenotify'];
      route_notifyto(typeNotify, context, event.data, null);
    });

    // Provider.of<user_vm_provider>(context, listen: false)
    //     .getcurrentuser();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Add Your Code here.
      //Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();
      Provider.of<RegionProvider>(context, listen: false).getRegions();
      Provider.of<notifyvm>(context, listen: false).getcounter();
      Provider.of<product_vm>(context, listen: false).getproduct_vm();
      Provider.of<ClientTypeProvider>(context, listen: false).getreasons('ticket');

      Provider.of<ticket_vm>(context, listen: false).getticket();

      // Provider.of<invoice_vm>(context, listen: false)
      //     .getfilter_maincity([],'الكل');
      // .getinvoices();

      // Provider.of<notifyvm>(context, listen: false)
      //    .getNotification();

      // await Provider.of<invoice_vm>(context, listen: false)
      //     .getfilter_maincity([],'الكل');
      // Provider.of<client_vm>(context, listen: false)
      //    .getallclient();//getclient_vm();
    });
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 60)).then((_) async {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var sizeh = MediaQuery.of(context).size.height;
    var paddval = 1.0;
    paddval = sizeh / 3;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        //drawerScrimColor: Colors.white,
        backgroundColor: Colors.grey[200],
        appBar: customAppbar(
          backgroundColor: Colors.grey.shade200,
          leading: IconButton(
            icon: Icon(Icons.menu, color: context.colorScheme.black, size: 25.r,),
            tooltip: 'Menu',
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        drawer: CustomDrawer(),
        // drawer: Theme(
        //   data:  Theme.of(context).copyWith(
        //     canvasColor: Colors.white, //This will change the drawer background to blue.
        //     //other styles
        //   ),
        //   child: CustomDrawer(),
        //
        // ),
        // AppBar(
        //   title: Text('الرئيسية',style: TextStyle(color: kWhiteColor),),
        //   centerTitle: true,
        //   elevation: 0,
        //   backgroundColor: kMainColor,
        // ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: BuildCard(),
          ),
        ),
      ),
    );
  }
}
