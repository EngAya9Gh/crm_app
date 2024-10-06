import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/home/presentation/manager/web_home_page_cubit.dart';
import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

import '../../../../core/common/helpers/helper_functions.dart';
import '../../../../core/common/lists/sections_lists.dart';
import '../../../../core/common/models/sections/section_model.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../ui/widgets/custom_widget/custom_logo.dart';
import '../../../app/presentation/widgets/app_text_button.dart';

class AppWebSideBar extends StatefulWidget {
  const AppWebSideBar({super.key});

  @override
  State<AppWebSideBar> createState() => _AppWebSideBarState();
}

class _AppWebSideBarState extends State<AppWebSideBar> {
  late final WebHomePageCubit _cubit;
  final Color customColor = Colors.white;

  @override
  void initState() {
    _cubit = context.read<WebHomePageCubit>();
    _cubit.sideBarEntity.initExpandedTileControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      key: Key("AppWebSideBar"),
      textDirection: TextDirection.rtl,
      child: Container(
        width: 350.scaleWidth,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryMain,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: 10.vertical),
            SliverToBoxAdapter(
              child: Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return CustomLogo(
                      logoNumber: 1,
                      height: 100.scaleHeight,
                      width: constraints.maxWidth * 0.9,
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(child: 10.vertical),
            ...SectionsLists.homeSections.mapIndexed(
              (index, e) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BlocBuilder<WebHomePageCubit, WebHomePageState>(
                      builder: (context, state) {
                        return ExpandedTile(
                          controller: _cubit
                              .sideBarEntity.expandedTileControllers[index],
                          onTap: () {
                            _cubit.sideBarEntity.expandedTileControllers
                                .forEachIndexed(
                              (i, element) => element.collapse(),
                            );

                            _cubit.sideBarEntity.selectedSubSectionIndex = -1;
                            if (index ==
                                _cubit.sideBarEntity.selectedSectionIndex) {
                              _cubit.sideBarEntity.selectedSectionIndex = -1;
                              _cubit.sideBarEntity.selectedSubSections = [];
                            } else {
                              _cubit.sideBarEntity.selectedSectionIndex = index;
                              _cubit
                                  .sideBarEntity.expandedTileControllers[index]
                                  .expand();
                              _cubit.sideBarEntity.selectedSubSections =
                                  e.subSections;
                            }

                            setState(() {});
                          },
                          title: AppText(
                            e.title,
                            style: AppStyles.regular18.copyWith(
                              color:
                                  _cubit.sideBarEntity.selectedSectionIndex ==
                                          index
                                      ? AppColors.primaryMain
                                      : AppColors.white,
                            ),
                          ),
                          leading: AppIcon(
                            e.icon ?? Icons.circle,
                            color: _onCardColor(index),
                          ),
                          trailing: AppIcon(
                            _cubit.sideBarEntity.selectedSectionIndex == index
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_down_outlined,
                            color: _onCardColor(index),
                          ),
                          trailingRotation: 0,
                          content: Column(
                            children: _prepareChildren(e.subSections),
                          ),
                          contentseparator: 0,
                          expansionAnimationCurve: Curves.easeInOut,
                          theme: ExpandedTileThemeData(
                            headerColor:
                                _cubit.sideBarEntity.selectedSectionIndex ==
                                        index
                                    ? customColor
                                    : AppColors.primaryMain,
                            contentBackgroundColor:
                                AppColors.primaryAltDark.withOpacity(0.1),
                            fullExpandedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.only(
                              top: 0,
                              bottom: 10,
                              right: 10,
                              left: 10,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ).toList(),
            if (context.read<PrivilegesCubit>().checkPrivilege('289')) ...[
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25, top: 10),
                    child: Row(
                      children: [
                        AppIcon(
                          Icons.circle,
                          size: 25,
                        ),
                        10.width,
                        AppTextButton(
                          text: 'الحملات الإعلانية',
                          textStyle: AppStyles.regular18.copyWith(
                            color: AppColors.white,
                          ),
                          onPressed: () async {
                            await HelperFunctions.urlLauncher(
                              'https://test.smartcrm.ws/campaigns',
                              isNewTab: true,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _onCardColor(int index) {
    return _cubit.sideBarEntity.selectedSectionIndex == index
        ? AppColors.primaryMain
        : AppColors.white;
  }

  List<Widget> _prepareChildren(List<SectionModel> subSections) {
    final allowedSubsections = _filterAllowedSections(subSections);

    return allowedSubsections
        .mapIndexed(
          (index, e) => ListTile(
            horizontalTitleGap: 0,
            title: AppText(
              e.title,
              style: AppStyles.regular18.copyWith(
                color: _cubit.sideBarEntity.selectedSubSectionIndex == index
                    ? AppColors.secondaryMain
                    : AppColors.white,
              ),
            ),
            leading: AppIcon(
              Icons.circle,
              color: _cubit.sideBarEntity.selectedSubSectionIndex == index
                  ? AppColors.secondaryMain
                  : AppColors.white,
              size: 10,
            ),
            selected: _cubit.sideBarEntity.selectedSubSectionIndex == index,
            onTap: () {
              _cubit.sideBarEntity.selectedSubSectionIndex = index;
              AppNavigator.go(e.page, name: e.path);
              setState(() {});
            },
          ),
        )
        .toList();
  }

  List<SectionModel> _filterAllowedSections(List<SectionModel> subSections) {
    return subSections.where((e) {
      return context.read<PrivilegesCubit>().checkPrivilege(e.privilegeId);
    }).toList();
  }
}
