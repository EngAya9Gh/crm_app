import 'dart:collection';

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/model/calendar/event_model.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/widgets/reschedule_dialog.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../features/manage_agents_and_distributors/presentation/pages/agent_distributor_profile_page.dart';
import '../../view_model/invoice_vm.dart';
import 'cancel_schedule_dialog.dart';

class USerInstallationCalendar extends StatefulWidget {
  const USerInstallationCalendar({Key? key}) : super(key: key);

  @override
  State<USerInstallationCalendar> createState() =>
      _USerInstallationCalendarState();
}

class _USerInstallationCalendarState extends State<USerInstallationCalendar> {
  late ValueNotifier<List<EventModel>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .disabled; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  late DateTime _firstDay;
  late DateTime _lastDay;
  bool isLoading = false;

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

  List<EventModel> _getEventsForDay(
      DateTime day, LinkedHashMap<DateTime, List<EventModel>>? events) {
    if (events == null) {
      return [];
    }
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
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay, events);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay,
      LinkedHashMap<DateTime, List<EventModel>> events) {
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

  initFocusDay(LinkedHashMap<DateTime, List<EventModel>> events) {
    if (!init) {
      return;
    }

    if (events.entries.isNotEmpty) {
      _focusedDay = events.entries.first.key;
    }
    init = false;
  }

  Color _getMarkerColor(EventModel event) {
    switch (event.isDone) {
      case "1":
        return Colors.green.withOpacity(0.50);
      case "0":
        return Colors.indigo.withOpacity(0.50);

      case "2":
        return Colors.red.withOpacity(0.50);
      case "3":
        return Colors.amber.withOpacity(0.50);
      default:
        return Colors.grey; // Default for unknown status
    }
    //  color: (value[index].isDone =="1")? Colors.green.withOpacity(0.15) :
    //                                  (value[index].isDone =="0")? Colors.indigo.withOpacity(0.15):
    //                                  (value[index].isDone =="2")?Colors.red.withOpacity(0.15):
    //                                  (value[index].isDone =="3")?Colors.blueAccent.withOpacity(0.15):
    //                                  Colors.grey.withOpacity(0.15),
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
                              color: _getMarkerColor(event),
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
                markerDecoration:
                    BoxDecoration(color: Colors.indigo, shape: BoxShape.circle),
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
                              // color: (value[index].isDone ?? false)
                              //     ? Colors.green.withOpacity(0.15)
                              //     : Colors.indigo.withOpacity(0.15),

                              color: (value[index].isDone == "1")
                                  ? Colors.green.withOpacity(0.15)
                                  : (value[index].isDone == "0")
                                      ? Colors.indigo.withOpacity(0.15)
                                      : (value[index].isDone == "2")
                                          ? Colors.red.withOpacity(0.15)
                                          : (value[index].isDone == "3")
                                              ? Colors.amber.withOpacity(0.15)
                                              : Colors.grey.withOpacity(0.15),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 8.0), // Match ListTile padding
                                child: InkWell(
                                  onTap: () {
                                    _navigateToProfile(value[index]);
                                  },
                                  child: Row(children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('${value[index].title}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                      fontFamily:
                                                          kfontfamily2)),
                                          Text(
                                              '${intl.DateFormat("hh:mm a").format(value[index].from)}'
                                              ' - '
                                              '${intl.DateFormat("hh:mm a").format(value[index].to)}',
                                              textDirection: TextDirection.ltr,
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      fontFamily:
                                                          kfontfamily2)),

                                          // Text(
                                          //     value[index].isDone.toString() =="2"?' reschedule':'',
                                          //     style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontFamily: kfontfamily2)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    StatefulBuilder(
                                      builder: (context, refresh) {
                                        if (isLoading) {
                                          return const CustomLoadingIndicator();
                                        }
                                        return (value[index].isDone == "1" ||
                                                value[index].isDone == "2")
                                            ? SizedBox()
                                            : SizedBox(
                                                width: 100,
                                                child: Column(
                                                  children: [
                                                    InkWell(
                                                      child: Text("تمت الزيارة",
                                                          style: context
                                                              .textTheme
                                                              .labelLarge
                                                              ?.copyWith(
                                                                  color: context
                                                                      .theme
                                                                      .primaryColor,
                                                                  fontFamily:
                                                                      kfontfamily2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                      onTap: () async {
                                                        refresh(() {
                                                          isLoading = true;
                                                        });
                                                        await _onEventSelected(
                                                            value[index]);
                                                        refresh(() {
                                                          isLoading = false;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(height: 4),
                                                    InkWell(
                                                      child: Text("إعادة جدولة",
                                                          style: context
                                                              .textTheme
                                                              .labelLarge
                                                              ?.copyWith(
                                                                  color: context
                                                                      .theme
                                                                      .primaryColor,
                                                                  fontFamily:
                                                                      kfontfamily2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                      onTap: () async {
                                                        var tempinvoice;
                                                        var tempEvent =
                                                            value[index];

                                                        var status = await showDialog<
                                                                dynamic>(
                                                            context: context,
                                                            builder: (context) =>
                                                                ReScheduleDialog(
                                                                  // invoice: tempinvoice,
                                                                  event:
                                                                      tempEvent,
                                                                  idClientsDate:
                                                                      value[index]
                                                                          .idClientsDate!,
                                                                  idClient: value[
                                                                          index]
                                                                      .fkIdClient!,
                                                                  idinvoice: value[
                                                                          index]
                                                                      .idinvoice!,
                                                                ));
                                                        if (status == true) {
                                                          _selectedEvents = ValueNotifier(
                                                              _getEventsForDay(
                                                                  _selectedDay!,
                                                                  eventProvider
                                                                      .eventDataSource));
                                                          setState(() {});
                                                        }
                                                      },
                                                    ),
                                                    const SizedBox(height: 4),
                                                    InkWell(
                                                      child: Text("إلغاء",
                                                          style: context
                                                              .textTheme
                                                              .labelLarge
                                                              ?.copyWith(
                                                                  color: context
                                                                      .theme
                                                                      .primaryColor,
                                                                  fontFamily:
                                                                      kfontfamily2,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                      onTap: () async {
                                                        var status = await showDialog<
                                                                dynamic>(
                                                            context: context,
                                                            builder: (context) =>
                                                                CancelScheduleDialog(
                                                                  idClientsDate:
                                                                      value[index]
                                                                          .idClientsDate,
                                                                  event: value[
                                                                      index],
                                                                ));
                                                        if (status == true) {
                                                          _selectedEvents = ValueNotifier(
                                                              _getEventsForDay(
                                                                  _selectedDay!,
                                                                  eventProvider
                                                                      .eventDataSource));
                                                          setState(() {});
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ));
                                      },
                                    ),
                                  ]),
                                ))),
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

  _navigateToProfile(EventModel event) {
    if (event.agentName != null) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => AgentProfilePage(
            agent: event.agent!,
            tabIndex: 3,
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => ProfileClient(
            idClient: event.fkIdClient,
            event: event,
            tabIndex: 2,
          ),
        ),
      );
    }
  }

  _onEventSelected(EventModel event) async {
    if (event.agentName != null) {
      await context.read<EventProvider>().changeEventToDone(
            event: event,
            onLoading: () {},
            onSuccess: () => context
                .read<invoice_vm>()
                .updateListInvoiceAfterMarkEventIsDone(
                  event,
                ),
            onFailure: () {},
          );
    } else {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => ProfileClient(
            idClient: event.fkIdClient,
            event: event,
            tabIndex: 2,
          ),
        ),
      );
    }
  }
}
