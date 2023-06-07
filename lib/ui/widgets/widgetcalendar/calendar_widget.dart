import 'package:crm_smart/model/calendar/event_data_source.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/task_widget.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:crm_smart/model/calendar/event.dart';

class CalendarWidget extends StatefulWidget {
   CalendarWidget({required this.type,this.clientModel, Key? key}) : super(key: key);
   String type;
   ClientModel? clientModel;
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
    }
  @override void didChangeDependencies() {
    // Future.delayed(Duration(milliseconds: 30)).then((_) async {
    // });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context,listen: true).events;
    return SfCalendar(
      view: CalendarView.month,
      dataSource: EventDataSource(events),
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      onLongPress: (longDetail) {
        final providerlong = Provider.of<EventProvider>(context, listen: false);
        providerlong.setDate(longDetail.date!);
        providerlong.addEvents(
        Event(
        fkIdClient: widget.clientModel?.idClients,
        title:  widget.clientModel!.nameEnterprise.toString(),
        description: 'description',
        from:  longDetail.date!,
        to:    longDetail.date!.add(Duration(hours: 2)),
        idinvoice: null)
        );

      },
      onTap: (details) {

        final provider = Provider.of<EventProvider>(context, listen: false);
        print(details.date!);
        provider.setDate(details.date!);
        print(details.date!);
        showModalBottomSheet(
            context: context, builder: (context) => TaskWidget());
      },
      // onLongPress: (details) {
      //   final provider = Provider.of<EventProvider>(context, listen: false);
      //   provider.setDate(details.date!);
      //   showModalBottomSheet(
      //       context: context, builder: (context) => TaskWidget());
      // },
    );
  }
}
