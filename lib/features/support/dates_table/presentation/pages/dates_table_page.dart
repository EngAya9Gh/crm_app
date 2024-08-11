import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../model/calendar/event_model.dart';
import '../../../../../view_model/event_provider.dart';
import '../../../../../view_model/maincity_vm.dart';
import '../../../../../view_model/regoin_vm.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../manager/dates_table_cubit.dart';
import '../widgets/dates_table_calendar.dart';
import '../widgets/event_card.dart';
import '../widgets/filter_dates_table_sheet.dart';

class DatesTablePage extends StatefulWidget {
  const DatesTablePage({super.key});

  @override
  State<DatesTablePage> createState() => _DatesTablePageState();
}

class _DatesTablePageState extends State<DatesTablePage> {
  late EventProvider _eventProvider;
  late final DatesTableCubit _cubit;
  late final MainCityProvider mainCityProvider;

  @override
  void initState() {
    super.initState();
    mainCityProvider = context.read<MainCityProvider>();
    _cubit = BlocProvider.of<DatesTableCubit>(context)
      ..init(mainCityProvider.listmaincityfilter)
      ..getSubscribedClients();

    final userProvider = context.read<UserProvider>();
    final regionProvider = context.read<RegionProvider>();
    _eventProvider = context.read<EventProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userProvider.changevalueuser(null, true);
      await userProvider.getAllUsers();
      regionProvider.changeVal(null);

      _eventProvider.fkCountry = userProvider.currentUser.fkCountry!;

      await _cubit.getDateInstallation(
        fkCountry: AppConstants.currentCountry(context)!,
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MainCityProvider>().changeItemsList([], isInit: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context, title: 'جدول التركيب للعملاء'),
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
                  return state.getDateInstallationStatus.when(
                    loading: () => SliverFillRemaining(child: AppLoader()),
                    success: (data) =>
                        SliverToBoxAdapter(child: DatesTableCalendar()),
                    empty: () => SliverFillRemaining(
                      child: CustomErrorWidget(message: 'لا يوجد نتائج'),
                    ),
                    failure: (error, data) => CustomErrorWidget(
                      message: error,
                      onPressed: () => _cubit.getDateInstallation(
                        fkCountry: AppConstants.currentCountry(context)!,
                      ),
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                  child: Divider(thickness: 1, color: kMainColor, height: 1)),
              ValueListenableBuilder<List<EventModel>>(
                valueListenable: _cubit.pageVariables.selectedDayEvents,
                builder: (context, events, child) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return EventCard(
                          events: events,
                          index: index,
                        );
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
