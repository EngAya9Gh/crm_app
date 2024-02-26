import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di_container.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../manager/task_cubit.dart';

class ChangeStatusTaskDialog extends StatefulWidget {
  const ChangeStatusTaskDialog(
      {Key? key, required this.status, required this.taskModel})
      : super(key: key);
  final TaskStatusType status;
  final TaskModel taskModel;

  @override
  State<ChangeStatusTaskDialog> createState() => _ChangeStatusTaskDialogState();
}

class _ChangeStatusTaskDialogState extends State<ChangeStatusTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return AlertDialog(
          title: RichText(
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: 'هل تود الموافقة على تحويل المهمة ',
                    style: context.textTheme.bodySmall),
                TextSpan(
                  text: widget.taskModel.title,
                  style: context.textTheme.bodySmall
                      ?.copyWith(color: context.colorScheme.primary),
                ),
                TextSpan(
                    text: 'إلى الحالة ', style: context.textTheme.bodySmall),
                TextSpan(
                  text: widget.status.next.text,
                  style: context.textTheme.bodySmall
                      .withColor(widget.status.next.color),
                ),
              ])),
          actions: [
            if (!state.changeTaskStatus.isLoading())
              AppTextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'إلغاء',
              ),
            AppTextButton(
              onPressed: () {
                getIt<TaskCubit>().onChangeTaskStatusStage(
                  widget.taskModel,
                  widget.status,
                  Navigator.of(context).pop,
                  context.read<UserProvider>().currentUser.idUser!,
                );
              },
              isLoading: state.changeTaskStatus.isLoading(),
              text: 'تأكيد',
              appButtonStyle: AppButtonStyle.secondary,
            ),
          ],
        );
      },
    );
  }
}
