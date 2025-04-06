import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/scroll_to_find_item.dart';
import 'package:crm_smart/core/common/models/location/branch_model.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/common/client_profile/client_dates_tab/presentation/widgets/task_card_new.dart';
import 'package:crm_smart/features/mangement/manage_users/presentation/manager/users_cubit.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/change_task_assign_usecase.dart';
import 'package:crm_smart/features/task_management/domain/use_cases/get_task_by_id_usecase.dart';
import 'package:crm_smart/features/task_management/presentation/pages/add_task_page.dart';
import 'package:crm_smart/features/task_management/presentation/widgets/task_web_widgets/task_card_web.dart';
import 'package:crm_smart/model/managmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/ui/screen/client/client_profile.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as Intl;
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../../core/common/extensions/build_context.dart';
import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/config/theme/theme.dart';
import '../../../../core/utils/end_points.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../manager/task_cubit.dart';
import 'dialog_task_detail.dart';

class TasksPaginatedList extends StatefulWidget {
  const TasksPaginatedList({
    super.key,
    this.idTask,
    this.idStatus,
  });
  final String? idTask;
  final String? idStatus;
  @override
  State<TasksPaginatedList> createState() => _TasksPaginatedListState();
}

ValueNotifier<AssignedTypeNew?> selectedTypeAssign = ValueNotifier(null);
ValueNotifier assign = ValueNotifier(null);

class _TasksPaginatedListState extends State<TasksPaginatedList> {
  late final TaskCubit _cubit;
  final listColors = [
    AppColors.primaryMain,
    AppColors.primaryAltLight,
    AppColors.primaryAltDark,
    AppColors.secondaryMain,
    AppColors.secondaryAltLight,
    AppColors.secondaryAltDark,
    AppColors.green,
  ];
  final GlobalKey _targetKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  late final AutoScrollController controller;
  @override
  void initState() {
    _cubit = context.read<TaskCubit>();
    controller = AutoScrollController(
        //add this for advanced viewport boundary. e.g. SafeArea
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),

        //choose vertical/horizontal
        axis: Axis.vertical,

        //this given value will bring the scroll offset to the nearest position in fixed row height case.
        //for variable row height case, you can still set the average height, it will try to get to the relatively closer offset
        //and then start searching.
        suggestedRowHeight: 200);
    if (widget.idTask != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _findAndScrollToItem(widget.idTask!);
      });
    }
    ;
    super.initState();
  }

  Future<void> _findAndScrollToItem(String targetId) async {
    // Keep loading pages and scrolling until we find the item
    try {
      print('Starting scroll to item: $targetId');

      // Wait for initial data load with timeout
      int attempts = 0;
      while (_cubit.pageVariables.allList.isEmpty && attempts < 20) {
        await Future.delayed(Duration(milliseconds: 100));
        attempts++;
      }

      if (_cubit.pageVariables.allList.isEmpty) {
        print('Failed to load initial data after $attempts attempts');
        return;
      }

      // Keep loading pages and scrolling until we find the item
      bool found = false;
      int pageLoadAttempts = 0;

      while (!found &&
          !(_cubit.pageVariables.hasReachedEnd &&
              _cubit.pageVariables.allList.length > 15) &&
          pageLoadAttempts < 10) {
        found = _cubit.pageVariables.allList.any(
          (element) => element.id.toString() == widget.idTask,
        );

        print('Searching for item. Found: $found, Page: $pageLoadAttempts');

        if (!found) {
          try {
            if (controller.hasClients) {
              final currentPosition = controller.position.maxScrollExtent;
              await controller.animateTo(
                currentPosition,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              print('ScrollController has no clients');
              await Future.delayed(Duration(milliseconds: 200));
              continue;
            }

            // Load next page
            _cubit.getTasks(isNewFilter: false);
            //     // Wait for load to complete
            await Future.delayed(Duration(milliseconds: 500));
            //
            await Future.delayed(Duration(milliseconds: 800));
            pageLoadAttempts++;
          } catch (scrollError) {
            print('Error during scroll: $scrollError');
            await Future.delayed(Duration(milliseconds: 200));
          }
        }
      }

      if (found) {
        print('Item found, attempting to scroll to position');

        final index = _cubit.pageVariables.allList.indexWhere(
          (element) => element.id.toString() == widget.idTask,
        );

        if (index != -1 && controller.hasClients) {
          for (int i = 0; i < 3; i++) {
            try {
              // final itemPosition = index * itemHeight;
              // await scrollController.animateTo(
              // itemPosition,
              // duration: Duration(milliseconds: 500),
              // curve: Curves.easeInOut,
              // );
              print(
                  'Successfully scrolled to position ${controller.isIndexStateInLayoutRange(index)}');
              await controller
                  .scrollToIndex(index,
                      preferPosition: AutoScrollPosition.begin)
                  .then(
                (value) {
                  _isHighlighted.value = true;
                  Future.delayed(Duration(seconds: 2)).then(
                    (value) {
                      _isHighlighted.value = false;
                    },
                  );
                },
              );
              break;
            } catch (scrollError) {
              print('Scroll attempt $i failed: $scrollError');
              await Future.delayed(Duration(milliseconds: 200));
            }
          }
        } else {
          print('Invalid index ($index) or scroll controller not ready');
        }
      } else {
        print('Item not found after $pageLoadAttempts page loads');
      }
    } catch (e, stackTrace) {
      print('Error in scrollToItem: $e');
      print('Stack trace: $stackTrace');
    }
    // await ScrollHelper.scrollToItem(
    //   scrollController: _scrollController,
    //   targetId: targetId,

    //   itemHeight: 150.h, // Your item height
    //   items: _cubit.pageVariables.allList,
    //   hasReachedMax: _cubit.pageVariables.hasReachedEnd,
    //   loadNextPage: () async {
    //     _cubit.getTasks(isNewFilter: false);
    //     // Wait for load to complete
    //     await Future.delayed(Duration(milliseconds: 500));
    //   },
    //   findItem: (task) => task.id.toString() == targetId,
    // );
  }

  ValueNotifier<bool> _isHighlighted = ValueNotifier(false);

  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        final items = _cubit.pageVariables.allList;
        
        return Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 200 && 
                    !_cubit.pageVariables.hasReachedEnd && 
                    !state.getTasksStatus.isLoading()) {
                  _cubit.getTasks(isNewFilter: false);
                }
                return true;
              },
              child: GridView.builder(
                controller: controller,
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 
                                  MediaQuery.of(context).size.width > 600 ? 2 : 1,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: items.length,
          itemBuilder: (context, index) {
                  final task = items[index];
            return ValueListenableBuilder(
                valueListenable: _isHighlighted,
                    builder: (context, value, child) => AutoScrollTag(
                      key: ValueKey(index), 
                      controller: controller, 
                      index: index,
                      child: _buildCardNew(task, value && task.id.toString() == widget.idTask, context),
                    ),
                  );
                },
              ),
            ),
            if (state.getTasksStatus.isLoading())
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primaryMain,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        AppText(
                          'جاري التحميل...',
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  // Nueva implementación del card con diseño mejorado
  Widget _buildCardNew(TaskModel task, bool isHighlighted, BuildContext context) {
    final status = TaskStatusType.values
        .firstWhereOrNull((element) => element.name == task.status?.name);
    
    // Generar iniciales para avatar
    final assignToUserName = task.assignTo!.nameUser;
    final parts = assignToUserName?.split(' ');
    final firstChar = parts?.isNotEmpty == true ? parts!.first.substring(0, 1) : '';
    final secondChar = parts?.length == 2 ? parts![1].substring(0, 1) : '';
    final initials = '$firstChar$secondChar';
    
    // Obtener icono según el porcentaje de completado
    IconData getProgressIcon(int percentage) {
      if (percentage >= 90) return Icons.verified_rounded;
      if (percentage >= 75) return Icons.assignment_turned_in;
      if (percentage >= 50) return Icons.assignment_late;
      if (percentage >= 25) return Icons.assignment;
      return Icons.assignment_outlined;
    }
    
    // Obtener color según el porcentaje de completado
    Color getProgressColor(int percentage) {
      if (percentage >= 90) return Colors.green;
      if (percentage >= 75) return Colors.lightGreen;
      if (percentage >= 50) return Colors.amber;
      if (percentage >= 25) return Colors.orange;
      return Colors.red;
    }
    
    final completionPercentage = (task.completionPercentage ?? 0).toInt();

    return Container(
      decoration: BoxDecoration(
        color: isHighlighted ? AppColors.primaryAltLight.withOpacity(0.3) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: isHighlighted ? AppColors.primaryMain : Colors.grey.shade200,
          width: isHighlighted ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: status != null &&
                context.read<PrivilegesCubit>().checkPrivilege('165')
            ? () {
                Dialogs.showLoadingDialog(context);
                _cubit
                  ..onGetTaskComments(task.id!)
                  ..getTaskById(
                      onFaild: () {
                        Navigator.pop(context);
                      },
                      onSuccess: (value) {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          barrierLabel: task.id.toString(),
                            builder: (context) => DialogTaskDetail(
                                task: value, status: status, cubit: _cubit));
                      },
                      params: GetTaskByIdParams(idTask: task.id!));
              }
            : null,
        borderRadius: BorderRadius.circular(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header with status and progress icon
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: status?.color.withOpacity(0.1),
                  border: Border(
                    bottom: BorderSide(
                      color: status?.color ?? Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Status indicator
              Row(
                children: [
                  Container(
                          width: 10,
                          height: 10,
                    decoration: BoxDecoration(
                      color: status?.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 8),
                        AppText(
                          status?.text ?? 'غير معروف',
                          color: status?.color,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    
                    // Progress icon
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: getProgressColor(completionPercentage).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        getProgressIcon(completionPercentage),
                        color: getProgressColor(completionPercentage),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Content
                  Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      AppText(
                        task.title ?? '',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      
                      // Participants row
                      Row(
                        children: [
                          // Assigned from
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                AppText(
                                  'من:',
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                                SizedBox(height: 4),
                                AppText(
                                  '${task.assignFrom?.nameRegion ?? task.assignFrom?.nameMange ?? task.assignFrom?.nameUser ?? "غير محدد"}',
                                  fontSize: 13,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.grey.shade800,
                                ),
                              ],
                            ),
                          ),
                          
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.primaryMain.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: AppColors.primaryMain,
                            ),
                          ),
                          
                          // Assigned to
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  'إلى:',
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                                SizedBox(height: 4),
                                AppText(
                                  '${task.assignTo?.nameRegion ?? task.assignTo?.nameMange ?? task.assignTo?.nameUser ?? "غير محدد"}',
                                  fontSize: 13,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.primaryMain,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 8),
                      
                      // Client info if available
                      if (task.client?.nameEnterprise?.isNotEmpty == true) ...[
                        Row(
                          children: [
                            Icon(
                              Icons.business_outlined,
                              size: 16,
                              color: AppColors.primaryMain,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: AppText(
                                task.client?.nameEnterprise ?? '',
                                fontSize: 13,
                                color: AppColors.primaryMain,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                      ],
                      
                      // Date
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 14,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(width: 8),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: AppText(
                              Intl.DateFormat('dd MMM yyyy').format(task.startDate ?? DateTime.now()),
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              // Footer
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.shade200,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Colaborators
                    Row(
                      children: [
                        Icon(
                          Icons.group_outlined,
                          size: 16,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(width: 8),
                        AppText(
                          '${task.collaborators?.length ?? 0}',
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
                    
                    // Edit button if allowed
                              if (context.read<PrivilegesCubit>().checkPrivilege('339') &&
                        ([
                          task.assignFrom?.idUser.toString(),
                          task.assignFrom?.idRegion.toString(),
                          task.assignFrom?.idMange.toString()
                        ].contains(context.read<UserProvider>().currentUser.idUser) &&
                        (task.status?.name == TaskStatusType.Open.name ||
                          task.status?.name == TaskStatusType.receive.name)))
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryAltLight.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: IconButton(
                          constraints: BoxConstraints(minWidth: 32, maxWidth: 32, minHeight: 32, maxHeight: 32),
                          padding: EdgeInsets.zero,
                          iconSize: 16,
                                    onPressed: () {
                                      Dialogs.showLoadingDialog(context);
                                      context.read<TaskCubit>().getTaskById(
                                          onFaild: () {
                                            Navigator.pop(context);
                                          },
                                          onSuccess: (value) {
                                            Navigator.pop(context);
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => AddTaskPage(
                                                  task: value,
                                                ),
                                              ),
                                            );
                                          },
                                params: GetTaskByIdParams(
                                    idTask: task.id!));
                                    },
                                    icon: Icon(
                            Icons.edit_outlined,
                                      color: AppColors.primaryMain,
                          ),
                              ),
                              ),
                    
                    // Time taken if available
                          if (task.timeTaken != null)
                            Row(
                              children: [
                          Icon(
                            Icons.access_time_outlined,
                            size: 16,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(width: 6),
                              AppText(
                            '${task.timeTaken}',
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget assignToEmployeeWidget(AssignedTypeNew? type, ValueNotifier assigned) {
  if (type == AssignedTypeNew.users)
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        return ValueListenableBuilder(
          valueListenable: assigned,
          builder: (context, value, child) =>
              CustomSearchableDropDown<UserModel>(
            hint: 'الموظف',
            items: state.getUserSelected.data ?? [],
            itemAsString: (u) => u!.nameUser!,
            onChanged: (p0) {
              assigned.value = p0;
            },
            selectedItem: value,
            compareFn: (item, selectedItem) => item.id == selectedItem.id,
            filterFn: (user, filter) => user.nameUser!.contains(filter),
            validator: (value) {
              if (selectedTypeAssign.value != AssignedTypeNew.users) {
                return null;
              }
              if (value == null) {
                return 'هذا الحقل مطلوب.';
              }
              return null;
            },
          ),
        );
      },
    );
  return SizedBox.shrink();
}

Widget assignToDepartmentWidget(AssignedTypeNew? type, ValueNotifier assigned) {
  if (type == AssignedTypeNew.managements)
    return Consumer<manage_provider>(
      builder: (context, manageList, child) {
        final userDepartment =
            context.read<UserProvider>().currentUser.typeAdministration;
        final list = getIt<PrivilegesCubit>().checkPrivilege('169')
            ? manageList.listMangTask
            : getIt<PrivilegesCubit>().checkPrivilege('168') ||
                    getIt<PrivilegesCubit>().checkPrivilege('174')
                ? manageList.listMangTask
                    .where((element) => element.idMange == userDepartment)
                    .toList()
                : manageList.listMangTask;

        return ValueListenableBuilder(
          valueListenable: assigned,
          builder: (context, value, child) => CustomDropDown<ManageModel>(
            hint: 'القسم',
            items: list,
            compareFn: (item, selectedItem) =>
                item.idMange == selectedItem.idMange,
            itemAsString: (item) => item!.name_mange,
            selectedItem: value,
            onChanged: (data) {
              assigned.value = data;
            },
            validator: (value) {
              if (selectedTypeAssign.value != AssignedTypeNew.managements) {
                return null;
              }
              if (value == null) {
                return 'هذا الحقل مطلوب.';
              }
              return null;
            },
          ),
        );
      },
    );
  return SizedBox.shrink();
}

Widget assignToRegionWidget(AssignedTypeNew? type, ValueNotifier assigned) {
  if (type == AssignedTypeNew.regoin)
    return Consumer<RegionProvider>(
      builder: (context, cart, child) {
        final user = context.read<UserProvider>().currentUser;
        final list = context.read<PrivilegesCubit>().checkPrivilege('169')
            ? cart.listRegionTaskFilter
            : context.read<PrivilegesCubit>().checkPrivilege('167')
                ? cart.listRegionTaskFilter
                    .where((element) => element.branchId == user.fkRegoin)
                    .toList()
                : cart.listRegionTaskFilter;
        return ValueListenableBuilder(
          valueListenable: assigned,
          builder: (context, value, child) => CustomDropDown<BranchModel>(
            hint: 'الفرع',
            items: list,
            compareFn: (item, selectedItem) =>
                item.branchId == selectedItem.branchId,
            itemAsString: (branch) => branch!.branchName,
            selectedItem: value,
            onChanged: (data) {
              assigned.value = data as BranchModel;
            },
            validator: (value) {
              if (selectedTypeAssign.value != AssignedTypeNew.regoin) {
                return null;
              }
              if (value == null) {
                return 'هذا الحقل مطلوب.';
              }
              return null;
            },
          ),
        );
      },
    );
  return SizedBox.shrink();
}

Widget AssignTOAnotherWidget(
    {required TaskModel task, required TaskCubit taskCubit}) {
  ValueNotifier<AssignedTypeNew?> selectedTypeAssign = ValueNotifier(null);
  ValueNotifier assign = ValueNotifier(null);
  GlobalKey<FormState> _formKey = GlobalKey();

  return Directionality(
    textDirection: TextDirection.rtl,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText('اسناد إلى'),
        5.height,
        ValueListenableBuilder(
          valueListenable: selectedTypeAssign,
          builder: (context, typeAssinged, child) => Form(
            key: _formKey,
            child: Column(
              children: [
                CustomDropDown<AssignedTypeNew>(
                  hint: 'موظف / قسم/ فرع',
                  items: AssignedTypeNew.values,
                  itemAsString: (item) => item!.text,
                  selectedItem: typeAssinged,
                  compareFn: (item, selectedItem) =>
                      item.index == selectedItem.index,
                  onChanged: (value) {
                    assign.value = null;
                    selectedTypeAssign.value = value;
                  },
                  height: (135.0).scaleHeight,
                ),
                10.height,
                assignToEmployeeWidget(typeAssinged, assign),
                assignToRegionWidget(typeAssinged, assign),
                assignToDepartmentWidget(typeAssinged, assign),
              ],
            ),
          ),
        ),
        40.height,
        SizedBox(
            width: double.infinity,
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                return AppElevatedButton(
                  isLoading: state.changeTaskAssignStatus.isLoading(),
                  text: 'تاكيد العملية',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var id = selectedTypeAssign.value == AssignedTypeNew.users
                          ? ((assign.value as UserModel).id)
                          : selectedTypeAssign.value ==
                                  AssignedTypeNew.managements
                              ? ((assign.value as ManageModel).idMange)
                              : ((assign.value as BranchModel).branchId);
                      taskCubit.changeTaskAssign(
                          onSuccess: () {
                            Navigator.pop(context);
                          },
                          changeTaskAssignParams: ChangeTaskAssignParams(
                            taskId: task.id!,
                            assignTo: selectedTypeAssign.value!.name.toString(),
                            assignToId: id,
                          ));
                    }
                  },
                );
              },
            )),
      ],
    ),
  );
}

 