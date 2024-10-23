import 'package:crm_smart/features/task_management/presentation/widgets/task_web_widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../manager/task_cubit.dart';
import 'drag_drop_list_header.dart';
import 'drag_drop_list_footer.dart';
import 'empty_list_holder.dart';

class DragDropListBuilder {
  static DragAndDropList build(TaskStatusType status, TaskCubit taskCubit) {
    final statusInfo = taskCubit.taskStatusInfo[status];
    final loadingStatus = statusInfo?.loadingStatus ?? const BlocStatus.initial();

    List<DragAndDropItem> listItems = [];

    if (loadingStatus.isLoading() && (statusInfo?.tasks.isEmpty ?? true)) {
      listItems.add(DragAndDropItem(
        canDrag: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 150),
          child: Center(child: AppLoader()),
        ),
      ));
    } else if (loadingStatus.isFailed() && (statusInfo?.tasks.isEmpty ?? true)) {
      listItems.add(DragAndDropItem(child: Center(child: Text('Error loading tasks'))));
    } else if (statusInfo?.tasks.isEmpty ?? true) {
      listItems.add(EmptyListPlaceholder.build());
    } else {
      listItems.addAll(statusInfo!.tasks.map((task) => TaskCard.build(task)));
    }

    return DragAndDropList(
      canDrag: false,
      header: DragDropListHeader(status: status),
      children: listItems,
      footer: DragDropListFooter(status: status),
    );
  }
}