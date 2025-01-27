import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../../features/finance/client_dept/presentation/pages/client_dept_page.dart';
import '../../../../features/finance/clients_attachments/presentation/pages/client_attachments_page.dart';
import '../../../../features/finance/verified_invoice/presentation/pages/mob_verified_invoices_page.dart';
import '../../../../features/finance/verified_invoice/presentation/pages/web_verified_invoices_page.dart';
import '../../../../features/home/presentation/pages/finance_section.dart';
import '../../../common/widgets/app_adaptive_builder.dart';
import '../app_routes_paths.dart';

abstract class FinanceRoutes {
  static GoRoute allRoutes() {
    return GoRoute(
      name: AppRoutesPaths.homeSections.finance,
      path: AppRoutesPaths.homeSections.finance,
      builder: (context, state) => FinancesSection(),
      routes: [
        GoRoute(
          name: AppRoutesPaths.financeSections.attachments.split('/').last,
          path: AppRoutesPaths.financeSections.attachments,
          builder: (context, state) => ClientAttachmentsPage(),
        ),
        GoRoute(
          name: AppRoutesPaths.financeSections.invoiceTransfer.split('/').last,
          path: AppRoutesPaths.financeSections.invoiceTransfer,
          builder: (context, state) => Directionality(
            textDirection: TextDirection.ltr,
            child: AppLayoutBuilder(
              smallBuilder: (context) => MobVerifiedInvoicesPage(),
              mediumBuilder: (context) => WebVerifiedInvoicesPage(),
            ),
          ),
        ),
        GoRoute(
          name: AppRoutesPaths.financeSections.clientDept.split('/').last,
          path: AppRoutesPaths.financeSections.clientDept,
          builder: (context, state) => ClientDeptPage(),
        ),
      ],
    );
  }
}
