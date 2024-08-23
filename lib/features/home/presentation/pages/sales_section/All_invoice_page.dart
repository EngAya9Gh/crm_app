import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../ui/screen/client/out_client.dart';
import '../../../../../ui/screen/home/widgethomeitem.dart';
import '../../../../../ui/screen/invoice/deleted_invoices.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../mangement/manage_withdrawals/presentation/pages/withdrawals_invoices_page.dart';
import '../../../../sales/invoices_list/presentation/pages/clients_invoices_page.dart';

class All_invoice_page extends StatefulWidget {
  const All_invoice_page({super.key});

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
            color: AppColors.kWhiteColor,
            fontFamily: AppFonts.fontFamily2,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            if (context.read<PrivilegeCubit>().checkPrivilege('39'))
              SelectCategory(
                  colorbag: Colors.white,
                  colortitle: Colors.black,
                  colorarrow: Colors.black,
                  onTap: () => AppNavigator.push(ClientsInvoicesPage()),
                  title: 'فواتير العملاء'),

            context.read<PrivilegeCubit>().checkPrivilege('14') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () => AppNavigator.push(deletedInvoices()),
                    title: 'الفواتير المحذوفة')
                : Container(),
            context.read<PrivilegeCubit>().checkPrivilege('143') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () => AppNavigator.push(WithdrawalsInvoicesPage()),
                    title: 'إدارة الفواتير المنسحبة',
                  )
                : SizedBox.shrink(),

            context.read<PrivilegeCubit>().checkPrivilege('35') == true
                ? SelectCategory(
                    colorbag: Colors.white,
                    colortitle: Colors.black,
                    colorarrow: Colors.black,
                    onTap: () => AppNavigator.push(OutClient()),
                    title: 'الفواتير المنسحبة')
                : Container(), //تاريخ الفاتورة جنبو اسم المؤسسة
          ],
        ),
      ),
    );
  }
}
