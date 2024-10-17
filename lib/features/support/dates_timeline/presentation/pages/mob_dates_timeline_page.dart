import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart';
import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../dates_table/presentation/widgets/user_drop_down.dart';
import '../manager/dates_timeline_bloc.dart';

class MobDatesTimelinePage extends StatefulWidget {
  const MobDatesTimelinePage({super.key, this.onInit});

  final VoidCallback? onInit;

  @override
  State<MobDatesTimelinePage> createState() => _MobDatesTimelinePageState();
}

class _MobDatesTimelinePageState extends State<MobDatesTimelinePage> {
  late EventController _eventController;
  late final DatesTimelineBloc _datesBloc;

  @override
  void initState() {
    super.initState();
    _datesBloc = context.read<DatesTimelineBloc>();

    _eventController = EventController();
    _loadEvents();
    widget.onInit?.call();
  }

  void _loadEvents() {
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'جدول التوقيت للعملاء',),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          child: Column(
            children: [
              10.height,
              UserDropdown(
                onChanged: (user) {
                  _datesBloc.filterEntity.userNotifier.value = user;
                  // _datesBloc.add(GetTimelineByEmployeeEvent(
                  //     GetTimelineByEmployeeParams(idClient: user.id), onSuccess: (comDetails) {
                  //   final client = widget.client.copyWith(communicationDetails: [comDetails]);
                  //   Navigator.pop(context, client);
                  // }));
                },
              ),
              10.height,
              Expanded(
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
            ],
          ),
        ),
      ),
    );
  }
}