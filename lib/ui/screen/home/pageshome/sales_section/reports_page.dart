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

class reports_page extends StatefulWidget {
  const reports_page({Key? key}) : super(key: key);

  @override
  _reports_pageState createState() => _reports_pageState();
}

class _reports_pageState extends State<reports_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'احصائيات وتقارير',
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

            context.read<PrivilegeCubit>().checkPrivilege('85') == true
                ? SelectCategory(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => BarChartAPI()));
                    },
                    title: 'تقارير مبيعات الموظفين ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),


            context.read<PrivilegeCubit>().checkPrivilege('86') == true
                ? SelectCategory(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => BarChartregoinsales()));
                    },
                    title: ' تقارير مبيعات الفروع ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('88') == true
                ? SelectCategory(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => salesproduct()));
                    },
                    title: ' تقارير مبيعات المنتجات ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('91') == true
                ? SelectCategory(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => deptsales()));
                    },
                    title: ' تقارير ديون العملاء ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('95') == true
                ? SelectCategory(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => sales_reportstate()));
                    },
                    title: ' تقارير حالات العملاء ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),

             //تاريخ الفاتورة جنبو اسم المؤسسة
          ],
        ),
      ),
    );
  }
}
