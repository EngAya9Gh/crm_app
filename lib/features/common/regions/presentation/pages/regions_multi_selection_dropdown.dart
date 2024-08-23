import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/location/region_model.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../manager/regions_cubit.dart';

class RegionsMultiSelectionDropdown extends StatefulWidget {
  const RegionsMultiSelectionDropdown({
    super.key,
    this.selectedCities,
    this.hint,
    this.onSave,
  });

  final String? hint;
  final List<RegionModel>? selectedCities;
  final Function(List<RegionModel>)? onSave;

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
      cubit.getRegions(fkCountry: AppConstants.currentCountry);
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
              items: _cubit.regionsList,
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
            );
          },
          failure: (error, data) {
            return CustomErrorWidget(onPressed: () {
              _cubit.getRegions(fkCountry: AppConstants.currentCountry);
            });
          },
        );
      },
    );
  }
}
