import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_navigator.dart';
import '../../../../../ui/screen/client/calender_client.dart';
import '../../../../../ui/screen/home/widgethomeitem.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../sales/clients/clients_debts/presentation/pages/clients_debts_page.dart';
import '../../../../sales/clients/clients_list/presentation/pages/clients_list_page.dart';
import '../../../../sales/clients/clients_transfer_approvals/presentation/pages/clients_transfer_approvals_page.dart';
import '../../../../sales/clients/finance_pending/presentation/pages/finance_pending_page.dart';
import '../../../../sales/clients/latest_clients_updates/presentation/pages/latest_clients_updates_page.dart';
import '../../../../sales/clients/pending_invoices/presentation/pages/pending_invoices_page.dart';
import '../../../../sales/exceeded_clients/presentation/pages/exceeded_clients_page.dart';

class sales_client extends StatefulWidget {
  const sales_client({super.key});

  @override
  _sales_clientState createState() => _sales_clientState();
}

class _sales_clientState extends State<sales_client> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(title: 'العملاء'),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            if (context.read<PrivilegeCubit>().checkPrivilege('36'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(ClientsListPage()),
                title: ' قائمة العملاء',
              ),

            if (context.read<PrivilegeCubit>().checkPrivilege('119'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(LatestClientsUpdatesPage()),
                title: 'آخر تحديثات العملاء',
              ),

            if (context.read<PrivilegeCubit>().checkPrivilege('39'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(ClientsDebtsPage()),
                title: 'ديون العملاء',
              ),

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
              onTap: () => AppNavigator.push(ClientsTransferApprovalsPage()),
              title: 'موافقات تحويل العملاء',
            ),

            if (context.read<PrivilegeCubit>().checkPrivilege('40'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(PendingInvoicesPage()),
                title: ' طلبات موافقة المشرفين ',
              ),

            if (context.read<PrivilegeCubit>().checkPrivilege('111'))
              SelectCategory(
                colorbag: Colors.white,
                colortitle: Colors.black,
                colorarrow: Colors.black,
                onTap: () => AppNavigator.push(FinancePendingPage()),
                title: ' طلبات اعتماد المالية ',
              ),

            if (context.read<PrivilegeCubit>().checkPrivilege('233'))
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
