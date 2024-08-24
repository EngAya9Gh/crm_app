import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/build_context.dart';
import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../view_model/event_provider.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
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
    return AppTextButton(
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
      textStyle: context.textTheme.labelLarge?.copyWith(
        color: context.theme.primaryColor,
        fontFamily: AppFonts.fontFamily2,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Future<dynamic> _showDialog({required Widget body}) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => body,
    );
  }
}
