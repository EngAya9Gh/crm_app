import 'package:go_router/go_router.dart';
import '../../../../features/clients_care/clients_attachments/presentation/pages/client_attachments_page.dart';
import '../../../../features/clients_care/crud_activites/presentation/pages/crud_activities_page.dart';
import '../../../../features/home/presentation/pages/finance_section.dart';
import '../../../../features/home/presentation/pages/sales_section.dart';
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
        )
        // GoRoute(
        //   name: AppRoutesPaths.salesSections.crudActivities.split('/').last,
        //   path: AppRoutesPaths.salesSections.crudActivities,
        //   builder: (context, state) => CrudActivitiesPage(),
        // ),
      ],
    );
  }
}
