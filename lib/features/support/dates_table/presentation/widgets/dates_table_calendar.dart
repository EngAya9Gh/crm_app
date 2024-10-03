import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text.dart';
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
    return SizedBox(
      height: _getCalendarHeight(),
      child: Directionality(
        textDirection: TextDirection.ltr,
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
                    selectedDayPredicate:
                        _calendarFunctions.selectedDayPredicate,
                    onDaySelected: _calendarFunctions.onDaySelected,
                    onDayLongPressed: _calendarFunctions.onDayLongPressed,

                    /* style and format */
                    // style
                    daysOfWeekHeight: 30.scaleHeight,
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
      ),
    );
  }

  double _getCalendarHeight() {
    return switch (_cubit.pageVariables.calendarFormat) {
      CalendarFormat.month => 450.scaleHeight,
      CalendarFormat.twoWeeks => 210.scaleHeight,
      CalendarFormat.week => 155.scaleHeight,
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
        datesTableCubit.getDateInstallation(isNewFilter: false);
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
      weekdayStyle: AppStyles.textStyle.copyWith(
        fontWeight: FontWeight.bold,
      ),
      weekendStyle: AppStyles.textStyle.copyWith(
        color: Colors.red,
        fontSize: 16.scaleFontSize,
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
      formatButtonTextStyle: AppStyles.textStyle.copyWith(
        color: Colors.white,
      ),
      titleTextStyle: AppStyles.textStyle.copyWith(
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
        return SizedBox(
          width: 50.scaleIconsSize,
          height: 50.scaleIconsSize,
          child: Stack(
            children: [
              if (events.isNotEmpty) ...[
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    width: 20.scaleIconsSize,
                    height: 20.scaleIconsSize,
                    child: Center(
                      child: AppText(
                        '${events.length}',
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
      defaultBuilder: (context, day, events) {
        return DayBuilder(
          day: day,
          backgroundColor: Colors.transparent,
          textColor: Colors.black,
        );
      },
      holidayBuilder: (context, day, events) {
        return DayBuilder(
          day: day,
          backgroundColor: Colors.red.shade200,
          textColor: Colors.red,
        );
      },
      selectedBuilder: (context, day, events) {
        return DayBuilder(
          day: day,
          backgroundColor: Colors.indigo.shade200,
          textColor: Colors.white,
        );
      },
      todayBuilder: (context, day, events) {
        return DayBuilder(
          day: day,
          backgroundColor: Colors.teal.shade200,
          textColor: Colors.white,
        );
      },
      disabledBuilder: (context, day, events) {
        return DayBuilder(
          day: day,
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.grey,
        );
      },
      outsideBuilder: (context, day, events) {
        return DayBuilder(
          day: day,
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.grey,
        );
      },
    );
  }
}

class DayBuilder extends StatelessWidget {
  const DayBuilder({
    super.key,
    required this.day,
    required this.backgroundColor,
    this.textColor = Colors.black,
  });

  final DateTime day;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.scaleIconsSize,
      width: 40.scaleIconsSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: AppText(
          '${day.day}',
          color: textColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
