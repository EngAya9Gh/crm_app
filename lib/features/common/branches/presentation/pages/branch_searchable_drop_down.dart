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
  late final BranchesCubit _cubit;
  List<BranchModel> branchesList = [];

  @override
  void initState() {
    _cubit = context.read<BranchesCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadBranches().then((_) => _loadSelectedBranch());
      _prepareBranchesList();
      setState(() {});
    });
    super.initState();
  }

  Future<void> _loadBranches() async {
    if (_cubit.branchesList.isNotEmpty) return;
    await _cubit.getBranchesByIdCountry(fkCountry: AppConstants.currentCountry);
  }

  void _loadSelectedBranch() {
    _cubit.loadCurrentBranchesById(cityId: widget.selectedBranchId);
  }

  void _prepareBranchesList() {
    branchesList = List<BranchModel>.from(_cubit.branchesList);
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
    return BlocBuilder<BranchesCubit, BranchesState>(
      builder: (context, state) {
        return state.getBranchesStatus.when(
          success: (data) {
            return CustomSearchableDropDown<BranchModel>(
              hint: widget.hint ?? "الفرع",
              items: branchesList,
              selectedItem: _cubit.selectedCity,
              itemAsString: (Branch) => Branch!.branchName,
              onChanged: (city) {
                if (city == null) {
                  return;
                }
                _cubit.selectedCity = city;
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
          failure: (error, data) => AppErrorWidget(
            onPressed: () => _cubit.getBranchesByIdCountry(
              fkCountry: AppConstants.currentCountry,
            ),
          ),
        );
      },
    );
  }
}
