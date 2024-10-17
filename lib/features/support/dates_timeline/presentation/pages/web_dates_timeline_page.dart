import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

class WebDatesTimelinePage extends StatefulWidget {
  const WebDatesTimelinePage({super.key, this.onInit});

  final VoidCallback? onInit;

  @override
  State<WebDatesTimelinePage> createState() => _WebDatesTimelinePageState();
}

class _WebDatesTimelinePageState extends State<WebDatesTimelinePage> {
  late EventController _eventController;

  @override
  void initState() {
    super.initState();
    _eventController = EventController();
    _loadEvents();
    widget.onInit?.call();
  }

  void _loadEvents() {
    // TODO: Load your events here
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: WeekView(
          controller: _eventController,
          eventTileBuilder: (date, events, boundary, start, end) {
            // TODO: Customize event tile appearance
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  events.first.title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}