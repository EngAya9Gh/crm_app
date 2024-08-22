import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/extensions/build_context.dart';
import '../manager/dates_table_cubit.dart';
import 'add_event_dialog.dart';

const int _ANIMATION_DURATION_MS = 500;

class DatesTableCalendar extends StatefulWidget {
  const DatesTableCalendar({super.key});

  @override
  State<DatesTableCalendar> createState() => _DatesTableCalendarState();
}

class _DatesTableCalendarState extends State<DatesTableCalendar> {
  late final DatesTableCubit _cubit;
  late CalendarFunctions _calendarFunctions;

  @override
  void initState() {
    _cubit = context.read<DatesTableCubit>();
    _calendarFunctions = CalendarFunctions(_cubit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,

      ///
      child: BlocBuilder<DatesTableCubit, DatesTableState>(
        buildWhen: (previous, current) =>
            _listenAndBuildWhen(previous, current),
        builder: (context, state) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: _getCalendarHeight(),
            ),
            child: RepaintBoundary(
              child: ModalProgressHUD(
                inAsyncCall: _isLoading(state),
                progressIndicator: AppLoader(),
                child: TableCalendar<EventModel>(
                  key: UniqueKey(),
                  availableGestures: AvailableGestures.all,
                  /* days */
                  // initial days
                  firstDay: _cubit.pageVariables.firstDay,
                  lastDay: _cubit.pageVariables.lastDay,
                  focusedDay: _cubit.pageVariables.focusedDay,
                  currentDay: DateTime.now(),
                  startingDayOfWeek: StartingDayOfWeek.saturday,
                  weekendDays: [DateTime.friday, DateTime.saturday],
                  sixWeekMonthsEnforced: true,

                  // days actions
                  selectedDayPredicate: _calendarFunctions.selectedDayPredicate,
                  onDaySelected: _calendarFunctions.onDaySelected,
                  onDayLongPressed: _calendarFunctions.onDayLongPressed,

                  /* style and format */
                  // style
                  daysOfWeekHeight: 32.h,
                  calendarStyle: _calendarFunctions.calendarStyle(),
                  headerStyle: _calendarFunctions.headerStyle(),
                  daysOfWeekStyle: _calendarFunctions.daysOfWeekStyle(),
                  // format
                  calendarFormat: _cubit.pageVariables.calendarFormat,
                  formatAnimationCurve: Curves.easeInOut,
                  formatAnimationDuration: const Duration(milliseconds: 500),
                  // format actions
                  onFormatChanged: _calendarFunctions.onFormatChanged,

                  /* page */
                  onPageChanged: _calendarFunctions.onPageChanged,
                  // page animation
                  pageAnimationEnabled: true,
                  pageAnimationCurve: Curves.easeInOut,
                  pageAnimationDuration:
                      Duration(milliseconds: _ANIMATION_DURATION_MS),

                  /* events */
                  eventLoader: _calendarFunctions.eventLoader,
                  calendarBuilders: _calendarFunctions.calendarBuilders(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  double _getCalendarHeight() {
    return switch (_cubit.pageVariables.calendarFormat) {
      CalendarFormat.month => 0.505.sh,
      CalendarFormat.twoWeeks => 0.25.sh,
      CalendarFormat.week => 0.18.sh,
    };
  }

  bool _listenAndBuildWhen(DatesTableState previous, DatesTableState current) {
    return previous.renderEventsStatus != current.renderEventsStatus ||
        (current.getDateInstallationStatus.isLoading() &&
            !_cubit.pageVariables.isNewFilter) ||
        _isRefreshUi(previous, current);
  }

  bool _isRefreshUi(DatesTableState previous, DatesTableState current) =>
      previous.refreshUi != current.refreshUi;

  bool _isLoading(DatesTableState state) {
    return state.renderEventsStatus.isLoading() ||
        (state.getDateInstallationStatus.isLoading() &&
            !_cubit.pageVariables.isNewFilter);
  }
}

class CalendarFunctions {
  final DatesTableCubit datesTableCubit;

  CalendarFunctions(this.datesTableCubit);

  /* actions */
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    datesTableCubit.pageVariables.focusedDay = focusedDay;
    datesTableCubit.pageVariables.selectedDay = selectedDay;
    datesTableCubit.pageVariables.loadEventsForSelectedDay();
    datesTableCubit.refreshUi();
  }

  // on day long pressed
  Future<void> onDayLongPressed(
    DateTime selectedDay,
    DateTime focusedDay,
  ) async {
    await showDialog<void>(
      context: AppNavigator.navigatorKey.currentContext!,
      builder: (context) {
        return AddEventDialog(
          subscribedClients: datesTableCubit.subscribedClients,
          selectedDay: selectedDay,
        );
      },
    );
  }

  void onPageChanged(DateTime focusedDay) {
    Future.delayed(
      Duration(milliseconds: _ANIMATION_DURATION_MS ~/ 3.1),
      () {
        datesTableCubit.pageVariables.selectedDayEvents.value = [];
        datesTableCubit.pageVariables.focusedDay = focusedDay;
        if (datesTableCubit.pageVariables.isMonthLoaded(focusedDay)) return;
        datesTableCubit.loadCalendarData();
        datesTableCubit.getDateInstallation(fkCountry: '1', isNewFilter: false);
      },
    );
  }

  void onFormatChanged(CalendarFormat format) {
    if (datesTableCubit.pageVariables.calendarFormat == format) return;
    datesTableCubit.pageVariables.calendarFormat = format;
    datesTableCubit.refreshUi();
  }

  /* days */
  bool selectedDayPredicate(DateTime day) {
    return isSameDay(datesTableCubit.pageVariables.selectedDay, day);
  }

  /* style and format */
  CalendarStyle calendarStyle() {
    return CalendarStyle(
      markersMaxCount: 5,
      markersAnchor: 0.5,
      markersAlignment: Alignment.bottomCenter,
      markerMargin: EdgeInsets.only(bottom: 1),
      markerSize: 7,
      cellMargin: EdgeInsets.all(10),
      markerDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      selectedDecoration: BoxDecoration(
        color: Colors.indigo.shade200,
        shape: BoxShape.circle,
      ),
      todayDecoration: BoxDecoration(
        color: Colors.teal.shade200,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.green, width: 2),
      ),
      weekendDecoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      holidayDecoration: BoxDecoration(
        color: Colors.red.shade200,
        shape: BoxShape.circle,
      ),
    );
  }

  DaysOfWeekStyle daysOfWeekStyle() {
    return DaysOfWeekStyle(
      weekdayStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      weekendStyle: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  HeaderStyle headerStyle() {
    return HeaderStyle(
      titleCentered: true,
      formatButtonVisible: true,
      formatButtonShowsNext: false,
      headerPadding: EdgeInsets.zero,
      formatButtonDecoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      formatButtonTextStyle: TextStyle(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /* events */
  List<EventModel> eventLoader<EventModel>(day) {
    return (datesTableCubit.pageVariables.eventDataSource[day] ?? [])
        as List<EventModel>;
  }

  /* page */

  /* calendar builders */
  CalendarBuilders<EventModel> calendarBuilders() {
    return CalendarBuilders<EventModel>(
      markerBuilder: (context, day, events) {
        // a horizontal list and a floating button with the number of events
        return Stack(
          children: [
            Positioned(
              bottom: 2,
              left: 0,
              right: 0,
              child: Container(
                height: 7,
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      if (events.isEmpty) return const SizedBox.shrink();
                      final event = events[index];
                      return Container(
                        height: 7,
                        width: 7,
                        margin: const EdgeInsets.symmetric(horizontal: 0.8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: IsDoneDateEnumExtension.color(
                            isDone: event.isDone,
                            opacity: 0.5,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            if (events.isNotEmpty) ...[
              Positioned(
                right: 3,
                top: 3,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  width: 18,
                  height: 18,
                  child: Center(
                    child: Text(
                      '${events.length}',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontSize: 9.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
