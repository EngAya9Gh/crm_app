import 'package:crm_smart/features/mangement/manage_users/presentation/pages/user_profile.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/sales/clients/client_dashboard.dart';
import '../../../../features/sales/public_relations/agents_and_distributors/presentation/pages/agent_distributor_profile_page.dart';
import '../../../../features/sales/public_relations/participates/presentation/pages/participate_profile_page.dart';
import '../../../../ui/screen/client/client_profile.dart';
import '../app_routes_paths.dart';

abstract class SharedRoutes {
  static GoRoute clientProfileRoute(String routeName) {
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
        );
      },
    );
  }

  static GoRoute clientDashboardRoute(String routeName) {
    return GoRoute(
      name: routeName,
      path: AppRoutesPaths.users.clientDashboard,
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
          tabIndex:
              extra?.containsKey('tabIndex') == true ? extra!['tabIndex'] : 0,
          idAgent: state.pathParameters['idAgent']!,
        );
      },
    );
  }

  static GoRoute userProfileRoute(String routeName) {
    return GoRoute(
      name: routeName,
      path: AppRoutesPaths.users.userProfile,
      builder: (context, state) {
        final extra = state.extra as Map?;
        print("state.pathParameters['id'] => ${state.pathParameters['id']}");
        return UserProfile(
          userModel: extra?.containsKey('userModel') == true
              ? extra!['userModel']
              : null,
          id: state.pathParameters['id']!,
        );
      },
    );
  }
}
