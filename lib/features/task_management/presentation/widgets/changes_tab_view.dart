import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/task_management/data/models/task_log_model.dart';
import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as Intl;

class ChangesTabView extends StatelessWidget {
  const ChangesTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TaskCubit, TaskState, BlocStatus<List<TaskLogModel>>>(
      selector: (state) => state.getTaskLog,
      builder: (context, state) {
        return state.when(
          success: (data) => ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2, color: AppColors.primaryMain)),
                                child: CircleAvatar(
                                  backgroundImage: data?[index].imgImage != null ? NetworkImage(data![index].imgImage!) : null,
                                  child: ((data?[index].imgImage == null) && (data?[index].updatedBy?.isNotEmpty ?? false))
                                      ? Center(
                                          child: AppText(data?[index].updatedBy!.substring(0, 3), color: Colors.white, fontSize: 12),
                                        )
                                      : null,
                                  radius: 14.scaleWidth,
                                ),
                              ),
                              5.width,
                              AppText(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                (data?[index].logType ?? ''),
                                color: AppColors.primaryMain,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          )),
                          AppText(
                            Intl.DateFormat('dd MM yyyy hh:mm a').format(data![index].date!),
                            color: AppColors.primaryMain,
                            fontSize: 16.scaleFontSize,
                          ),
                        ],
                      ),
                      10.height,
                      AppText('التغيرات', style: TextStyle(fontWeight: FontWeight.bold)),
                      5.height,
                      ...(data[index].value ?? []).map((e) => AppText(e)).toList(),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: data?.length ?? 0,
          ),
          failure: (error, data) => AppErrorWidget(message: error),
        );
      },
    );
  }
}
