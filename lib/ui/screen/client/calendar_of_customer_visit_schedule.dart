import 'dart:collection';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart' as intl;
import '../../../constants.dart';
import '../../../model/calendar/event.dart';

class CalendarOfCustomerVisitSchedule extends StatefulWidget {
  const CalendarOfCustomerVisitSchedule({Key? key}) : super(key: key);

  @override
  State<CalendarOfCustomerVisitSchedule> createState() => _CalendarOfCustomerVisitScheduleState();
}

class _CalendarOfCustomerVisitScheduleState extends State<CalendarOfCustomerVisitSchedule> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  late DateTime _firstDay;
  late DateTime _lastDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!, null));
    _firstDay = DateTime.now().subtract(Duration(days: 365));
    _lastDay = DateTime.now().add(Duration(days: 365));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day, LinkedHashMap<DateTime, List<Event>>? events) {
    if (events == null) {
      return [];
    }
    return events[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end, LinkedHashMap<DateTime, List<Event>> events) {
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d, events),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay, LinkedHashMap<DateTime, List<Event>> events) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay, events);
    }
  }

  void _onRangeSelected(
      DateTime? start, DateTime? end, DateTime focusedDay, LinkedHashMap<DateTime, List<Event>> events) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
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

  bool init = true;

  initFocusDay(LinkedHashMap<DateTime, List<Event>> events) {
    if (!init) {
      return;
    }

    if (events.entries.isNotEmpty) {
      _focusedDay = events.entries.first.key;
    }
    init = false;
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
      child: Consumer<EventProvider>(builder: (context, eventProvider, _) {
        final events = eventProvider.eventDataSource;
        initFocusDay(events);

        return Column(
          children: [
            TableCalendar<Event>(
              firstDay: _firstDay,
              lastDay: _lastDay,
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              calendarFormat: _calendarFormat,
              rangeSelectionMode: _rangeSelectionMode,
              holidayPredicate: (day) {
                return day.weekday == 5;
              },
              enabledDayPredicate: (day) => day.weekday != 5,
              eventLoader: (day) => _getEventsForDay(day, events),
              startingDayOfWeek: StartingDayOfWeek.saturday,
              availableGestures: AvailableGestures.all,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                selectedDecoration: BoxDecoration(color: Colors.indigo.shade200, shape: BoxShape.circle),
                markerDecoration: BoxDecoration(color: Colors.indigo, shape: BoxShape.circle),
                markersMaxCount: 10,
              ),
              headerVisible: true,
              onDaySelected: (selectedDay, focusedDay) => _onDaySelected(selectedDay, focusedDay, events),
              onRangeSelected: (start, end, focusedDay) => _onRangeSelected(start, end, focusedDay, events),
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
            const SizedBox(height: 8.0),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
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
                            color: (value[index].isDone ?? false)
                                ? Colors.green.withOpacity(0.15)
                                : Colors.indigo.withOpacity(0.15),
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileClient(idClient: value[index].fkIdClient)));
                            },
                            title: Text('${value[index].title}',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontFamily: kfontfamily2)),
                            subtitle: Text(
                                '${intl.DateFormat("hh:mm a").format(value[index].from)}'
                                ' - '
                                '${intl.DateFormat("hh:mm a").format(value[index].to)}',
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.end,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: kfontfamily2)),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
