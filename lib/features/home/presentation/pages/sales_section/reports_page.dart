import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../ui/screen/home/widgethomeitem.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../sales/reports/clients_debts_reports/presentation/pages/clients_debts_reports_page.dart';
import '../../../../sales/reports/clients_status_reports/presentation/pages/clients_status_reports_page.dart';
import '../../../../sales/reports/employees_sales_reports/presentation/pages/employees_sales_reports_page.dart';
import '../../../../sales/reports/products_sales_reports/presentation/pages/products_sales_reports_page.dart';
import '../../../../sales/reports/regions_sales_reports/presentation/pages/regions_sales_reports_page.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'احصائيات وتقارير',
          style: TextStyle(
            color: AppColors.kWhiteColor,
            fontFamily: AppFonts.fontFamily2,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.kMainColor,
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
              ),
            if (context.read<PrivilegeCubit>().checkPrivilege('86'))
              SelectCategory(
                onTap: () => AppNavigator.push(RegionsSalesReportsPage()),
                title: 'تقارير مبيعات الفروع',
              ),
            if (context.read<PrivilegeCubit>().checkPrivilege('88'))
              SelectCategory(
                onTap: () => AppNavigator.push(ProductsSalesReportsPage()),
                title: 'تقارير مبيعات المنتجات',
              ),
            if (context.read<PrivilegeCubit>().checkPrivilege('91'))
              SelectCategory(
                onTap: () => AppNavigator.push(ClientsDebtsReportsPage()),
                title: 'تقارير ديون العملاء',
              ),
            if (context.read<PrivilegeCubit>().checkPrivilege('95'))
              SelectCategory(
                onTap: () => AppNavigator.push(ClientsStatusReportsPage()),
                title: 'تقارير حالات العملاء',
              ),
          ],
        ),
      ),
    );
  }
}
