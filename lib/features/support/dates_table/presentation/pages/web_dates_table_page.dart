import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/features/common/regions/presentation/manager/regions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../view_model/event_provider.dart';
import '../../../../../view_model/regoin_vm.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/dates_table_cubit.dart';
import '../widgets/add_event_dialog.dart';
import '../widgets/dates_table_calendar.dart';
import '../widgets/event_card.dart';
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
      appBar: CustomAppBar(title: 'جدول التركيب للعملاء'),
      body: Row(
        children: [
          Flexible(flex: 3, child: _rightSide()),
          Flexible(child: _leftSide()),
        ],
      ),
    );
  }

  Widget _leftSide() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
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
          SliverToBoxAdapter(child: _searchAndFilter(context)),
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

  Widget _rightSide() {
    return ValueListenableBuilder<List<EventModel>>(
      valueListenable: _cubit.pageVariables.selectedDayEvents,
      builder: (context, events, child) {
        return AppPaginatedList(
          items: events,
          itemBuilder: (context, index) {
            return EventCard(event: events[index]);
          },
        );
      },
    );
  }

  Row _searchAndFilter(BuildContext context) {
    return Row(
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
    );
  }
}
