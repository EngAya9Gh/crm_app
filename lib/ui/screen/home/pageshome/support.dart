import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../features/support/dates_table/presentation/pages/dates_table_page.dart';
import '../../../../features/support/delay_after_install/presentation/pages/delay_after_install_page.dart';
import '../../../../features/support/delay_install_reports/presentation/pages/delay_install_reports_page.dart';
import '../../../../features/support/support_accept_clients/presentation/pages/support_clients_accept_page.dart';
import '../../../../features/support/support_clients_invoices/presentation/pages/support_clients_invoices_page.dart';
import '../../../../features/support/waiting_agents/presentation/pages/waiting_agents_page.dart';
import '../../../../view_model/maincity_vm.dart';
import '../../report/support_intall_report.dart';
import '../widgethomeitem.dart';

class supportpage extends StatefulWidget {
  const supportpage({Key? key}) : super(key: key);

  @override
  _supportpageState createState() => _supportpageState();
}

class _supportpageState extends State<supportpage> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<MainCityProvider>(context, listen: false).getmaincity();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'الدعم الفني',
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
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            if (context.read<PrivilegeCubit>().checkPrivilege('19'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(SupportClientsAcceptPage()),
                title: 'العملاء المشتركين',
              ),
            //تاريخ الفاتورة جنبو اسم المؤسسة
            if (context.read<PrivilegeCubit>().checkPrivilege('34'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(SupportClientsInvoicesPage()),
                title: 'فواتير العملاء',
              ),

            // Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('137')
            //     ? buildSelectCategory(
            //         colorbag: Colors.white,
            //         colortitle: Colors.black,
            //         colorarrow: Colors.black,
            //         onTap: () {
            //           Navigator.push(context, CupertinoPageRoute(builder: (context) => CommunicationListPage()));
            //         },
            //         title: 'قائمة العملاء المميزين',
            //       )
            //     : Container(),

            context.read<PrivilegeCubit>().checkPrivilege('18')
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => DatesTablePage()));
                    },
                    title: 'جدول التركيب للعملاء')
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('99')
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => support_install_report()));
                    },
                    title: 'تقرير التركيب للعملاء')
                : Container(),

            if (context.read<PrivilegeCubit>().checkPrivilege('100'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(DelayInstallReportsPage()),
                title: 'تقرير التأخير عن الجدولة للعملاء',
              ),

            if (context.read<PrivilegeCubit>().checkPrivilege('101'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(DelayAfterInstallPage()),
                title: 'تقرير التأخير عن التركيب للعملاء',
              ),

            if (context.read<PrivilegeCubit>().checkPrivilege('195')) ...[
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(WaitingAgentsPage()),
                title: 'وكلاء في انتظار التدريب',
              ),
            ],
          ],
        ),
      ),
    );
  }
}
