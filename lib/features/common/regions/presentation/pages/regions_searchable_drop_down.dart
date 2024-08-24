import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/location/region_model.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../manager/regions_cubit.dart';

class RegionsSearchableDropDown extends StatefulWidget {
  const RegionsSearchableDropDown({
    super.key,
    this.hint,
    this.selectedCityId,
    this.icon,
    this.onSelected,
  });

  final String? hint;
  final String? selectedCityId;
  final IconData? icon;
  final Function(RegionModel? city)? onSelected;

  @override
  State<RegionsSearchableDropDown> createState() =>
      _RegionsSearchableDropDownState();
}

class _RegionsSearchableDropDownState extends State<RegionsSearchableDropDown> {
  late final RegionsCubit cubit;

  @override
  void initState() {
    cubit = context.read<RegionsCubit>();
    if (cubit.regionsList.isEmpty) {
      cubit.getRegions().then((value) {
        cubit.loadCurrentCityById(RegionId: widget.selectedCityId);
      });
    } else {
      cubit.loadCurrentCityById(RegionId: widget.selectedCityId);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegionsCubit>();

    return BlocBuilder<RegionsCubit, RegionsState>(
      builder: (context, state) {
        return state.getRegionStatus.when(
          success: (data) {
            return CustomSearchableDropDown<RegionModel>(
              hint: widget.hint ?? "المنطقة",
              items: cubit.regionsList,
              selectedItem: cubit.selectedRegion,
              itemAsString: (city) => city!.namemaincity,
              onChanged: (region) {
                if (region == null) {
                  return;
                }
                cubit.selectedRegion = region;
                widget.onSelected?.call(region);
              },
              filterFn: (city, term) {
                return city.namemaincity
                    .toLowerCase()
                    .contains(term.toLowerCase());
              },
              compareFn: (city, selected) =>
                  city.id_maincity == selected.id_maincity,
              validator: (value) {
                if (value == null) {
                  return "هذا الحقل مطلوب";
                }
                return null;
              },
            );
          },
          failure: (error, data) {
            return AppErrorWidget(onPressed: () {
              cubit.getRegions();
            });
          },
        );
      },
    );
  }
}
