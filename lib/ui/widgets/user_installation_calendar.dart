import 'dart:collection';

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/model/calendar/event_model.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/widgets/reschedule_dialog.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/utils/app_navigator.dart';
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
    return events?[day] ?? [];
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
        print("events.length ${events.length}");
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
                              color: IsDoneDateEnumExtension.color(
                                  isDone: value[index].isDone),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                // Match ListTile padding
                                child: InkWell(
                                  onTap: () {
                                    _navigateToProfileOnEventTap(value[index]);
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
                                              '${intl.DateFormat("hh:mm a").format(value[index].to)}'
                                              ' - '
                                              '${intl.DateFormat("hh:mm a").format(value[index].from)}',
                                              textDirection: TextDirection.ltr,
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      fontFamily:
                                                          kfontfamily2)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    // تمت الزيارة, إعادة جدولة, إلغاء
                                    StatefulBuilder(
                                      builder: (context, refresh) {
                                        return _isDoneOrCanceled(value, index)
                                            ? SizedBox()
                                            : _dateActionsButtons(context,
                                                value, index, eventProvider);
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

  SizedBox _dateActionsButtons(BuildContext context, List<EventModel> value,
      int index, EventProvider eventProvider) {
    return SizedBox(
        width: 100,
        child: Column(
          children: [
            InkWell(
              child: Text("تمت الزيارة",
                  style: context.textTheme.labelLarge?.copyWith(
                      color: context.theme.primaryColor,
                      fontFamily: kfontfamily2,
                      fontWeight: FontWeight.w600)),
              onTap: () async {
                await _onEventSelected(
                  value[index],
                );
              },
            ),
            const SizedBox(height: 4),
            InkWell(
              child: Text("إعادة جدولة",
                  style: context.textTheme.labelLarge?.copyWith(
                      color: context.theme.primaryColor,
                      fontFamily: kfontfamily2,
                      fontWeight: FontWeight.w600)),
              onTap: () async {
                var tempinvoice;
                var tempEvent = value[index];

                final EventModel? editedEvent = await showDialog<dynamic>(
                    context: context,
                    builder: (context) => ReScheduleDialog(
                          // invoice: tempinvoice,
                          event: tempEvent,
                          idClientsDate: value[index].idClientsDate!,
                          idClient: value[index].fkIdClient!,
                          idinvoice: value[index].idinvoice!,
                          time_from: value[index].from,
                          time_to: value[index].to,
                          datecurrent: value[index].from,
                          typedate: value[index].typedate,
                        ));
                if (editedEvent != null) {
                  _selectedEvents = ValueNotifier(_getEventsForDay(
                      _selectedDay!, eventProvider.eventDataSource));
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 4),
            InkWell(
              child: Text("إلغاء",
                  style: context.textTheme.labelLarge?.copyWith(
                      color: context.theme.primaryColor,
                      fontFamily: kfontfamily2,
                      fontWeight: FontWeight.w600)),
              onTap: () async {
                var status = await showDialog<dynamic>(
                    context: context,
                    builder: (context) => CancelScheduleDialog(
                          idClientsDate: value[index].idClientsDate,
                          event: value[index],
                        ));
                if (status == true) {
                  _selectedEvents = ValueNotifier(_getEventsForDay(
                      _selectedDay!, eventProvider.eventDataSource));
                  setState(() {});
                }
              },
            ),
          ],
        ));
  }

  bool _isDoneOrCanceled(List<EventModel> value, int index) {
    return value[index].isDone == IsDoneDateEnum.done.value ||
        value[index].isDone == IsDoneDateEnum.canceled.value;
  }

  _navigateToProfileOnEventTap(EventModel event) {
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
      return await _onClientEventSelected(event);
    }
  }

  Future<bool?> _onClientEventSelected(EventModel event) async {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _commentController = TextEditingController();
    bool isLoading = false;
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => WillPopScope(
        onWillPop: () => Future.value(true),
        child: SimpleDialog(
          title: Text(
            "إغلاق الجدولة",
            textAlign: TextAlign.center,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          hintText: "أكتب تعليقك هنا",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        maxLines: 3,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "التعليق مطلوب";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      StatefulBuilder(
                        builder: (context, refreshState) {
                          return AppElevatedButton(
                            isLoading: isLoading,
                            text: "حفظ",
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                refreshState(() => isLoading = true);
                                await context
                                    .read<EventProvider>()
                                    .changeEventToDone(
                                      event: event.copyWith(
                                        comment: _commentController.text,
                                      ),
                                      onLoading: () {},
                                      onSuccess: () {},
                                      onFailure: () {},
                                    );
                                context
                                    .read<invoice_vm>()
                                    .updateListInvoiceAfterMarkEventIsDone(
                                        event);
                                refreshState(() => isLoading = false);
                                AppNavigator.pop(result: true);
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
