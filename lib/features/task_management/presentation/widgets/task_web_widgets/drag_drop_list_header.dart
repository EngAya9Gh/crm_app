import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/helpers/get_color_by_taskstatus.dart';
import '../../manager/task_cubit.dart';

class DragDropListHeader extends StatelessWidget {
  const DragDropListHeader({required this.status,super.key});

  final TaskStatusType status;
  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<TaskCubit>();
    final tasksCount = _cubit.taskStatusInfo[status]?.tasks.length ?? 0;
    final totalCount = _cubit.taskStatusInfo[status]?.totalCount ?? 0;
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: getColorForStatus(status: status),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  status.text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                ),
                SizedBox(width: 8),
                Text(
                  tasksCount.toString() + "/" + totalCount.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
