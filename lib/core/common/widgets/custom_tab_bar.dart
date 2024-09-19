import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

TabBar CustomTabBar({
  required TabController tabController,
  List<Widget>? tabBarTabs,
  List<String>? tabBarTabsText = const [],
  Color? labelColor,
  Color? unselectedLabelColor,
  Color? indicatorColor,
}) {
  if (tabBarTabs == null && tabBarTabsText == null) {
    debugPrint('tabBarTabsText: $tabBarTabsText');
    assert(tabBarTabs != null || tabBarTabsText != null);
  }
  return TabBar(
    controller: tabController,
    labelColor: labelColor ?? AppColors.paperCard,
    unselectedLabelColor: unselectedLabelColor ?? AppColors.paperCard,
    labelStyle: AppStyles.textStyle.copyWith(
      fontSize: 18,
      color: AppColors.paperCard,
      fontFamily: AppFonts.fontFamily2,
    ),
    labelPadding: const EdgeInsets.symmetric(horizontal: 6),
    indicatorWeight: 4,
    indicatorColor: indicatorColor ?? AppColors.paperCard,
    indicatorSize: TabBarIndicatorSize.label,
    physics: AlwaysScrollableScrollPhysics(),
    tabs: tabBarTabs ??
        tabBarTabsText!.map((e) {
          return Tab(text: e);
        }).toList(),
  );
}
