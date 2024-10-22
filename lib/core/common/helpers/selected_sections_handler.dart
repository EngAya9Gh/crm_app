import 'package:collection/collection.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/features/home/presentation/manager/web_home_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/navigator/app_routes_paths.dart';
import '../lists/sections_lists.dart';

class SelectedSectionsHandler {
  static void handle({String? name,var pathparam}) {
    name ??= AppRouter.goRouter.routeInformationProvider.value.uri.path
        .split('/')
        .last;
    final int sectionIdx = handleSelectedSection(name,pathparam:pathparam);
    final subsectionIdx = handleSubSelectedSection(name, sectionIdx,pathparam:pathparam);

    renderSelected(sectionIdx, subsectionIdx);
  }

  static int handleSelectedSection(String name,{var pathparam}) {
    final fullPath = AppRoutesPaths.routeFullPathByName(name,pathparam: pathparam);
    final List<String> urlParts = fullPath.split('/');
    if (urlParts.length < 2) return -1;
    final sectionName = urlParts[1];

    int sectionIdx = SectionsLists.homeSections.indexWhere(
      (element) => element.path == "/$sectionName",
    );
    if (sectionIdx == -1) sectionIdx = 0;
    return sectionIdx;
  }

  static int handleSubSelectedSection(String name, int sectionIdx,{var pathparam}) {
    final fullPath = AppRoutesPaths.routeFullPathByName(name,pathparam: pathparam);
    final List<String> urlParts = fullPath.split('/');
    if (urlParts.length < 3) return -1;
    final subSectionName = urlParts[2];

    int subSectionIdx =
        SectionsLists.homeSections[sectionIdx].subSections.indexWhere(
      (element) => element.path.split('/').last == subSectionName,
    );
    if (subSectionIdx == -1) subSectionIdx = -1;

    return subSectionIdx;
  }

  static void renderSelected(int sectionIdx, int subsectionIdx) {
    final _cubit =
        AppNavigator.navigatorKey.currentContext!.read<WebHomePageCubit>();
    _cubit.sideBarEntity.expandedTileControllers.forEachIndexed(
      (index, element) {
        if (index == sectionIdx) {
          element.expand();
        } else {
          element.collapse();
        }
      },
    );
    _cubit.setSelected(
      selectedSectionIdx: sectionIdx,
      selectedSubSectionIdx: subsectionIdx,
    );
  }
}
