import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/features/common/regions/presentation/manager/regions_cubit.dart';
import 'package:crm_smart/features/support/dates_timeline/presentation/pages/dates_timeline_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../view_model/event_provider.dart';
import '../../../../../view_model/regoin_vm.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/dates_table_cubit.dart';
import '../widgets/dates_table_calendar.dart';
import '../widgets/event_card/event_card.dart';
import '../widgets/filter_dates_table_sheet.dart';

class MobDatesTablePage extends StatefulWidget {
  const MobDatesTablePage({super.key, this.onInit});

  final VoidCallback? onInit;

  @override
  State<MobDatesTablePage> createState() => _MobDatesTablePageState();
}

class _MobDatesTablePageState extends State<MobDatesTablePage> {
  late EventProvider _eventProvider;
  late final DatesTableCubit _cubit;
  late final RegionsCubit _regionsCubit;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'جدول التركيب للعملاء',
        actions: [
        IconButton(
          icon: Icon(Icons.timeline),
          onPressed: () {
            // Navigate to the dates timeline page
            AppNavigator.go(
              DatesTimelinePage(),
            );
            },
        ),
      ],),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          child: CustomScrollView(
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              overscroll: false,
            ),
            slivers: [
              SliverToBoxAdapter(child: 5.height),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Flexible(
                      child: CustomSearchWidget(
                        hint: "العنوان، الوصف، اسم المؤسسة...",
                        searchController: _cubit.pageVariables.searchController,
                        onChanged: (value) => _cubit.filterEventsLocally(),
                      ),
                    ),
                    CustomFilterIcon(
                      onTap: () async {
                        final value = await AppBottomSheet.show(
                          context: context,
                          child: FilterDatesTableSheet(),
                        );
                        if (value != true) _cubit.returnToPreviousState();
                      },
                    ),
                    8.width,
                  ],
                ),
              ),
              SliverToBoxAdapter(child: 5.height),
              BlocBuilder<DatesTableCubit, DatesTableState>(
                buildWhen: (previous, current) {
                  return previous.getDateInstallationStatus !=
                          current.getDateInstallationStatus &&
                      _cubit.pageVariables.isNewFilter;
                },
                builder: (context, state) {
                  if (state.getDateInstallationStatus.isLoading()) {
                    SliverFillRemaining(child: AppLoader());
                  } else if (state.getDateInstallationStatus.isFailed()) {
                    return  SliverToBoxAdapter(
                        child: AppErrorWidget(
                          message: state.getDateInstallationStatus.error,
                          onPressed: () => _cubit.getDateInstallation(),
                        ));
                  }
                  return SliverToBoxAdapter(child: DatesTableCalendar());
                },
              ),
              SliverToBoxAdapter(
                  child: Divider(
                      thickness: 1, color: AppColors.primaryMain, height: 1)),
              ValueListenableBuilder<List<EventModel>>(
                valueListenable: _cubit.pageVariables.selectedDayEvents,
                builder: (context, events, child) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return EventCard(event: events[index]);
                      },
                      childCount: events.length,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
