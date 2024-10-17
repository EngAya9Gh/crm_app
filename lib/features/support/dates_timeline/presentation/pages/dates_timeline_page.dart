import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import '../../../../../core/common/widgets/app_adaptive_builder.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import 'mob_dates_timeline_page.dart';
import 'web_dates_timeline_page.dart';

class DatesTimelinePage extends StatelessWidget {
  const DatesTimelinePage({super.key, this.onInit});

  final VoidCallback? onInit;

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: AppScaffold(
        body: AppLayoutBuilder(
          smallBuilder: (context) => MobDatesTimelinePage(onInit: onInit),
          largeBuilder: (context) => WebDatesTimelinePage(onInit: onInit),
        ),
      ),
    );
  }
}