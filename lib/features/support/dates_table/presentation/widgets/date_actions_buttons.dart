import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/utils/extensions/build_context.dart';
import '../../../../../model/calendar/event_model.dart';
import '../../../../../view_model/event_provider.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/dates_table_cubit.dart';
import 'cancel_event_dialog.dart';
import 'done_client_event_dialog.dart';
import 'reschedule_dialog.dart';

class DateActionsButtons extends StatefulWidget {
  const DateActionsButtons({
    super.key,
    required this.eventModel,
  });

  final EventModel eventModel;

  @override
  State<DateActionsButtons> createState() => _DateActionsButtonsState();
}

class _DateActionsButtonsState extends State<DateActionsButtons> {
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
    return SizedBox(
        width: 100,
        child: Column(
          children: [
            Consumer<EventProvider>(
              builder: (context, eventProvider, _) {
                if (eventProvider.isloadingDoneEvent) {
                  return SizedBox(
                    height: 20,
                    width: 20,
                    child: AppLoader(),
                  );
                }
                return _CustomTextButton(
                  text: "تمت الزيارة",
                  onTap: () async {
                    _showDialog(
                        body: DoneClientEventDialog(event: widget.eventModel));
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            _CustomTextButton(
              text: "إعادة جدولة",
              onTap: () async {
                final EventModel? editedEvent = await _showDialog(
                  body: ReScheduleDialog(event: widget.eventModel),
                );

                if (editedEvent != null) {
                  datesTableCubit.handleEventsMap(
                    updatedEvent: editedEvent,
                    oldEvent: widget.eventModel,
                  );
                }
              },
            ),
            const SizedBox(height: 10),
            _CustomTextButton(
              text: 'إلغاء',
              onTap: () async {
                final EventModel? editedEvent = await _showDialog(
                  body: CancelEventDialog(
                    event: widget.eventModel,
                  ),
                );

                if (editedEvent != null) {
                  datesTableCubit.handleEventsMap(updatedEvent: editedEvent);
                }
              },
            ),
          ],
        ));
  }

  Future<dynamic> _showDialog({
    required Widget body,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return body;
      },
    );
  }
}

class _CustomTextButton extends StatefulWidget {
  const _CustomTextButton({
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  State<_CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<_CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AppText(
        widget.text,
        style: context.textTheme.labelLarge?.copyWith(
          color: context.theme.primaryColor,
          fontFamily: kfontfamily2,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: widget.onTap,
    );
  }
}
