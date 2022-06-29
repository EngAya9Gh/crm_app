import 'package:crm_smart/model/calendar/event.dart';
import 'package:crm_smart/ui/screen/calendar/Event_editing_page.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;
  const EventViewingPage({required this.event, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: [
          IconButton(
              onPressed: () {
                //navigator push
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                        EventEditingPage(
                          event: event,
                        )));
                // Get.to(EventEditingPage(
                //   event: event,
                // ));
              },
              icon: Icon(Icons.edit)),

              IconButton(
              onPressed: () {
                final provider =
                    Provider.of<EventProvider>(
                        context, listen: false);
                provider.deleteEvent(event);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>
                        EventEditingPage(
                          event: event,
                        )));
                // Get.to(EventEditingPage(
                //   event: event,
                // ));
              },
              icon: Icon(Icons.delete)),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: [
          //   buildDateTime(event),
          SizedBox(height: 32),
          Text(
            event.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          Text(event.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              )),
        ],
      ),
    );
  }

  Widget buildDateTime() {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'All-day ' : 'FROM', event.from),
        if (!event.isAllDay) buildDate('TO', event.to),
      ],
    );
  }

  Widget buildDate(String title, DateTime? date) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text('$date'),
        ],
      ),
    );
  }
}
