import 'package:collection/collection.dart';
import 'package:crm_smart/core/config/theme/theme.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/core/utils/responsive_padding.dart';
import 'package:crm_smart/core/utils/search_mixin.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_loader_widget/app_loader.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart' as Intl;

import '../../../app/presentation/widgets/app_bottom_sheet.dart';
import 'add_task_page.dart';
import 'change_status_dialog.dart';
import 'filter_task_sheet.dart';

class TaskManagementListPage extends StatefulWidget {
  const TaskManagementListPage({Key? key}) : super(key: key);

  @override
  State<TaskManagementListPage> createState() => _TaskManagementListPageState();
}

class _TaskManagementListPageState extends State<TaskManagementListPage> with SearchMixin {
  late TaskCubit _taskCubit;

  @override
  void initState() {
    super.initState();
    _taskCubit = GetIt.I<TaskCubit>()..getTasks();
    initSearch();
  }

  @override
  void dispose() {
    disposeSearch();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var backgroundColor = const Color.fromARGB(255, 243, 242, 248);

    return BlocProvider<TaskCubit>(
      create: (context) => _taskCubit,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: SmartCrmAppBar(
          appBarParams: AppBarParams(
            title: 'إدارة المهام',
            action: [
              BlocBuilder<PrivilegeCubit, PrivilegeState>(
                builder: (context, state) {
                  if (GetIt.I<PrivilegeCubit>().checkPrivilege('158'))
                    return AppTextButton(
                      onPressed: () async {
                        final result = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddTaskPage(),
                          ),
                        );
                        if(result == true){
                          _taskCubit.getTasks();
                        }
                      },
                      text: "إضافة مهمة",
                      appButtonStyle: AppButtonStyle.secondary,
                    );
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return state.tasksState.when(
                init: () => Center(child: AppLoader()),
                loading: () => Center(child: AppLoader()),
                loaded: (data) {
                  final tasksList = state.tasksList;
                  return Column(
                    children: [
                      15.verticalSpace,
                      Padding(
                        padding: const EdgeInsets.only(top: 2, left: 8, right: 8, bottom: 2),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 2, left: 8, right: 8, bottom: 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextField(
                                      controller: searchController,
                                      textInputAction: TextInputAction.search,
                                      decoration: InputDecoration(
                                        hintText: 'اسم المؤسسة',
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Tooltip(
                              message: "فلترة",
                              child: InkWell(
                                onTap: () {
                                  AppBottomSheet.show(
                                    context: context,
                                    child: FilterTaskSheet(),
                                  );
                                },
                                borderRadius: BorderRadius.circular(10).r,
                                child: Container(
                                  height: 46,
                                  width: 46,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10).r,
                                  ),
                                  child: Icon(Icons.filter_alt_rounded, color: Colors.grey.shade600, size: 30.r),
                                ),
                              ),
                            ),
                            10.horizontalSpace,
                          ],
                        ),
                      ),
                      15.verticalSpace,
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: context.colorScheme.grey100.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: SizedBox(
                          height: 35.h,
                          child: ListView.separated(
                            padding: HWEdgeInsets.symmetric(horizontal: 20),
                            separatorBuilder: (context, index) => 10.horizontalSpace,
                            itemCount: TaskStatusType.values.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => stageChip(
                              TaskStatusType.values[index],
                              state.selectedStatus == TaskStatusType.values[index],
                            ),
                          ),
                        ),
                      ),
                      10.verticalSpace,
                      Padding(
                        padding: HWEdgeInsetsDirectional.only(start: 20.0, end: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              'عدد المهام: ',
                              style: context.textTheme.bodySmall!.copyWith(color: context.colorScheme.grey500),
                            ),
                            AppText(
                              '${tasksList.length}',
                              style: context.textTheme.bodySmall!.copyWith(color: context.colorScheme.grey800),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: state.tasksList.length,
                          shrinkWrap: true,
                          padding: HWEdgeInsets.only(bottom: 20),
                          separatorBuilder: (context, index) => 15.verticalSpace,
                          itemBuilder: (context, index) {
                            final task = tasksList[index];
                            final assignToUserName = task.assignedToUser!.nameUser;
                            final firstList = assignToUserName?.split(' ').firstOrNull;
                            final secondList = assignToUserName?.split(' ').lastOrNull;
                            String? firstChar = (firstList?.isNotEmpty ?? false) ? firstList?.substring(0, 1) : '';
                            String? secondChar = (secondList?.isNotEmpty ?? false) ? secondList?.substring(0, 1) : '';
                            StringBuffer buffer = StringBuffer();

                            if (firstChar == null) {
                              firstChar = assignToUserName?.substring(0, 1);
                            }
                            if (secondChar == null) {
                              secondChar = assignToUserName?.substring(1, 2);
                            }

                            buffer.writeAll([firstChar, secondChar], '.');

                            final status =
                                TaskStatusType.values.firstWhereOrNull((element) => element.name == task.name);
                            return InkWell(
                              onTap: status != null && status != TaskStatusType.Evaluated
                                  ? () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        barrierLabel: task.id.toString(),
                                        builder: (context) => BlocProvider.value(
                                          value: _taskCubit,
                                          child: ChangeStatusTaskDialog(
                                            status: status,
                                            taskModel: task,
                                          ),
                                        ),
                                      );
                                    }
                                  : null,
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    5.horizontalSpace,
                                    Container(
                                      width: 4,
                                      decoration: BoxDecoration(
                                        color: status?.color,
                                        borderRadius: BorderRadius.circular(5).r,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          10.verticalSpace,
                                          Row(
                                            children: [
                                              20.horizontalSpace,
                                              CircleAvatar(
                                                backgroundColor: context.colorScheme.primary,
                                                child: Center(
                                                  child: AppText(
                                                    buffer.toString(),
                                                    style: context.textTheme.titleMedium!
                                                        .copyWith(color: context.colorScheme.white),
                                                  ),
                                                ),
                                                radius: 22,
                                              ),
                                              10.horizontalSpace,
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    task.title ?? '',
                                                    style: context.textTheme.titleMedium,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        task.assignedByUser!.nameUser.toString(),
                                                        style: context.textTheme.bodySmall!
                                                            .copyWith(color: context.colorScheme.grey500),
                                                      ),
                                                      if ((task.assignedByUser?.nameUser?.isNotEmpty ?? false) &&
                                                          (task.assignedToUser?.nameUser?.isNotEmpty ?? false))
                                                        Text(' --> '),
                                                      Text(
                                                        task.assignedToUser!.nameUser.toString(),
                                                        style: context.textTheme.bodySmall!
                                                            .copyWith(color: context.colorScheme.primary),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          if (task.description?.isNotEmpty ?? false) ...{
                                            10.verticalSpace,
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.only(end: 50, start: 20),
                                                child: AppText(
                                                  task.description ?? '',
                                                  style: context.textTheme.labelSmall!
                                                      .copyWith(color: context.colorScheme.grey600),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          },
                                          10.verticalSpace,
                                          Padding(
                                            padding: HWEdgeInsetsDirectional.only(start: 20.0, end: 20),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    AppText(
                                                      'من فرع: ',
                                                      style: context.textTheme.bodySmall!
                                                          .copyWith(color: context.colorScheme.grey500),
                                                    ),
                                                    AppText(
                                                      '${task.assignedByUser?.nameRegoin}',
                                                      style: context.textTheme.bodySmall!
                                                          .copyWith(color: context.colorScheme.grey800),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    AppText(
                                                      'إلى فرع: ',
                                                      style: context.textTheme.bodySmall!
                                                          .copyWith(color: context.colorScheme.grey500),
                                                    ),
                                                    AppText(
                                                      '${task.assignedToUser?.nameRegoin}',
                                                      style: context.textTheme.bodySmall!
                                                          .copyWith(color: context.colorScheme.grey800),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          5.verticalSpace,
                                          Padding(
                                            padding: HWEdgeInsetsDirectional.only(start: 20.0, end: 20),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    AppText(
                                                      'من قسم: ',
                                                      style: context.textTheme.bodySmall!
                                                          .copyWith(color: context.colorScheme.grey500),
                                                    ),
                                                    AppText(
                                                      '${task.assignedByUser?.nameMange}',
                                                      style: context.textTheme.bodySmall!
                                                          .copyWith(color: context.colorScheme.grey800),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    AppText(
                                                      'إلى قسم: ',
                                                      style: context.textTheme.bodySmall!
                                                          .copyWith(color: context.colorScheme.grey500),
                                                    ),
                                                    AppText(
                                                      '${task.assignedToUser?.nameMange}',
                                                      style: context.textTheme.bodySmall!
                                                          .copyWith(color: context.colorScheme.grey800),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          10.verticalSpace,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              20.horizontalSpace,
                                              Icon(Icons.date_range_rounded,
                                                  size: 15, color: context.colorScheme.grey600),
                                              5.horizontalSpace,
                                              Directionality(
                                                textDirection: TextDirection.ltr,
                                                child: AppText(
                                                  Intl.DateFormat('dd MMM hh:mm a')
                                                      .format(task.dateTimeCreated ?? DateTime.now()),
                                                  style: context.textTheme.labelSmall!
                                                      .copyWith(color: context.colorScheme.grey600),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          10.verticalSpace
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                empty: () => SizedBox(),
                error: (exception) => Center(
                  child: IconButton(
                    onPressed: _taskCubit.getTasks,
                    icon: Icon(Icons.refresh),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  stageChip(TaskStatusType status, bool isActive) {
    return InkWell(
      onTap: () => _taskCubit.onChangeTaskStatus(status),
      child: AnimatedContainer(
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          color: isActive ? context.colorScheme.primary : context.colorScheme.white,
        ),
        alignment: Alignment.center,
        padding: HWEdgeInsets.symmetric(vertical: 5, horizontal: 10),
        duration: const Duration(milliseconds: 300),
        child: AppText(status.text,
            style: context.textTheme.bodyMedium!.m!.copyWith(
              color: isActive ? context.colorScheme.white : context.colorScheme.black,
            )),
      ),
    );
  }

  @override
  void onSearch(String query) {}
}
