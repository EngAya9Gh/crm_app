import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../../features/sales/reports/clients_debts_reports/presentation/pages/clients_debts_reports_page.dart';
import '../../../../../features/sales/reports/employees_sales_reports/presentation/pages/employees_sales_reports_page.dart';
import '../../../../../features/sales/reports/products_sales_reports/presentation/pages/products_sales_reports_page.dart';
import '../../../../../features/sales/reports/regions_sales_reports/presentation/pages/regions_sales_reports_page.dart';
import '../../../report/sales_reportstate.dart';
import '../../widgethomeitem.dart';

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
            if (context.read<PrivilegeCubit>().checkPrivilege('85'))
              SelectCategory(
                onTap: () => AppNavigator.push(EmployeesSalesReportsPage()),
                title: 'تقارير مبيعات الموظفين',
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
              ),
            if (context.read<PrivilegeCubit>().checkPrivilege('86'))
              SelectCategory(
                onTap: () => AppNavigator.push(RegionsSalesReportsPage()),
                title: 'تقارير مبيعات الفروع',
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
              ),
            if (context.read<PrivilegeCubit>().checkPrivilege('88'))
              SelectCategory(
                onTap: () => AppNavigator.push(ProductsSalesReportsPage()),
                title: 'تقارير مبيعات المنتجات',
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
              ),
            if (context.read<PrivilegeCubit>().checkPrivilege('91'))
              SelectCategory(
                onTap: () => AppNavigator.push(ClientsDebtsReportsPage()),
                title: 'تقارير ديون العملاء',
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
              ),
            if (context.read<PrivilegeCubit>().checkPrivilege('95'))
              SelectCategory(
                onTap: () => AppNavigator.push(SalesReportState()),
                title: ' تقارير حالات العملاء ',
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
              ),
          ],
        ),
      ),
    );
  }
}
