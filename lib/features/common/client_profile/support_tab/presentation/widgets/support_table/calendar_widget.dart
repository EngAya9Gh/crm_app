import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/model/appointment_model.dart';
import 'package:crm_smart/ui/widgets/user_installation_calendar.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<EventProvider, PageState<List<AppointmentModel>>>(
      selector: (_, eventProvider) => eventProvider.appointmentsState,
      builder: (context, appointmentsState, child) {
        if (appointmentsState.isLoading) {
          return Expanded(child: CustomLoadingIndicator());
        }
        if (appointmentsState.isFailure) {
          return Center(
            child: IconButton(
              onPressed: () => context.read<EventProvider>().getAppointments(),
              icon: Icon(Icons.refresh),
            ),
          );
        }
        return Expanded(child: USerInstallationCalendar());
      },
    );
  }
}
