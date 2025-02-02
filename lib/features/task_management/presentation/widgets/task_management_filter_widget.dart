import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:crm_smart/features/clients_care/accept_clients/domain/entities/filter_clients_accept_entity.dart';

import '../../../../core/common/helpers/input_validator.dart';
import '../../../../core/common/models/location/branch_model.dart';
import '../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../view_model/regoin_vm.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
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
                  onPressed: context.read<TaskCubit>().pageVariables.selectedBranchModel.value != null
                      ? () {
                          context.read<TaskCubit>().pageVariables.selectedBranchModel.value = null;
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
