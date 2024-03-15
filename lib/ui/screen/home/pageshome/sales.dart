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

import '../../../../constants.dart';
import '../../../../constantsList.dart';
import '../../../../features/clients_list/presentation/pages/clients_list_page.dart';
import '../../../../features/manage_agents_and_distributors/presentation/pages/agents_distributors_page.dart';
import '../../../../features/manage_participates/presentation/pages/participate_list_page.dart';
import '../../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../../features/manage_withdrawals/presentation/pages/withdrawals_invoices_page.dart';
import '../../client/agents_distributors_invoices_view.dart';
import '../../client/calender_client.dart';
import '../../client/marketing/getLastCommentClient.dart';
import '../../config/company_view.dart';
import '../build_card.dart';

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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BuildCard(
            imageList: imageList_sales,
            itemCategory: itemCategory_sales,
            type: 'sales',
          ),
        ),
      ),
    );
  }
}
