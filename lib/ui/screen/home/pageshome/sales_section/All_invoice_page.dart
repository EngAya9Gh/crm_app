import 'package:crm_smart/ui/screen/client/outClient.dart';
import 'package:crm_smart/ui/screen/home/widgethomeitem.dart';
import 'package:crm_smart/ui/screen/invoice/get_deleted_invoice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../../features/mangement/manage_withdrawals/presentation/pages/withdrawals_invoices_page.dart';
import '../../../client/agents_distributors_invoices_view.dart';

class All_invoice_page extends StatefulWidget {
  const All_invoice_page({Key? key}) : super(key: key);

  @override
  _All_invoice_pageState createState() => _All_invoice_pageState();
}

class _All_invoice_pageState extends State<All_invoice_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'الفواتير',
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
                                  AgentsDistributorsInvoicesView()));
                    },
                    title: 'فواتير العملاء')
                : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('14') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => deletedinvoice()));
                    },
                    title: 'الفواتير المحذوفة')
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('143') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => WithdrawalsInvoicesPage()));
                    },
                    title: 'إدارة الفواتير المنسحبة',
                  )
                : SizedBox.shrink(),

            context.read<PrivilegeCubit>().checkPrivilege('35') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  OutClient() //AcceptPage()   // support_view(type: 'client',)
                              ));
                    },
                    title: 'الفواتير المنسحبة')
                : Container(), //تاريخ الفاتورة جنبو اسم المؤسسة
          ],
        ),
      ),
    );
  }
}
