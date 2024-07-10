import 'dart:collection';

import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:table_calendar/table_calendar.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/calendar/event_model.dart';
import '../../../../../ui/screen/client/profileclient.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/pages/agent_distributor_profile_page.dart';
import '../manager/dates_table_cubit.dart';
import 'date_actions_buttons.dart';
import 'reopen_event_button.dart';

class USerInstallationCalendar extends StatefulWidget {
  const USerInstallationCalendar({Key? key}) : super(key: key);

  @override
  State<USerInstallationCalendar> createState() =>
      _USerInstallationCalendarState();
}

class _USerInstallationCalendarState extends State<USerInstallationCalendar> {
  late ValueNotifier<List<EventModel>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.disabled;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  late final DatesTableCubit datesTableCubit;
  bool init = true;

  @override
  void initState() {
    super.initState();
    datesTableCubit = BlocProvider.of<DatesTableCubit>(context);
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!, null));
    _firstDay = DateTime.now().subtract(Duration(days: 365));
    _lastDay = DateTime.now().add(Duration(days: 365));
    _initFocusDay();
  }

  void _initFocusDay() {
    _focusedDay = DateTime.now();
    _onDaySelected(_selectedDay!, _focusedDay, datesTableCubit.eventDataSource);
  }

  List<EventModel> _getEventsForDay(
      DateTime day, LinkedHashMap<DateTime, List<EventModel>>? events) {
    if (events == null) {
      return [];
    }
    events.values.forEach((element) {
      element.sort((a, b) => a.from.compareTo(b.from));
    });

    return events[day] ?? [];
  }

  List<EventModel> _getEventsForRange(DateTime start, DateTime end,
      LinkedHashMap<DateTime, List<EventModel>> events) {
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d, events),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay,
      LinkedHashMap<DateTime, List<EventModel>> events) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
    }
    _selectedEvents.value = _getEventsForDay(selectedDay, events);
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay,
      LinkedHashMap<DateTime, List<EventModel>> events) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end, events);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start, events);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end, events);
    }
  }

  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocBuilder<DatesTableCubit, DatesTableState>(
        builder: (context, state) {
          final events = datesTableCubit.eventDataSource;
          _onDaySelected(_selectedDay!, _focusedDay, events);

          return Column(
            children: [
              TableCalendar<EventModel>(
                firstDay: _firstDay,
                lastDay: _lastDay,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                // rangeStartDay: _rangeStart,
                // rangeEndDay: _rangeEnd,
                calendarFormat: _calendarFormat,
                rangeSelectionMode: _rangeSelectionMode,
                holidayPredicate: (day) {
                  return day.weekday == 5;
                },
                // enabledDayPredicate: (day) => day.weekday != 5,
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    if (events.isNotEmpty) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          final event = events[index];
                          return Container(
                            margin: const EdgeInsets.only(
                                top: 47.0), // Adjust spacing as needed
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: IsDoneDateEnumExtension.color(
                                  isDone: event.isDone,
                                  opacity: 0.5,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.5),
                                // child: Text(event.title, style: Theme.of(context).textTheme.bodyText2),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                eventLoader: (day) => _getEventsForDay(day, events),
                startingDayOfWeek: StartingDayOfWeek.saturday,
                availableGestures: AvailableGestures.all,
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  selectedDecoration: BoxDecoration(
                      color: Colors.indigo.shade200, shape: BoxShape.circle),
                  markerDecoration: BoxDecoration(
                      color: Colors.indigo, shape: BoxShape.circle),
                  todayDecoration: BoxDecoration(
                      color: Colors.teal.shade300, shape: BoxShape.circle),
                  isTodayHighlighted: true,
                  markersMaxCount: 10,
                ),

                headerVisible: true,
                onDaySelected: (selectedDay, focusedDay) =>
                    _onDaySelected(selectedDay, focusedDay, events),
                // onRangeSelected: (start, end, focusedDay) => _onRangeSelected(start, end, focusedDay, events),
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              Divider(
                thickness: 1,
                color: kMainColor,
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: ValueListenableBuilder<List<EventModel>>(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return _dateCard(value, index, context);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Directionality _dateCard(
    List<EventModel> value,
    int index,
    BuildContext context,
  ) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 4.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5),
          borderRadius: BorderRadius.circular(12.0),
          color: IsDoneDateEnumExtension.color(isDone: value[index].isDone),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          // Match ListTile padding
          child: InkWell(
            onTap: () {
              _navigateToProfileOnEventTap(value[index]);
            },
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${value[index].title}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontFamily: kfontfamily2)),
                      Text(
                        '${intl.DateFormat("hh:mm a").format(value[index].to)}'
                        ' - '
                        '${intl.DateFormat("hh:mm a").format(value[index].from)}',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontFamily: kfontfamily2),
                      ),
                      if (value[index].nameCityClient != null) ...[
                        Text('${value[index].nameCityClient}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontFamily: kfontfamily2)),
                      ],
                      _showTextIfNotNull(value[index].typeDate, 'النوع:'),
                      _showTextIfNotNull(
                          value[index].nameUserAdd, 'اضاف الجدولة :'),
                      if (!_isOpen(value[index])) ...[
                        _showTextIfNotNull(
                            value[index].nameUserUpdate, 'اغلاق الجدولة :'),
                      ],
                      _showTextIfNotNull(
                          value[index].nameUserClose, 'آخر من قام بالتعديل :'),
                    ],
                  ),
                ),
                if (value[index].isDoneInstall == '1') ...[
                  const SizedBox(width: 16),
                  Icon(
                    // رمز يعبر عن ان العميل تم التركيب له
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                ],
                // تمت الزيارة, إعادة جدولة, إلغاء
                Expanded(
                  flex: _isCanceledDate(value[index]) ? 0 : 1,
                  child: _handleDateActions(value[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isOpen(EventModel value) {
    return value.isDone == IsDoneDateEnum.notVisited.value ||
        value.isDone == IsDoneDateEnum.scheduled.value;
  }

  Widget _handleDateActions(EventModel value) {
    if (_isCanceledDate(value)) {
      return const SizedBox.shrink();
    } else if (_isAllowedAndNotOpen(value)) {
      return ReopenEventButton(eventModel: value);
    } else if (_isOpen(value)) {
      return DateActionsButtons(eventModel: value);
    }
    return const SizedBox.shrink();
  }

  Widget _showTextIfNotNull(String? value, [String title = '']) {
    if (value == null) return SizedBox.shrink();
    if (title.isNotEmpty) title += ' ';
    return RichText(
      text: TextSpan(
        text: title,
        style: context.textTheme.bodyMedium,
        children: [
          TextSpan(
            text: value,
            style: context.textTheme.bodySmall?.copyWith(
              color: kMainColor,
            ),
          ),
        ],
      ),
    );
  }

  bool _isCanceledDate(EventModel event) {
    return event.isDone == IsDoneDateEnum.canceled.value;
  }

  bool _isAllowedAndNotOpen(EventModel event) {
    return !_isOpen(event) &&
        context.read<PrivilegeCubit>().checkPrivilege('197');
  }

  _navigateToProfileOnEventTap(EventModel event) {
    if (event.agentName != null) {
      AppNavigator.push(AgentProfilePage(
        agent: event.agent!,
        tabIndex: 3,
      ));
    } else {
      AppNavigator.push(ProfileClient(
        idClient: event.fkIdClient,
        event: event,
        tabIndex: 2,
      ));
    }
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }
}
