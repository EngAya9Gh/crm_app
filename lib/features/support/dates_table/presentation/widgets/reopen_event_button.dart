import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../view_model/event_provider.dart';
import '../manager/dates_table_cubit.dart';
import 'reopen_event_dialog.dart';

class ReopenEventButton extends StatefulWidget {
  const ReopenEventButton({
    super.key,
    required this.eventModel,
  });

  final EventModel eventModel;

  @override
  State<ReopenEventButton> createState() => _ReopenEventButtonState();
}

class _ReopenEventButtonState extends State<ReopenEventButton> {
  late final EventProvider eventProvider;
  late final EventModel eventModel;
  late final DatesTableCubit datesTableCubit;

  @override
  void initState() {
    eventProvider = context.read<EventProvider>();
    datesTableCubit = BlocProvider.of<DatesTableCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      width: double.infinity,
      text: "إعادة فتح الزيارة",
      onPressed: () async {
        final EventModel? reOpenedEvent = await _showDialog(
          body: ReopenEventDialog(event: widget.eventModel),
        );

        if (reOpenedEvent != null) {
          datesTableCubit.handleEventsMap(
            updatedEvent: reOpenedEvent,
            oldEvent: widget.eventModel,
          );
        }
      },
      appButtonStyle: AppButtonStyle.secondary,
    );
  }

  Future<dynamic> _showDialog({required Widget body}) async {
    return await AppConstants.showAppDialog(child: body);
  }
}
