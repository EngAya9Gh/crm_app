import 'package:crm_smart/core/config/navigator/routes/routes_helper.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/mangement/manage_users/presentation/pages/user_profile.dart';
import '../../../../features/sales/clients/client_dashboard.dart';
import '../../../../features/sales/public_relations/agents_and_distributors/presentation/pages/agent_distributor_profile_page.dart';
import '../../../../features/sales/public_relations/participates/presentation/pages/participate_profile_page.dart';
import '../../../../ui/screen/client/client_profile.dart';
import '../app_routes_paths.dart';

abstract class SharedRoutes {
  static GoRoute clientProfileRoute(String routeName,
      {List<RouteBase> routes = const []}) {
    return GoRoute(
      name: routeName,
      path: AppRoutesPaths.users.clientProfile,
      builder: (context, state) {
        final extra = state.extra as Map?;
        return ClientProfile(
          idClient: state.pathParameters['idClient'],
          tabIndex:
              extra?.containsKey('tabIndex') == true ? extra!['tabIndex'] : 0,
          tabCareIndex: extra?.containsKey('tabCareIndex') == true
              ? extra!['tabCareIndex']
              : 0,
          idCommunication: extra?.containsKey('idCommunication') == true
              ? extra!['idCommunication']
              : '0',
          event: extra?.containsKey('event') == true ? extra!['event'] : null,
          clientTransfer: extra?.containsKey('clientTransfer') == true
              ? extra!['clientTransfer']
              : null,
        );
      },
      routes: routes,
    );
  }

  static GoRoute clientDashboardRoute(String routeName,String routePath) {
    return GoRoute(
      name: routeName,
      path: routePath,
      builder: (context, state) {
        final extra = state.extra as Map;
        return ClientDashboard(
          invoiceModel: extra['invoiceModel'],
          typeInvoice: extra['typeInvoice'],
        );
      },
    );
  }

  static GoRoute participateProfileRoute(String routeName) {
    return GoRoute(
      name: routeName,
      path: AppRoutesPaths.users.participateProfile,
      builder: (context, state) {
        return ParticipateProfilePage(
          participateId: state.pathParameters['participateId']!,
        );
      },
    );
  }

  static GoRoute agentProfileRoute(String routeName) {
    return GoRoute(
      name: routeName,
      path: AppRoutesPaths.users.agentProfile,
      builder: (context, state) {
        final extra = state.extra as Map?;
        return AgentProfilePage(
          idAgent: state.pathParameters['idAgent']!,
          tabIndex:
              extra?.containsKey('tabIndex') == true ? extra!['tabIndex'] : 0,
          agent: extra?.containsKey('agent') == true ? extra!['agent'] : null,
        );
      },
    );
  }

  static GoRoute userProfileRoute(
    String routeName, {
    List<RouteBase> routes = const [],
  }) {
    return GoRoute(
      name: routeName,
      path: AppRoutesPaths.users.userProfile,
      builder: (context, state) {
        final extra = state.extra as Map?;
        return UserProfile(
          userModel: RoutesHelper.nullableExtra(extra, 'userModel'),
          id: state.pathParameters['id']!,
        );
      },
      routes: routes,
    );
  }
}
