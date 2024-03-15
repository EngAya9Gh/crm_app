import 'package:crm_smart/ui/screen/client/Acceptpage.dart';
import 'package:crm_smart/ui/screen/client/approve_type_user.dart';
import 'package:crm_smart/ui/screen/client/approvefinance_approve.dart';
import 'package:crm_smart/ui/screen/client/outClient.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:crm_smart/ui/screen/home/widgethomeitem.dart';
import 'package:crm_smart/ui/screen/invoice/get_deleted_invoice.dart';
import 'package:crm_smart/ui/screen/report/chartsales_regoin.dart';
import 'package:crm_smart/ui/screen/report/chartsales_user.dart';
import 'package:crm_smart/ui/screen/report/deptsales.dart';
import 'package:crm_smart/ui/screen/report/sales_reportstate.dart';
import 'package:crm_smart/ui/screen/report/salesproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../features/clients_list/presentation/pages/clients_list_page.dart';
import '../../../../../features/manage_agents_and_distributors/presentation/pages/agents_distributors_page.dart';
import '../../../../../features/manage_participates/presentation/pages/participate_list_page.dart';
import '../../../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../../features/manage_withdrawals/presentation/pages/withdrawals_invoices_page.dart';
import '../../../client/agents_distributors_invoices_view.dart';
import '../../../client/calender_client.dart';
import '../../../client/marketing/getLastCommentClient.dart';
import '../../../config/company_view.dart';

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


            context.read<PrivilegeCubit>().checkPrivilege('119') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => getLastCommentClient()));
                    },
                    title: 'آخر تحديثات العملاء')
                : Container(),
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

            context.read<PrivilegeCubit>().checkPrivilege('120') == true
                ? SelectCategory(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => calender_client()));
                    },
                    title: 'جدول زيارات العميل ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),

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


           //تاريخ الفاتورة جنبو اسم المؤسسة
          ],
        ),
      ),
    );
  }
}
