import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/calendar/event_data_source.dart';
import 'package:crm_smart/ui/screen/calendar/event_view_page.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:syncfusion_flutter_core/theme.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectEvent = provider.eventsOfSelectedDate;

    if (selectEvent.isEmpty) {
      return Center(
        child: Text(
          'No Events Found',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      );
    }
    return SfCalendarTheme(
      data: SfCalendarThemeData(
        timeTextStyle: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      child: SfCalendar(
        view: CalendarView.timelineDay,
        dataSource: EventDataSource(provider.events),
        initialDisplayDate: provider.selectDate,
        appointmentBuilder: appointmentBuilder,
        headerHeight: 0,
        todayHighlightColor: kMainColor,
        //selectionDecoration: BoxDecoration(color: kMainColor.withOpacity(0.2),),
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
        ),
        onTap: (details) {
          if (details.appointments == null) return;
          final event = details.appointments!.first;
          print(event.idinvoice);
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=>
                  ProfileClient( idclient: event.fkIdClient,)
                  // EventViewingPage(
                  //   event: event,)
          ));

        },
      ),
    );
  }

  Widget appointmentBuilder(
      BuildContext context, CalendarAppointmentDetails details) {
    print('fdfdsf');
    print( details.bounds.width);
    final event = details.appointments.first;
    return Container(
        width: details.bounds.width,
        height: details.bounds.height,
        decoration: BoxDecoration(
            color: Colors.amberAccent, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            event.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
