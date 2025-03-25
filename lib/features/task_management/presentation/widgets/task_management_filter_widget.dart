import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as Intl;
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/input_validator.dart';
import '../../../../core/common/models/location/branch_model.dart';
import '../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../model/managmodel.dart';
import '../../../../model/usermodel.dart';
import '../../../../provider/manage_provider.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../mangement/manage_users/presentation/manager/users_cubit.dart';
import '../manager/task_cubit.dart';

class TaskManagementFilterWidget extends StatefulWidget {
  TaskManagementFilterWidget({
    super.key,
  });

  @override
  State<TaskManagementFilterWidget> createState() => _TaskManagementFilterWidgetState();
}

class _TaskManagementFilterWidgetState extends State<TaskManagementFilterWidget> {
  late final TaskCubit taskCubit;

  @override
  void initState() {
    taskCubit = context.read<TaskCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListenableBuilder(
          listenable: Listenable.merge(
            taskCubit.pageVariables.listenables(),
          ),
          builder: (context, child) => Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AppTextButton(
                  text: "إعادة الافتراضي",
                  onPressed: taskCubit.pageVariables.checkIfFilterIsNotEmpty()
                      ? () {
                          taskCubit.pageVariables.clearFilters();
                          taskCubit.getTasks();
                          context.pop();
                        }
                      : null,
                  appButtonStyle: AppButtonStyle.secondary,
                ),
              ),
              Consumer<RegionProvider>(
                builder: (context, value, child) => CustomSearchableDropDown<BranchModel>(
                  hint: "الفرع",
                  items: value.listRegionTaskFilter,
                  selectedItem: taskCubit.pageVariables.selectedBranchModel.value,
                  itemAsString: (Branch) => Branch!.branchName,
                  onChanged: (city) {
                    if (city == null) {
                      return;
                    }
                    taskCubit.pageVariables.selectedBranchModel.value = city;
                    // widget.onSelected?.call(city);
                  },
                  filterFn: (Branch, term) {
                    return Branch.branchName.toLowerCase().contains(term.toLowerCase());
                  },
                  compareFn: (Branch, selected) => Branch.branchId == selected.branchId,
                  validator: InputValidator.requiredFiled,
                ),
              ),
              20.height,
              Consumer<manage_provider>(
                builder: (context, value, child) => CustomSearchableDropDown<ManageModel>(
                  hint: "الادارة",
                  items: value.listMangTask,
                  selectedItem: taskCubit.pageVariables.selectedManagerModel.value,
                  itemAsString: (manager) => manager?.name_mange ?? '',
                  onChanged: (manager) {
                    if (manager == null) {
                      return;
                    }
                    taskCubit.pageVariables.selectedManagerModel.value = manager;
                    // widget.onSelected?.call(city);
                  },
                  filterFn: (manager, term) {
                    return manager.name_mange.toLowerCase().contains(term.toLowerCase());
                  },
                  compareFn: (manager, selected) => manager.name_mange == manager.name_mange,
                  validator: InputValidator.requiredFiled,
                ),
              ),
              20.height,
              BlocSelector<UsersCubit, UsersState, BlocStatus<List<UserModel>>>(
                selector: (state) => state.getUserSelected,
                builder: (context, state) => CustomSearchableDropDown<UserModel>(
                  hint: "الموظف المسند له",
                  items: state.data ?? [],
                  selectedItem: taskCubit.pageVariables.selectedUserModel.value,
                  itemAsString: (user) => user?.nameUser ?? '',
                  onChanged: (user) {
                    if (user == null) {
                      return;
                    }
                    taskCubit.pageVariables.selectedUserModel.value = user;
                    // widget.onSelected?.call(city);
                  },
                  filterFn: (user, term) {
                    return user.nameUser!.toLowerCase().contains(term.toLowerCase());
                  },
                  compareFn: (manager, selected) => manager.name_mange == manager.name_mange,
                  validator: InputValidator.requiredFiled,
                ),
              ),
              20.height,
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: taskCubit.state.filterFromDate ?? DateTime.now(),
                          firstDate: DateTime.now().subtract(Duration(days: 365 * 2)),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );
                        if (date == null) return;

                        taskCubit.pageVariables.fromDateController.text = Intl.DateFormat('dd MM yyyy').format(date);
                        taskCubit.onChangeFilterFromDate(date);
                      },
                      child: IgnorePointer(
                        ignoring: true,
                        child: AppTextField(
                          labelText: "من تاريخ",
                          maxLines: 1,
                          validator: InputValidator.requiredFiled,
                          readOnly: true,
                          controller: taskCubit.pageVariables.fromDateController,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  20.width,
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: taskCubit.state.filterToDate ?? DateTime.now(),
                          firstDate: DateTime.now().subtract(Duration(days: 365 * 2)),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );

                        if (date == null) return;

                        taskCubit.pageVariables.toDateController.text = Intl.DateFormat('dd MM yyyy').format(date);
                        taskCubit.onChangeToDate(date);
                      },
                      child: IgnorePointer(
                        ignoring: true,
                        child: AppTextField(
                          labelText: "إلى تاريخ",
                          maxLines: 1,
                          validator: InputValidator.requiredFiled,
                          readOnly: true,
                          controller: taskCubit.pageVariables.toDateController,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              20.height,
              ValueListenableBuilder(
                valueListenable: taskCubit.pageVariables.selectedQuickDateFilter,
                builder: (context, value, child) => CupertinoSlidingSegmentedControl(
                  backgroundColor: AppColors.background,
                  groupValue: value,
                  onValueChanged: (value) {
                    taskCubit.pageVariables.selectedQuickDateFilter.value = value;
                  },
                  children: const {
                    1: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: AppText('يومي', color: AppColors.black),
                    ),
                    2: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: AppText('اسبوعي', color: AppColors.black),
                    ),
                    3: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: AppText('شهري', color: AppColors.black),
                    ),
                    4: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: AppText('سنوي', color: AppColors.black),
                    ),
                  },
                ),
              ),
              20.height,
              SwitchListTile(
                value: taskCubit.pageVariables.atTime.value ?? false,
                onChanged: (value) {
                  taskCubit.pageVariables.atTime.value = value;
                  taskCubit.pageVariables.afterTime.value = false;
                },
                title: AppText("تم تنفيذ المهمة قبل انتهاء الوقت المخصص لها"),
              ),
              20.height,
              SwitchListTile(
                value: taskCubit.pageVariables.afterTime.value ?? false,
                onChanged: (value) {
                  taskCubit.pageVariables.afterTime.value = value;
                  taskCubit.pageVariables.atTime.value = false;
                },
                title: AppText("تم تنفيذ المهمة بعد انتهاء الوقت المخصص لها"),
              ),
              20.height,
              AppElevatedButton(
                text: "فلترة",
                onPressed: () {
                  taskCubit.getTasks();
                  context.pop();
                },
              ),
              20.height,
            ],
          ),
        ),
      ),
    );
  }
}
