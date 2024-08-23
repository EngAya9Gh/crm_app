import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../manager/branches_cubit.dart';

class BranchesMultiSelectionDropdown extends StatefulWidget {
  const BranchesMultiSelectionDropdown({
    super.key,
    this.selectedCities,
    this.hint,
    this.onSave,
  });

  final String? hint;
  final List<BranchModel>? selectedCities;
  final Function(List<BranchModel>)? onSave;

  @override
  State<BranchesMultiSelectionDropdown> createState() =>
      _BranchesMultiSelectionDropdownState();
}

class _BranchesMultiSelectionDropdownState
    extends State<BranchesMultiSelectionDropdown> {
  late final BranchesCubit cubit;

  @override
  void initState() {
    cubit = context.read<BranchesCubit>();

    if (cubit.branchesList.isEmpty) {
      cubit.getBranchesByIdCountry(fkCountry: AppConstants.currentCountry);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BranchesCubit>();

    return BlocBuilder<BranchesCubit, BranchesState>(
      builder: (context, state) {
        if (state.getBranchesStatus.isLoading()) {
          return AppLoader(padding: 3);
        } else if (state.getBranchesStatus.isFailed()) {
          return AppErrorWidget(onPressed: () {
            cubit.getBranchesByIdCountry(
                fkCountry: AppConstants.currentCountry);
          });
        }
        return CustomMultiSelectionDropdown<BranchModel>(
          hint: widget.hint ?? "الفرع",
          items: cubit.branchesList,
          selectedItems: widget.selectedCities ?? [],
          itemAsString: (city) => city!.branchName,
          filterFn: (city, term) {
            return city.branchName.toLowerCase().contains(term.toLowerCase());
          },
          onSave: (value) {
            widget.onSave?.call(value);
          },
          compareFn: (city, selected) => city.branchId == selected.branchId,
        );
      },
    );
  }
}
