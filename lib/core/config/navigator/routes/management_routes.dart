import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/pages/privileges_page.dart';
import 'package:crm_smart/features/mangement/manage_users/presentation/pages/action_user_page.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/mangement/advanced_configs/presentation/pages/advanced_cofigs_page.dart';
import '../../../../features/mangement/general_configs/presentation/pages/general_cofigs_page.dart';
import '../../../../features/mangement/manage_privileges/levels/presentation/pages/levels_page.dart';
import '../../../../features/mangement/manage_users/presentation/pages/manage_users_page.dart';
import '../../../../features/mangement/manage_withdrawals/presentation/pages/manage_reject_reasons_page.dart';
import '../../../../features/mangement/manage_withdrawals/presentation/pages/manage_withdrawals_page.dart';
import '../../../../ui/screen/barnch_race/pages/branch_race_mangement_view.dart';
import '../../../../ui/screen/config/activity_view.dart';
import '../../../../ui/screen/config/chang_country.dart';
import '../../../../ui/screen/config/main_city_view.dart';
import '../../../../ui/screen/config/manage_view.dart';
import '../../../../ui/screen/config/regoin_view.dart';
import '../../../../ui/screen/config/reson_view.dart';
import '../../../../ui/screen/product/productView.dart';
import '../../../common/lists/all_sub_sections_lists.dart';
import '../../../common/widgets/sections_and_subsections/sub_sections_list_view.dart';
import '../app_routes_names.dart';
import '../app_routes_paths.dart';
import 'shared_routes.dart';

abstract class ManagementRoutes {
  static GoRoute allRoutes() {
    return GoRoute(
      name: AppRoutesPaths.homeSections.management,
      path: AppRoutesPaths.homeSections.management,
      builder: (context, state) => SubSectionsListView(
        title: 'الإدارة',
        subSections: AllSubSectionsLists.managementSubSections,
      ),
      routes: _managementSubSections(),
    );
  }

  static List<RouteBase> _managementSubSections() {
    return [
      GoRoute(
        name: AppRoutesPaths.managementSubSections.manageUsers.split('/').last,
        path: AppRoutesPaths.managementSubSections.manageUsers,
        builder: (context, state) => ManageUserPage(),
        routes: [
          SharedRoutes.userProfileRoute(AppRoutesNames.userProfile.inUsersList),
          GoRoute(
            name: AppRoutesNames.managementInternalRoutes.addUser,
            path: AppRoutesPaths.managementInternalRoutes.addUser,
            builder: (context, state) => ActionUserPage(),
          ),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.managementSubSections.managePrivileges
            .split('/')
            .last,
        path: AppRoutesPaths.managementSubSections.managePrivileges,
        builder: (context, state) => LevelsPage(),
        routes: [
          GoRoute(
            name: AppRoutesNames.managementInternalRoutes.privilegesPage,
            path: AppRoutesPaths.managementInternalRoutes.privilegesPage,
            builder: (context, state) {
              final Map extra = state.extra as Map;
              return PrivilegesPage(level: extra['level']);
            },
          ),
        ],
      ),
      GoRoute(
        name: AppRoutesPaths.managementSubSections.manageWithdrawals
            .split('/')
            .last,
        path: AppRoutesPaths.managementSubSections.manageWithdrawals,
        builder: (context, state) => ManageWithdrawalsPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.managementSubSections.manageRejectReasons
            .split('/')
            .last,
        path: AppRoutesPaths.managementSubSections.manageRejectReasons,
        builder: (context, state) => ManageRejectReasonsPage(),
      ),
      GoRoute(
        name: AppRoutesPaths.managementSubSections.products.split('/').last,
        path: AppRoutesPaths.managementSubSections.products,
        builder: (context, state) => ProductView(),
      ),
      GoRoute(
        name:
            AppRoutesPaths.managementSubSections.changeCountry.split('/').last,
        path: AppRoutesPaths.managementSubSections.changeCountry,
        builder: (context, state) => ChangeCountry(),
      ),
      GoRoute(
        name: AppRoutesPaths.managementSubSections.regions.split('/').last,
        path: AppRoutesPaths.managementSubSections.regions,
        builder: (context, state) => RegoinView(),
      ),
      GoRoute(
        name: AppRoutesPaths.managementSubSections.departments.split('/').last,
        path: AppRoutesPaths.managementSubSections.departments,
        builder: (context, state) => ManageView(),
      ),
      GoRoute(
        name: AppRoutesPaths.managementSubSections.withdrawalReasons
            .split('/')
            .last,
        path: AppRoutesPaths.managementSubSections.withdrawalReasons,
        builder: (context, state) => ResoanView(type: 'client'),
      ),
      GoRoute(
        name: AppRoutesPaths.managementSubSections.regionsAndCities
            .split('/')
            .last,
        path: AppRoutesPaths.managementSubSections.regionsAndCities,
        builder: (context, state) => MainCityView(),
      ),
      GoRoute(
        name: AppRoutesPaths.managementSubSections.ticketTypes.split('/').last,
        path: AppRoutesPaths.managementSubSections.ticketTypes,
        builder: (context, state) => ResoanView(type: 'ticket'),
      ),
      GoRoute(
        name:
            AppRoutesPaths.managementSubSections.activityTypes.split('/').last,
        path: AppRoutesPaths.managementSubSections.activityTypes,
        builder: (context, state) => activity_view(type: 'ticket'),
      ),
      GoRoute(
        name: AppRoutesPaths.managementSubSections.branchRace.split('/').last,
        path: AppRoutesPaths.managementSubSections.branchRace,
        builder: (context, state) => BranchRaceManagementView(),
      ),
      GoRoute(
        name: AppRoutesPaths.managementSubSections.advancedConfigs
            .split('/')
            .last,
        path: AppRoutesPaths.managementSubSections.advancedConfigs,
        builder: (context, state) => AdvancedCofigsPage(),
      ),
      GoRoute(
        name:
            AppRoutesPaths.managementSubSections.generalConfigs.split('/').last,
        path: AppRoutesPaths.managementSubSections.generalConfigs,
        builder: (context, state) => GeneralCofigsPage(),
      ),
    ];
  }
}
