import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../manager/users_cubit.dart';

class BranchesSearchableDropdown extends StatelessWidget {
  const BranchesSearchableDropdown({
    super.key,
    required this.branch,
    this.onChanged,
    this.isRequired = false,
  });

  final BranchModel? branch;
  final void Function(BranchModel?)? onChanged;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state.branchesStatus.isLoading()) {
          return AppLoader();
        } else if (state.branchesStatus.isFailed()) {
          return CustomErrorWidget(
            message: state.branchesStatus.error,
            onPressed: () => context.read<UsersCubit>().getManagesForUser(),
          );
        } else if (state.branchesStatus.data?.isEmpty ?? true) {
          return CustomErrorWidget(
            message: "لا يوجد فروع",
            onPressed: () => context.read<UsersCubit>().getManagesForUser(),
          );
        }
        return CustomSearchableDropDown<BranchModel>(
          hint: "حدد الفرع",
          items: state.branchesStatus.data!,
          itemAsString: (item) => item!.branchName,
          selectedItem: branch,
          onChanged: onChanged,
          filterFn: (item, str) {
            return item.branchName
                .toString()
                .toLowerCase()
                .contains(str.toLowerCase());
          },
          isRequired: isRequired,
        );
      },
    );
  }
}
