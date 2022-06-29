
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/ui/screen/client/detail_client.dart';
import 'package:crm_smart/ui/screen/home/build_card.dart';
import 'package:crm_smart/ui/screen/invoice/get_deleted_invoice.dart';
import 'package:crm_smart/ui/widgets/custom_widget/appbar.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customDrawer.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/notify_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import '../../../function_global.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print("in init getInitialMessage");
        //Provider.of<notifyvm>(context,listen: false).addcounter();
        String typeNotify= message.data['Typenotify'];
        String data_notify= message.data['Typenotify'];
        route_notifyto(typeNotify,context,message.data,null);
      }
    });
    //FirebaseMessaging.onBackgroundMessage.call(message);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
     // try{
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data['idclient']}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
      //Provider.of<notifyvm>(context,listen: false).getcounter();
      //if(message.data['data'])
        Provider.of<notifyvm>(context,listen: false).addcounter();
     // } catch(e){}
      //add notify to listnotify
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('onMessageOpenedApp');
      Provider.of<notifyvm>(context,listen: false).addcounter();
      // Provider.of<notifyvm>(context,listen: false).getcounter();
      String typeNotify= event.data['Typenotify'];
      route_notifyto(typeNotify,context,event.data,null);
    });

    // Provider.of<user_vm_provider>(context, listen: false)
    //     .getcurrentuser();
    print('in home...init');
    WidgetsBinding.instance!.addPostFrameCallback((_){

      // Add Your Code here.
      //Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();
      Provider.of<regoin_vm>(context,listen: false).getregoin();
      Provider.of<notifyvm>(context,listen: false).getcounter();
      Provider.of<product_vm>(context, listen: false)
          .getproduct_vm();
      Provider.of<typeclient>(context,listen: false).getreasons('ticket');

      Provider.of<ticket_vm>(context, listen: false)
          .getticket();
    });
    // List<PrivilgeModel> list= Provider.of<privilge_vm>(context,listen: false).privilgelist;
    //check level user
    //Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();
    // Provider.of<client_vm>(context, listen: false)
    //     . getclient_vm();
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   Provider.of<privilge_vm>(context,listen: false).getprivlg_usercurrent();
    //   Provider.of<client_vm>(context, listen: false)
    //       . getclient_vm();
    // });
    Provider.of<invoice_vm>(context, listen: false)
        .getinvoices();
  }
  @override
  void didChangeDependencies() {
     Future.delayed(Duration(milliseconds: 60)).then((_) async {
      await Provider.of<privilge_vm>
        (context,listen: false).getprivlg_usercurrent();

      await Provider.of<notifyvm>(context, listen: false)
          .getNotification();

      List<PrivilgeModel> list=
      await   Provider.of<privilge_vm>(context,listen: false).privilgelist;
      Provider.of<client_vm>(context, listen: false).setvaluepriv(list);

      await Provider.of<client_vm>(context, listen: false)
          .getallclient();//getclient_vm();

    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    var sizeh=MediaQuery.of(context).size.height;
     var paddval=1.0;
    paddval= sizeh/3;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        //drawerScrimColor: Colors.white,
        backgroundColor: Colors.grey[200],
        appBar: customAppbar(
          leading:    IconButton(
            icon: Icon(Icons.menu,color: kWhiteColor,),
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
            padding: const EdgeInsets.only(top: 25),
            child: BuildCard(),
          ),
        ),
      ),
    );
  }
}
