import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/widgets/support_table/done_client_event_dialog.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/widgets/support_table/reschedule_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../../model/calendar/event_model.dart';
import '../../../../../../ui/widgets/cancel_schedule_dialog.dart';
import '../../../../../../view_model/event_provider.dart';

class DateActionsButtons extends StatefulWidget {
  const DateActionsButtons({
    Key? key,
    required this.eventModel,
    required this.selectedEvents,
    this.selectedDay,
  }) : super(key: key);

  final EventModel eventModel;
  final ValueNotifier<List<EventModel>> selectedEvents;
  final DateTime? selectedDay;

  @override
  State<DateActionsButtons> createState() => _DateActionsButtonsState();
}

class _DateActionsButtonsState extends State<DateActionsButtons> {
  late final EventProvider eventProvider;
  late final EventModel eventModel;
  late final SupportTabCubit supportTabCubit;

  @override
  void initState() {
    eventProvider = context.read<EventProvider>();
    supportTabCubit = BlocProvider.of<SupportTabCubit>(context);
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
                    child: CustomLoadingIndicator(),
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
            const SizedBox(height: 4),
            _CustomTextButton(
              text: "إعادة جدولة",
              onTap: () async {
                EventModel tempEvent = widget.eventModel;

                final EventModel? editedEvent = await _showDialog(
                    body: ReScheduleDialog(
                  event: tempEvent,
                  idClientsDate: widget.eventModel.idClientsDate!,
                  idClient: widget.eventModel.fkIdClient!,
                  idinvoice: widget.eventModel.idinvoice!,
                  time_from: widget.eventModel.from,
                  time_to: widget.eventModel.to,
                  datecurrent: widget.eventModel.from,
                  typedate: widget.eventModel.typedate,
                ));

                if (editedEvent != null) {
                  _refreshEvents(context);
                }
              },
            ),
            const SizedBox(height: 4),
            _CustomTextButton(
              text: "إلغاء",
              onTap: () async {
                final status = await _showDialog(
                  body: CancelScheduleDialog(
                    idClientsDate: widget.eventModel.idClientsDate,
                    event: widget.eventModel,
                  ),
                );

                if (status == true) {
                  _refreshEvents(context);
                }
              },
            ),
          ],
        ));
  }

  void _refreshEvents(BuildContext context) {
    supportTabCubit.getDateInstallation(
      GetDateInstallationParams(
        fkCountry: AppConstants.currentCountry(context)!,
      ),
      onSuccess: (eventsList) {
        eventProvider.handleEventsMap(eventsList);
      },
    );
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
