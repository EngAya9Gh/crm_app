import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../../features/sales/clients_list/presentation/pages/clients_list_page.dart';
import '../../../../../features/sales/exceeded_clients/presentation/pages/exceeded_clients_page.dart';
import '../../../../../features/sales/latest_clients_updates/presentation/pages/latest_clients_updates_page.dart';
import '../../../client/Acceptpage.dart';
import '../../../client/approve_type_user.dart';
import '../../../client/approvefinance_approve.dart';
import '../../../client/calender_client.dart';
import '../../approvepage.dart';
import '../../widgethomeitem.dart';

class sales_client extends StatefulWidget {
  const sales_client({Key? key}) : super(key: key);

  @override
  _sales_clientState createState() => _sales_clientState();
}

class _sales_clientState extends State<sales_client> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'العملاء',
          style: TextStyle(
            color: kWhiteColor,
            fontFamily: kfontfamily2,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            context.read<PrivilegeCubit>().checkPrivilege('36') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      // Navigator.push(context,
                      //     CupertinoPageRoute(
                      //     builder: (context)=>
                      //         tabclients()));
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ClientsListPage()));
                    },
                    title: ' قائمة العملاء',
                  )
                : Container(),

            if (context.read<PrivilegeCubit>().checkPrivilege('119'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(LatestClientsUpdatesPage()),
                title: 'آخر تحديثات العملاء',
              ),

            context.read<PrivilegeCubit>().checkPrivilege('39') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  invoicesAcceptclient() //AcceptPage()   // support_view(type: 'client',)
                              ));
                    },
                    title: 'ديون العملاء')
                : Container(), //تاريخ الفاتورة جنبو اسم المؤسسة

            if (context.read<PrivilegeCubit>().checkPrivilege('120'))
              SelectCategory(
                onTap: () => AppNavigator.push(calender_client()),
                title: 'جدول زيارات العميل ',
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
              ),

            SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              TransferPage() //AcceptPage()   // support_view(type: 'client',)
                          ));
                },
                title:
                    'موافقات تحويل العملاء'), //تاريخ الفاتورة جنبو اسم المؤسسة

            context.read<PrivilegeCubit>().checkPrivilege('40') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ApprovePage()));
                    },
                    title: ' طلبات موافقة المشرفين ')
                : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('111') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ApproveFinancePage()));
                    },
                    title: ' طلبات اعتماد المالية ')
                : Container(),

            SelectCategory(
              colorbag: Colors.white,
              colortitle: Colors.black,
              colorarrow: Colors.black,
              onTap: () => AppNavigator.push(ExceededClientsPage()),
              title: 'تحويلات عملاء التسويق لميداني',
            ),
            //تاريخ الفاتورة جنبو اسم المؤسسة
          ],
        ),
      ),
    );
  }
}
