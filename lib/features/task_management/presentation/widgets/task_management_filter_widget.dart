import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

class TaskManagementFilterWidget extends StatelessWidget {
  TaskManagementFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListenableBuilder(
          listenable: Listenable.merge(
            context.read<TaskCubit>().pageVariables.listenables(),
          ),
          builder: (context, child) => Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AppTextButton(
                  text: "إعادة الافتراضي",
                  onPressed: context.read<TaskCubit>().pageVariables.checkIfFilterIsNotEmpty()
                      ? () {

                          context.read<TaskCubit>().pageVariables.clearFilters();
                          context.read<TaskCubit>().getTasks();
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
                  selectedItem: context.read<TaskCubit>().pageVariables.selectedBranchModel.value,
                  itemAsString: (Branch) => Branch!.branchName,
                  onChanged: (city) {
                    if (city == null) {
                      return;
                    }
                    context.read<TaskCubit>().pageVariables.selectedBranchModel.value = city;
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
                  selectedItem: context.read<TaskCubit>().pageVariables.selectedManagerModel.value,
                  itemAsString: (manager) => manager?.name_mange??'',
                  onChanged: (manager) {
                    if (manager == null) {
                      return;
                    }
                    context.read<TaskCubit>().pageVariables.selectedManagerModel.value = manager;
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
              BlocSelector<UsersCubit,UsersState,BlocStatus<List<UserModel>>>(
                selector: (state) => state.getUserSelected,
                builder: (context, state) => CustomSearchableDropDown<UserModel>(
                  hint: "الموظف المسند له",
                  items: state.data??[],
                  selectedItem: context.read<TaskCubit>().pageVariables.selectedUserModel.value,
                  itemAsString: (user) => user?.nameUser??'',
                  onChanged: (user) {
                    if (user == null) {
                      return;
                    }
                    context.read<TaskCubit>().pageVariables.selectedUserModel.value = user;
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
              SwitchListTile(
                value: context.read<TaskCubit>().pageVariables.atTime.value??false,
                onChanged: (value) {
                  context.read<TaskCubit>().pageVariables.atTime.value = value;
                },
                title: AppText("تم تنفيذ المهمة قبل انتهاء الوقت المخصص لها"),
              ),
              20.height,
              SwitchListTile(
                value: context.read<TaskCubit>().pageVariables.afterTime.value??false,
                onChanged: (value) {
                  context.read<TaskCubit>().pageVariables.afterTime.value = value;
                },
                title: AppText("تم تنفيذ المهمة بعد انتهاء الوقت المخصص لها"),
              ),
              20.height,
              AppElevatedButton(
                text: "فلترة",
                onPressed: () {
                  context.read<TaskCubit>().getTasks();
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
