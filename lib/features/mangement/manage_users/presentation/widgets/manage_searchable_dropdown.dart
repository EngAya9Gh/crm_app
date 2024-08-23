import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../model/managmodel.dart';
import '../manager/users_cubit.dart';

class ManageSearchableDropdown extends StatelessWidget {
  const ManageSearchableDropdown({
    super.key,
    this.onChanged,
    required this.manage,
    this.isRequired = false,
  });

  final void Function(ManageModel?)? onChanged;
  final ManageModel? manage;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state.managesStatus.isLoading()) {
          return AppLoader();
        } else if (state.managesStatus.isFailed()) {
          return AppErrorWidget(
            message: state.managesStatus.error,
            onPressed: () => context.read<UsersCubit>().getManagesForUser(),
          );
        } else if (state.managesStatus.data?.isEmpty ?? true) {
          return AppErrorWidget(
            message: "لا يوجد إدارات",
            onPressed: () => context.read<UsersCubit>().getManagesForUser(),
          );
        }
        return CustomSearchableDropDown<ManageModel>(
          hint: "حدد الإدارة",
          items: state.managesStatus.data!,
          itemAsString: (item) => item!.name_mange,
          selectedItem: manage,
          onChanged: onChanged,
          filterFn: (item, str) {
            return item.name_mange
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
