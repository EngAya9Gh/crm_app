import 'package:crm_smart/ui/screen/client/Acceptpage.dart';
import 'package:crm_smart/ui/screen/client/approve_type_user.dart';
import 'package:crm_smart/ui/screen/client/approvefinance_approve.dart';
import 'package:crm_smart/ui/screen/client/outClient.dart';
import 'package:crm_smart/ui/screen/client/tabclients.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:crm_smart/ui/screen/home/widgethomeitem.dart';
import 'package:crm_smart/ui/screen/invoice/get_deleted_invoice.dart';
import 'package:crm_smart/ui/screen/report/chartsales_regoin.dart';
import 'package:crm_smart/ui/screen/report/chartsales_user.dart';
import 'package:crm_smart/ui/screen/report/deptsales.dart';
import 'package:crm_smart/ui/screen/report/sales_reportstate.dart';
import 'package:crm_smart/ui/screen/report/salesproduct.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../features/clients_list/presentation/pages/clients_list_page.dart';
import '../../../../features/manage_agents_and_distributors/presentation/pages/agents_distributors_page.dart';
import '../../../../features/manage_participates/presentation/pages/participate_list_page.dart';
import '../../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../features/manage_withdrawals/presentation/pages/withdrawals_invoices_page.dart';
import '../../client/agents_distributors_invoices_view.dart';
import '../../client/calender_client.dart';
import '../../client/marketing/getLastCommentClient.dart';
import '../../config/company_view.dart';

class sales extends StatefulWidget {
  const sales({Key? key}) : super(key: key);

  @override
  _salesState createState() => _salesState();
}

class _salesState extends State<sales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'المبيعات',
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
                ? buildSelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      // Navigator.push(context,
                      //     CupertinoPageRoute(
                      //     builder: (context)=>
                      //         tabclients()));
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => ClientsListPage()));
                    },
                    title: ' قائمة العملاء',
                  )
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('39') == true
                ? buildSelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context, CupertinoPageRoute(builder: (context) => AgentsDistributorsInvoicesView()));
                    },
                    title: 'فواتير العملاء')
                : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('119') == true
                ? buildSelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => getLastCommentClient()));
                    },
                    title: 'آخر تحديثات العملاء')
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('39') == true
                ? buildSelectCategory(
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
            context.read<PrivilegeCubit>().checkPrivilege('113') == true
                ? buildSelectCategory(
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
                ? buildSelectCategory(
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
            context.read<PrivilegeCubit>().checkPrivilege('120') == true
                ? buildSelectCategory(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => calender_client()));
                    },
                    title: 'جدول زيارات العميل ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),

            buildSelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => TransferPage() //AcceptPage()   // support_view(type: 'client',)
                          ));
                },
                title: 'موافقات تحويل العملاء'), //تاريخ الفاتورة جنبو اسم المؤسسة

            context.read<PrivilegeCubit>().checkPrivilege('40') == true
                ? buildSelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => ApprovePage()));
                    },
                    title: ' طلبات موافقة المشرفين ')
                : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('111') == true
                ? buildSelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => ApproveFinancePage()));
                    },
                    title: ' طلبات اعتماد المالية ')
                : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('85') == true
                ? buildSelectCategory(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => BarChartAPI()));
                    },
                    title: 'تقارير مبيعات الموظفين ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),
            buildSelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) => company_view(type: 'ticket'),
                    ),
                  );
                },
                title: 'الشركات المنافسة'),

            context.read<PrivilegeCubit>().checkPrivilege('86') == true
                ? buildSelectCategory(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => BarChartregoinsales()));
                    },
                    title: ' تقارير مبيعات الفروع ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('88') == true
                ? buildSelectCategory(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => salesproduct()));
                    },
                    title: ' تقارير مبيعات المنتجات ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('91') == true
                ? buildSelectCategory(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => deptsales()));
                    },
                    title: ' تقارير ديون العملاء ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('95') == true
                ? buildSelectCategory(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => sales_reportstate()));
                    },
                    title: ' تقارير حالات العملاء ',
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                  )
                : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('14') == true
                ? buildSelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => deletedinvoice()));
                    },
                    title: 'الفواتير المحذوفة')
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('143') == true
                ? buildSelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => WithdrawalsInvoicesPage()));
                    },
                    title: 'إدارة الفواتير المنسحبة',
                  )
                : SizedBox.shrink(),

            context.read<PrivilegeCubit>().checkPrivilege('35') == true
                ? buildSelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => OutClient() //AcceptPage()   // support_view(type: 'client',)
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
