import 'package:crm_smart/core/common/extensions/build_context.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/core/common/widgets/app_icon.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/add_comment_task_usecase.dart';
import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:crm_smart/features/task_management/presentation/widgets/dialog_task_detail.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as Intl;

class CommentTabView extends StatelessWidget {
  const CommentTabView({
    super.key,
    required this.textController,
    required this.widget,
  });

  final TextEditingController textController;
  final DialogTaskDetail widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.height,
        Row(
          children: [
            CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.primaryMain,
                child: AppText(
                  context.read<UserProvider>().currentUser.nameUser?.substring(0, 2).toUpperCase(),
                  fontSize: 12,
                )),
            10.width,
            Expanded(
              child: AppTextField(
                hintText: 'اكتب تعليقا',
                controller: textController,
              ),
            ),
            10.width,
            InkWell(
              onTap: () {
                widget.cubit.onAddTaskComment(
                  AddTaskCommentParams(taskId: widget.task.id!, content: textController.text),
                  () {
                    textController.clear();
                  },
                );
              },
              child: BlocSelector<TaskCubit, TaskState, BlocStatus>(
                selector: (state) => state.addComment,
                builder: (context, state) {
                  return CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.primaryMain,
                      child: state.isLoading()
                          ? AppLoader(
                              color: AppColors.white,
                            )
                          : AppIcon(
                              Icons.send,
                              color: AppColors.white,
                            ));
                },
              ),
            )
          ],
        ),
        BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return state.getTaskComment.when(
              empty: () => AppErrorWidget(message: 'لا يوجد تعليقات بعد'),
              success: (data) => Expanded(
                child: ListView.builder(
                  itemCount: data?.length ?? 0,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsetsDirectional.only(top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.primaryMain,
                            child: AppText(
                              data?[index].commentedBy?.nameUser?.substring(0, 2).toUpperCase(),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )),
                        10.width,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                data?[index].commentedBy?.nameUser,
                                fontWeight: FontWeight.bold,
                              ),
                              5.height,
                              AppText(data?[index].content),
                              5.height,
                              AppText(
                                Intl.DateFormat('dd MMM hh:mm a').format(DateTime.tryParse(data?[index].date_comment ?? '') ?? DateTime.now()),
                                color: context.colorScheme.grey600,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              failure: (error, data) => AppErrorWidget(message: error),
            );
          },
        ),
      ],
    );
  }
}
