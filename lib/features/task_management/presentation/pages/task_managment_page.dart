
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:crm_smart/features/task_management/presentation/pages/ueser_report.dart';
import 'package:crm_smart/features/task_management/presentation/widgets/task_web_widgets/drag_drop_list_footer.dart';

import 'package:intl/intl.dart' as Intl;
import '../../../../core/common/helpers/get_color_by_taskstatus.dart';
import '../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../app/presentation/widgets/smart_crm_app_bar/smart_crm_appbar.dart';
import '../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';

import 'package:crm_smart/features/task_management/presentation/manager/task_cubit.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/di/di_container.dart';
import '../widgets/task_web_widgets/drag_drop_list.dart';
import '../widgets/task_web_widgets/drag_drop_list_header.dart';
import 'add_task_page.dart';

class TaskManagementPage extends StatefulWidget {
  const TaskManagementPage({Key? key}) : super(key: key);

  @override
  State<TaskManagementPage> createState() => _TaskManagementPageState();
}

class _TaskManagementPageState extends State<TaskManagementPage> {

  late TaskCubit _taskCubit;
  // String? regionId;
  // String? departmentId;
  // String? userId;

  @override
  void initState() {
    super.initState();
    _taskCubit = getIt<TaskCubit>()..init();
    // final currentUser = AppConstants.currentUser;
    // final privilegesCubit = context.read<PrivilegesCubit>();

    // String? departmentId = privilegesCubit.checkPrivilege('161')
    //     ? '2'
    //     : privilegesCubit.checkPrivilege('160')
    //     ? null
    //     : privilegesCubit.checkPrivilege('159')
    //     ? currentUser.typeAdministration
    //     : null;
    // String? regionId = privilegesCubit.checkPrivilege('161')
    //     ? null
    //     : privilegesCubit.checkPrivilege('162')
    //     ? currentUser.fkRegoin
    //     : null;
    // String? userId = privilegesCubit.checkPrivilege('163') ? currentUser.idUser : null;

    // _taskCubit
    //   ..onChangeMyDepartment(departmentId)
    //   ..onChangeMyBranch(regionId)
    //   ..onChangeMyTasks(userId);
    // _taskCubit.getTasks();
    _taskCubit.loadInitialData();

  }

  @override
  void dispose() {
    // print('TaskManagementPage dispose');
    // _taskCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var backgroundColor = const Color.fromARGB(255, 243, 242, 248);
    return BlocProvider.value(
      value: _taskCubit,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: SmartCrmAppBar(
          appBarParams: AppBarParams(
            title: 'إدارة المهام',
            action: [
              BlocBuilder<PrivilegesCubit, PrivilegesState>(
                builder: (context, state) {
                  if (getIt<PrivilegesCubit>().checkPrivilege('158'))
                    return AppTextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddTaskPage(),
                          ),
                        );
                      },
                      text: "إضافة مهمة",
                      appButtonStyle: AppButtonStyle.secondary,
                    );
                  return SizedBox.shrink();
                },
              ),
              AppTextButton(
                child: AppText("تقارير\nالموظفين",textAlign: TextAlign.center,color: AppColors.primaryMain,),
                onPressed: () async {
                  final result = await AppNavigator.go(
                    TaskUsersReportsPage(),
                    isNew: false,
                  );
                  if (result == true) _taskCubit.getTasks();
                },
                appButtonStyle: AppButtonStyle.secondary,
              )
            ],
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: NotificationListener<ScrollNotification>(
            onNotification: _handleScrollNotification,
            child: BlocConsumer<TaskCubit, TaskState>(
              listener: (context, state) {
                // Add this listener to debug
                print("TaskState changed: ${state.getTasksStatus}");
              },
              builder: (context, state) {
                return DragAndDropLists(
                  axis: Axis.horizontal,
                  listWidth: MediaQuery.of(context).size.width * 0.2,
                  listDraggingWidth: MediaQuery.of(context).size.width * 0.2,
                  onItemReorder: _onItemReorder,
                  onListReorder: (int oldListIndex, int newListIndex){},
                  listPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  itemDecorationWhileDragging: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  listInnerDecoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  lastItemTargetHeight: 8,
                  addLastItemTargetHeightToTop: true,
                  lastListTargetSize: 40,
                  listDragHandle: const DragHandle(
                    verticalAlignment: DragHandleVerticalAlignment.top,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.menu,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  itemDragHandle: const DragHandle(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.menu,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  children: TaskStatusType.values.map((status) =>
                      DragDropListBuilder.build(status, _taskCubit,context)
                  ).toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }


  void _onItemReorder(int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    if (oldListIndex != newListIndex) {
      final TaskStatusType oldStatus = TaskStatusType.values[oldListIndex];
      final TaskStatusType newStatus = TaskStatusType.values[newListIndex];
      final TaskModel movedTask = _taskCubit.taskStatusInfo[oldStatus]!.tasks[oldItemIndex];

      setState(() {
        _taskCubit.taskStatusInfo[oldStatus]!.tasks.removeAt(oldItemIndex);
        _taskCubit.taskStatusInfo[newStatus]!.tasks.insert(newItemIndex, movedTask);
      });

      _taskCubit.onChangeTaskStatusStage(
        movedTask,
        newStatus,
            () {
          // Refresh the lists after successful update
          setState(() {});
        },
        context.read<UserProvider>().currentUser.idUser!,false
      );
    }
  }
  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      final metrics = notification.metrics;
      if (metrics.extentAfter == 0) {
        _loadMoreTasks();
      }
    }
    return false;
  }

  void _loadMoreTasks() {
    TaskStatusType.values.forEach((status) {
      final statusInfo = _taskCubit.taskStatusInfo[status];
      if (!(statusInfo?.hasReachedEnd ?? true) &&
          !(statusInfo?.loadingStatus.isLoading() ?? false) && (statusInfo?.tasks.isNotEmpty ?? false)) {
        _taskCubit.loadMoreTasksForStatus(status);
      }
    });
  }


}