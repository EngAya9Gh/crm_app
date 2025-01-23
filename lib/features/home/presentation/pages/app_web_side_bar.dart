import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/home/presentation/manager/web_home_page_cubit.dart';
import 'package:crm_smart/features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/helpers/helper_functions.dart';
import '../../../../core/common/helpers/selected_sections_handler.dart';
import '../../../../core/common/lists/sections_lists.dart';
import '../../../../core/common/models/sections/section_model.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/config/navigator/app_routes_names.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../ui/widgets/custom_widget/custom_logo.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import 'home_page.dart';

class AppWebSideBar extends StatelessWidget {
  const AppWebSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return _AppWebSideBar(key: Key("AppWebSideBar"));
  }
}

class _AppWebSideBar extends StatefulWidget {
  const _AppWebSideBar({super.key});

  @override
  State<_AppWebSideBar> createState() => _AppWebSideBarState();
}

class _AppWebSideBarState extends State<_AppWebSideBar> {
  late final WebHomePageCubit _cubit;
  final Color customColor = Colors.white;

  @override
  void initState() {
    _cubit = context.read<WebHomePageCubit>();
    // SelectedSectionsHandler.handle();
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
          color: AppColors.fillColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: BlocBuilder<WebHomePageCubit, WebHomePageState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: 10.vertical),
                SliverToBoxAdapter(
                  child: Center(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return InkWell(
                          onTap: (){
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              AppNavigator.go(HomePage(), name: AppRoutesNames.generalRoutes.home);
                            });
                            },
                          child: CustomLogo(
                            logoNumber: 0,
                            height: 100.scaleHeight,
                            width: constraints.maxWidth * 0.9,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: 10.vertical),
                ...SectionsLists.homeSections.mapIndexed(
                  (currentIndex, e) {
                    final selectedIdx =
                        _cubit.sideBarEntity.currentSectionIndex;
                    _cubit.sideBarEntity.expandedTileControllers[selectedIdx]
                        .expand();
                    return SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ExpandedTile(
                          controller: _cubit.sideBarEntity
                              .expandedTileControllers[currentIndex],
                          onTap: () {

                            _cubit.sideBarEntity.currentSectionIndex =
                                currentIndex;
                            _cubit.sideBarEntity.expandedTileControllers
                                .forEachIndexed(
                              (i, element) {
                                if (i != currentIndex) {
                                  element.collapse();
                                } else {
                                  element.expand();
                                }
                              },
                            );
                            _cubit.setSelectedSubSections();
                            if(currentIndex==5)
                             AppNavigator.go(SectionsLists.homeSections[currentIndex].page, name: SectionsLists.homeSections[currentIndex].path);

                          },
                          title: AppText(
                            e.title,
                            style: AppStyles.regular18.copyWith(
                              color: selectedIdx == currentIndex
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                          leading: AppIcon(
                            e.icon ?? Icons.circle,
                            color: _onCardColor(currentIndex),
                          ),
                          trailing: AppIcon(
                            selectedIdx == currentIndex
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_down_outlined,
                            color: _onCardColor(currentIndex),
                          ),
                          trailingRotation: 0,
                          content: Column(
                            children:
                                _prepareChildren(e.subSections, currentIndex),
                          ),
                          contentseparator: 0,
                          expansionAnimationCurve: Curves.easeInOut,
                          theme: ExpandedTileThemeData(
                            headerColor: selectedIdx == currentIndex
                                ? AppColors.primaryMain
                                : AppColors.grey.shade50,
                            contentBackgroundColor: AppColors.grey.shade50,
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
                        ),
                      ),
                    );
                  },
                ).toList(),
                if (context.read<PrivilegesCubit>().checkPrivilege('289')) ...[
                  SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only( top: 10),
                        child: AppTextButton(
                          text: 'الحملات الإعلانية',
                          textStyle: AppStyles.regular18.copyWith(
                            color: AppColors.primaryMain,fontWeight: FontWeight.w600
                          ),
                          onPressed: () async {
                            await HelperFunctions.urlLauncher(
                              'https://test.smartcrm.ws/campaigns',
                              isNewTab: true,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  Color _onCardColor(int index) {
    return _cubit.sideBarEntity.currentSectionIndex == index
        ? AppColors.white
        : AppColors.primaryMain;
  }

  List<Widget> _prepareChildren(
      List<SectionModel> subSections, int sectionIndex) {
    final allowedSubsections = _filterAllowedSections(subSections);

    return allowedSubsections
        .mapIndexed(
          (index, e) => ListTile(
            horizontalTitleGap: 0,
            title: AppText(
              e.title,
              style: AppStyles.regular18.copyWith(
                color: _isSelectedSubSection(index, sectionIndex)
                    ? AppColors.secondaryMain
                    : AppColors.black,
              ),
            ),
            leading: AppIcon(
              Icons.circle,
              color: _isSelectedSubSection(index, sectionIndex)
                  ? AppColors.secondaryMain
                  : AppColors.grey,
              size: 10,
            ),
            selected: _isSelectedSubSection(index, sectionIndex),
            onTap: () {
              _cubit.sideBarEntity.selectedSubSectionIndex = index;
              _cubit.sideBarEntity.selectedSectionIndex = sectionIndex;
              AppNavigator.go(e.page, name: e.path);
              // setState(() {});
            },
          ),
        )
        .toList();
  }

  bool _isSelectedSubSection(int index, int sectionIndex) =>
      _cubit.sideBarEntity.selectedSubSectionIndex == index &&
      _cubit.sideBarEntity.selectedSectionIndex == sectionIndex;

  List<SectionModel> _filterAllowedSections(List<SectionModel> subSections) {
    return subSections.where((e) {
      return context.read<PrivilegesCubit>().checkPrivilege(e.privilegeId);
    }).toList();
  }
}
