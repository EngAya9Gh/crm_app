import 'dart:ui';

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import 'package:crm_smart/features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart';
import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as Intl;

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../dates_table/presentation/widgets/user_drop_down.dart';
import '../../data/models/date_timeline_model.dart';
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
    _datesBloc.filterEntity.userNotifier = ValueNotifier(null);
  }


  void _loadEvents() {
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'جدول التوقيت للعملاء',),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child:  BlocConsumer<DatesTimelineBloc, DatesTimelineState>(
          listener: (context, state) {
            if (state.getDatesTimelineStatus.isSuccess()) {
              _updateEvents(state.events);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: Column(
                children: [
                  10.height,
                  UserDropdown(
                    onChanged: (user) {
                      if(user!=null){
                        _datesBloc.filterEntity.userNotifier.value = user;
                          _fetchEvents(state.selectedDate);
                      }
                    },
                  ),
                  10.height,
                  Expanded(
                    child:Stack(
                      children: [
                        DayView(
                          controller: _eventController,
                          initialDay: state.selectedDate,
                          onPageChange: (date, s) {
                            _datesBloc.add(UpdateSelectedDateEvent(date));
                            _fetchEvents(date);
                          },
                          dateStringBuilder: (date, {DateTime? secondaryDate}) {
                            return Intl.DateFormat('EEE, MMM d').format(date);
                          },
                          eventTileBuilder: (date, events, boundary, startTime, endTime) {
                            if (events.isEmpty) return Container();
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
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
                        if (state.getDatesTimelineStatus.isLoading())
                          Positioned.fill(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                              child: Container(
                                color: Colors.white.withOpacity(0.02),
                                child: Center(
                                  child: AppLoader(isExpanded: false,size: 35,),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                ],
              ),
            );
          },
        )
      ),
    );
  }

  Future<void> _fetchEvents(DateTime date) async {
    if (_datesBloc.filterEntity.userNotifier.value != null) {
       _datesBloc.add(GetTimelineByEmployeeEvent(
        GetTimelineByEmployeeParams(
          idClient: _datesBloc.filterEntity.userNotifier.value!.id,
          selectedDate: Intl.DateFormat('yyyy-MM-dd').format(date),
        ),
        onSuccess: (comDetails) {
          // Handle success
        },
      ));
    }else{
      AppSnackbar.showSnakeBar("يرجى اختيار موظف");
    }
  }
  void _updateEvents(List<DateTimelineModel> events) {
    _eventController.removeWhere((_) => true); // Clear all events
    for (var event in events) {
      if(event.startTime!=null){
        _eventController.add(CalendarEventData(
          date: event.startTime!,
          startTime: event.startTime,
          endTime: event.endTime,
          title: event.nameEnterprise??"",
          // Add any other properties you need
        ));
      }

    }
  }
}