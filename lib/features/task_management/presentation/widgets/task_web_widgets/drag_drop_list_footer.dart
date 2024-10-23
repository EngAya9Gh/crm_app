import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/helpers/get_color_by_taskstatus.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../manager/task_cubit.dart';

class DragDropListFooter extends StatelessWidget {
  const DragDropListFooter({required this.status,super.key});

  final TaskStatusType status;
  @override
  Widget build(BuildContext context) {
    final statusInfo =  context.read<TaskCubit>().taskStatusInfo[status];
    if(statusInfo==null){
      return SizedBox.shrink();
    }

    final loadingStatus = statusInfo.loadingStatus;
    final hasReachedEnd = statusInfo.hasReachedEnd;
    if (loadingStatus.isLoading() && !hasReachedEnd && statusInfo.tasks.isNotEmpty) {
      return Center(child: AppLoader());
    }

    // if (!hasReachedEnd && statusInfo.tasks.isNotEmpty ) {
    //   return InkWell(
    //     onTap: () =>  context.read<TaskCubit>().loadMoreTasksForStatus(status),
    //     child: Container(
    //       padding: EdgeInsets.all(8),
    //       alignment: Alignment.center,
    //       child: Text('Load More',style: TextStyle(fontSize: 16),),
    //     ),
    //   );
    // }

    return SizedBox.shrink();
  }
}
