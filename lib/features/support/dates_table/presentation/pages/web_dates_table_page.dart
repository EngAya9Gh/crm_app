import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/features/common/client_profile/client_dates_tab/presentation/widgets/date_card.dart';
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
          Flexible(flex: 3, child: _bodySide()),
          Flexible(flex: 2, child: _calendarSide()),
          // AppWebSideBar(),
        ],
      ),
    );
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
                    return DateCard(event: events[index]);
                    // return WebEventCard(event: events[index]);
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
