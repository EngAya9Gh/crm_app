import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/models/location/region_model.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../manager/regions_cubit.dart';

class RegionsMultiSelectionDropdown extends StatefulWidget {
  const RegionsMultiSelectionDropdown({
    super.key,
    this.hint,
    this.currentUserRegionsOnly = false,
    this.selectedCities,
    this.onSave,
    this.isRequired = false,
    this.isDisabled = false,
  });

  final String? hint;
  final bool currentUserRegionsOnly;

  final List<RegionModel>? selectedCities;
  final Function(List<RegionModel>)? onSave;
  final bool isRequired;
  final bool isDisabled;

  @override
  State<RegionsMultiSelectionDropdown> createState() =>
      _RegionsMultiSelectionDropdownState();
}

class _RegionsMultiSelectionDropdownState
    extends State<RegionsMultiSelectionDropdown> {
  late final RegionsCubit cubit;

  @override
  void initState() {
    cubit = context.read<RegionsCubit>();
    if (cubit.regionsList.isEmpty) {
      cubit.getRegions();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<RegionsCubit>();

    return BlocBuilder<RegionsCubit, RegionsState>(
      builder: (context, state) {
        return state.getRegionStatus.when(
          success: (data) {
            return CustomMultiSelectionDropdown<RegionModel>(
              hint: widget.hint ?? "المنطقة",
              items: widget.currentUserRegionsOnly
                  ? _cubit.currentUserRegions
                  : _cubit.regionsList,
              selectedItems: widget.selectedCities ?? [],
              itemAsString: (city) => city!.namemaincity,
              filterFn: (city, term) {
                return city.namemaincity
                    .toLowerCase()
                    .contains(term.toLowerCase());
              },
              onSave: (value) {
                widget.onSave?.call(value);
              },
              compareFn: (city, selected) =>
                  city.id_maincity == selected.id_maincity,
              validator:
                  widget.isRequired ? InputValidator.requiredFiled : null,
              isDisabled: widget.isDisabled,
            );
          },
          failure: (error, data) {
            return AppErrorWidget(onPressed: () {
              _cubit.getRegions();
            });
          },
        );
      },
    );
  }
}
