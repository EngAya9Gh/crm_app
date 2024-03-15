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
import '../../../../../features/links/presentation/pages/manage_links_page.dart';
import '../../../../../features/manage_agents_and_distributors/presentation/pages/agents_distributors_page.dart';
import '../../../../../features/manage_participates/presentation/pages/participate_list_page.dart';
import '../../../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../../features/manage_withdrawals/presentation/pages/withdrawals_invoices_page.dart';
import '../../../client/agents_distributors_invoices_view.dart';
import '../../../client/calender_client.dart';
import '../../../client/marketing/getLastCommentClient.dart';
import '../../../config/company_view.dart';
import '../../../user/usertest_view.dart';

class relation_page extends StatefulWidget {
  const relation_page({Key? key}) : super(key: key);

  @override
  _relation_pageState createState() => _relation_pageState();
}

class _relation_pageState extends State<relation_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'علاقات عامة',
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
             //تاريخ الفاتورة جنبو اسم المؤسسة
            context.read<PrivilegeCubit>().checkPrivilege('113') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) =>
                              ParticipateListPage(),
                        ),
                      );
                    },
                    title: 'المتعاونين')
                : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('114') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) =>
                              AgentsAndDistributorsPage(),
                        ),
                      );
                    },
                    title: "الوكلاء والموزعين",
                  )
                : Container(),

            SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) =>
                          company_view(type: 'ticket'),
                    ),
                  );
                },
                title: 'الشركات المنافسة'),
            SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) =>
                          ManageLinkPage( ),
                    ),
                  );
                },
                title:  'الروابط الهامة'),
            SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) =>
                          usertest_view( ),
                    ),
                  );
                },
                title:   'يوزرات تجريبية'),

           //تاريخ الفاتورة جنبو اسم المؤسسة
          ],
        ),
      ),
    );
  }
}
