import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/models/event_model.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../view_model/event_provider.dart';
import '../../../domain/use_cases/cofirm_visit_date_usecase.dart';
import '../../manager/dates_table_cubit.dart';
import '../cancel_event_dialog.dart';
import '../done_client_event_dialog.dart';
import '../reschedule_dialog.dart';

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
    return Column(
      children: [
       if(widget.eventModel.verifiedAt==null) BlocBuilder<DatesTableCubit,DatesTableState>(
          builder: (context, state)   {
            if (state.confirmVisitDateStatus.isLoading()) {
              return SizedBox(
                height: 20,
                width: 20,
                child: AppLoader(),
              );
            }
            return _CustomTextButton(
              text: "تأكيد الموعد",
              onTap: () async {
                await datesTableCubit.confirmVisitDate(ConfirmVisitDateParams(idVisit: widget.eventModel.idClientsDate!),);
              },
            );
          },
        ),
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
            Future.delayed(const Duration(milliseconds: 0), () {
              datesTableCubit.handleEventsMap(
                updatedEvent: editedEvent,
                oldEvent: widget.eventModel,
              );
            });
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
              datesTableCubit.handleEventsMap(
                updatedEvent: editedEvent,
                oldEvent: widget.eventModel,
              );
            }
          },
        ),
      ],
    );
  }

  Future<dynamic> _showDialog({
    required Widget body,
  }) async {
    return await AppConstants.showAppDialog(child: body);
  }
}

class _CustomTextButton extends StatelessWidget {
  const _CustomTextButton({
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      text: text,
      onPressed: onTap,
    );
  }
}
