import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/features/common/regions/presentation/manager/regions_cubit.dart';
import 'package:crm_smart/features/home/presentation/pages/app_web_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/lists/sections_lists.dart';
import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/models/sections/section_model.dart';
import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../ui/widgets/custom_widget/custom_logo.dart';
import '../../../../../view_model/event_provider.dart';
import '../../../../../view_model/regoin_vm.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/dates_table_cubit.dart';
import '../widgets/add_event_dialog.dart';
import '../widgets/dates_table_calendar.dart';
import '../widgets/event_card/web_event_card.dart';
import '../widgets/filter_dates_table_sheet.dart';

class WebDatesTablePage extends StatefulWidget {
  const WebDatesTablePage({super.key, this.onInit});

  final VoidCallback? onInit;

  @override
  State<WebDatesTablePage> createState() => _WebDatesTablePageState();
}

class _WebDatesTablePageState extends State<WebDatesTablePage> {
  late EventProvider _eventProvider;
  late final DatesTableCubit _cubit;
  late final RegionsCubit _regionsCubit;

  List<SectionModel> selectedSubSections = SectionsLists.salesSections;
  int selectedSectionIndex = 0;
  int selectedSubSectionIndex = -1;
  List<ExpandedTileController> expandedTileControllers = [];

  @override
  void initState() {
    super.initState();
    expandedTileControllers = List.generate(
      SectionsLists.homeSections.length,
      (index) => ExpandedTileController(isExpanded: index == 0),
    );

    _regionsCubit = context.read<RegionsCubit>();
    _eventProvider = context.read<EventProvider>();
    final userProvider = context.read<UserProvider>();
    final regionProvider = context.read<RegionProvider>();

    widget.onInit?.call();

    _cubit = BlocProvider.of<DatesTableCubit>(context)
      ..init()
      ..getSubscribedClients();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _cubit.setAllCities(cities: _regionsCubit.regionsList);
      userProvider.changevalueuser(null, true);
      await userProvider.getAllUsers();
      regionProvider.changeVal(null);

      _eventProvider.fkCountry = userProvider.currentUser.fkCountry!;

      await _cubit.getDateInstallation();
    });
  }

  final Color customColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      // appBar: CustomAppBar(title: 'جدول التركيب للعملاء'),
      body: Row(
        children: [
          Flexible(flex: 2, child: _calendarSide()),
          Flexible(flex: 3, child: _bodySide()),
          // AppWebSideBar(),
        ],
      ),
    );
  }

  Container _sideBar(BuildContext context) {
    return Container(
      width: 350.scaleWidth,
      height: double.infinity,
      decoration: BoxDecoration(
        color: customColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: 10.vertical),
            SliverToBoxAdapter(
              child: Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return CustomLogo(
                      logoNumber: 0,
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
                    child: ExpandedTile(
                      controller: expandedTileControllers[index],
                      onTap: () {
                        expandedTileControllers.forEachIndexed(
                          (i, element) => element.collapse(),
                        );

                        selectedSubSectionIndex = -1;
                        if (index == selectedSectionIndex) {
                          selectedSectionIndex = -1;
                          selectedSubSections = [];
                        } else {
                          selectedSectionIndex = index;
                          expandedTileControllers[index].expand();
                          selectedSubSections = e.subSections;
                        }

                        setState(() {});
                      },
                      title: AppText(
                        e.title,
                        style: AppStyles.regular18.copyWith(
                          color: selectedSectionIndex == index
                              ? AppColors.white
                              : AppColors.grey,
                        ),
                      ),
                      leading: AppIcon(
                        e.icon ?? Icons.circle,
                        color: _onCardColor(index),
                      ),
                      trailing: AppIcon(
                        selectedSectionIndex == index
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
                        headerColor: selectedSectionIndex == index
                            ? AppColors.primaryMain
                            : customColor,
                        contentBackgroundColor: Colors.grey.shade100,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AppTextButton(
                    text: 'الحملات الإعلانية',
                    textStyle: AppStyles.regular20.copyWith(
                      color: AppColors.primaryMain,
                      fontWeight: FontWeight.bold,
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
            ],
          ],
        ),
      ),
    );
  }

  Color _onCardColor(int index) {
    return selectedSectionIndex == index ? AppColors.white : Colors.grey;
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
                color: selectedSubSectionIndex == index
                    ? AppColors.secondaryMain
                    : AppColors.textPrimary,
              ),
            ),
            leading: AppIcon(
              Icons.circle,
              color: selectedSubSectionIndex == index
                  ? AppColors.secondaryMain
                  : AppColors.secondaryMain,
              size: 15,
            ),
            selected: selectedSubSectionIndex == index,
            onTap: () {
              selectedSubSectionIndex = index;
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

  Widget _bodySide() {
    return ValueListenableBuilder<List<EventModel>>(
      valueListenable: _cubit.pageVariables.selectedDayEvents,
      builder: (context, events, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _searchAndFilter(context),
              20.height,
              Expanded(
                child: AppPaginatedList(
                  items: events,
                  itemBuilder: (context, index) {
                    return WebEventCard(event: events[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _calendarSide() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
              child: AppElevatedButton(
            width: double.infinity,
            text: "إضافة موعد جديد",
            onPressed: () async {
              await showDialog<void>(
                context: AppNavigator.navigatorKey.currentContext!,
                builder: (context) {
                  return AddEventDialog(
                    subscribedClients: _cubit.subscribedClients,
                    selectedDay: _cubit.pageVariables.selectedDay,
                  );
                },
              );
            },
          )),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: BlocBuilder<DatesTableCubit, DatesTableState>(
              buildWhen: (previous, current) {
                return previous.getDateInstallationStatus !=
                        current.getDateInstallationStatus &&
                    _cubit.pageVariables.isNewFilter;
              },
              builder: (context, state) {
                if (state.getDateInstallationStatus.isLoading()) {
                  return AppLoader();
                } else if (state.getDateInstallationStatus.isFailed()) {
                  return AppErrorWidget(
                    message: state.getDateInstallationStatus.error,
                    onPressed: () => _cubit.getDateInstallation(),
                  );
                }
                return DatesTableCalendar();
              },
            ),
          ),
          SliverToBoxAdapter(
            child:
                Divider(thickness: 1, color: AppColors.primaryMain, height: 1),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                5.height,
                Wrap(
                  children: [
                    _colorDescription(
                      text: 'جديد',
                      color: Colors.indigo,
                    ),
                    _colorDescription(
                      text: 'تم التركيب',
                      color: Colors.green,
                    ),
                  ],
                ),
                5.height,
                Wrap(
                  children: [
                    _colorDescription(
                        text: 'معاد جدولتها', color: Colors.orange),
                    _colorDescription(text: 'ملغية', color: Colors.red),
                  ],
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
        ],
      ),
    );
  }

  Widget _searchAndFilter(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          Flexible(
            child: CustomSearchWidget(
              hint: "العنوان، الوصف، اسم المؤسسة...",
              searchController: _cubit.pageVariables.searchController,
              onChanged: (value) => _cubit.filterEventsLocally(),
              margin: EdgeInsets.zero,
            ),
          ),
          5.width,
          CustomFilterIcon(
            onTap: () async {
              final value = await AppBottomSheet.show(
                context: context,
                child: FilterDatesTableSheet(),
              );
              if (value != true) _cubit.returnToPreviousState();
            },
          ),
        ],
      ),
    );
  }

  Widget _colorDescription({
    required String text,
    required Color color,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth * 0.4,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Container(
                  color: color,
                  width: 15.scaleIconsSize,
                  height: 15.scaleIconsSize,
                ),
                5.width,
                AppText(text, fontWeight: FontWeight.bold),
              ],
            ),
          ),
        );
      },
    );
  }
}
