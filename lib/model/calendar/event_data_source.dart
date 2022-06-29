import 'dart:ui';

import 'package:crm_smart/model/calendar/event.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    print('data source');
    // 2022-05-06 02:24:00.000
    //2022-05-13 23:44:00.000
    // print(appointments[0].from);
    // print(appointments[0].to);
    this.appointments = appointments;
  }
  //التخزين بداخلها دياناميك لذلك حولناها الى ايفينت
  Event getEvent(int index) => appointments![index] as Event;

  @override
  DateTime getStartTime(int index) => getEvent(index).from;

  @override
  DateTime getEndTime(int index) => getEvent(index).to;

  @override
  String getSubject(int index) => getEvent(index).title;
  @override
  Color getColor(int index) => getEvent(index).backgroundColor;

  @override
  bool isAllday(int index) => getEvent(index).isAllDay;
}
