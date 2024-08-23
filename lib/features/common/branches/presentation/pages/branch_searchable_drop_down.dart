import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../manager/branches_cubit.dart';

class BranchSearchableDropDown extends StatefulWidget {
  const BranchSearchableDropDown({
    super.key,
    this.selectedBranchId,
    this.icon,
    this.onSelected,
    this.hint,
    this.showAllChoice = false,
  });

  final String? selectedBranchId;
  final IconData? icon;
  final Function(BranchModel? branch)? onSelected;
  final String? hint;
  final bool showAllChoice;

  @override
  State<BranchSearchableDropDown> createState() =>
      _BranchSearchableDropDownState();
}

class _BranchSearchableDropDownState extends State<BranchSearchableDropDown> {
  late final BranchesCubit cubit;
  late final List<BranchModel> branchesList;

  @override
  void initState() {
    cubit = context.read<BranchesCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadBranches().then((_) => _loadSelectedBranch());
      _prepareBranchesList();
    });
    super.initState();
  }

  Future<void> _loadBranches() async {
    if (cubit.branchesList.isNotEmpty) return;
    await cubit.getBranchesByIdCountry(fkCountry: AppConstants.currentCountry);
  }

  void _loadSelectedBranch() {
    cubit.loadCurrentBranchesById(cityId: widget.selectedBranchId);
  }

  void _prepareBranchesList() {
    branchesList = List<BranchModel>.from(cubit.branchesList);
    if (widget.showAllChoice) {
      branchesList.insert(
        0,
        BranchModel(
          branchId: "0",
          branchName: "الكل",
          countryId: '',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BranchesCubit>();
    return BlocBuilder<BranchesCubit, BranchesState>(
      builder: (context, state) {
        return state.getBranchesStatus.when(
          success: (data) {
            return CustomSearchableDropDown<BranchModel>(
              hint: widget.hint ?? "الفرع",
              items: branchesList,
              selectedItem: cubit.selectedCity,
              itemAsString: (Branch) => Branch!.branchName,
              onChanged: (city) {
                if (city == null) {
                  return;
                }
                cubit.selectedCity = city;
                widget.onSelected?.call(city);
              },
              filterFn: (Branch, term) {
                return Branch.branchName
                    .toLowerCase()
                    .contains(term.toLowerCase());
              },
              compareFn: (Branch, selected) =>
                  Branch.branchId == selected.branchId,
              validator: (value) {
                return InputValidator.requiredFiled(value);
              },
            );
          },
          failure: (error, data) => CustomErrorWidget(
            onPressed: () => cubit.getBranchesByIdCountry(
              fkCountry: AppConstants.currentCountry,
            ),
          ),
        );
      },
    );
  }
}
