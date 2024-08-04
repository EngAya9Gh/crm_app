import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/models/region_model.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../manager/regions_cubit/regions_cubit.dart';

class RegionSearchableDropDown extends StatefulWidget {
  const RegionSearchableDropDown({
    super.key,
    this.selectedRegionId,
    this.icon,
    this.onSelected,
    this.hint,
  });

  final String? selectedRegionId;
  final IconData? icon;
  final Function(RegionModel? region)? onSelected;
  final String? hint;

  @override
  State<RegionSearchableDropDown> createState() =>
      _RegionSearchableDropDownState();
}

class _RegionSearchableDropDownState extends State<RegionSearchableDropDown> {
  late final RegionsCubit cubit;

  @override
  void initState() {
    cubit = context.read<RegionsCubit>();
    if (cubit.regionsList.isEmpty) {
      cubit
          .getRegionsByIdCountry(
              fkCountry: AppConstants.currentCountry(context) ?? '')
          .then((value) {
        cubit.loadCurrentRegionById(cityId: widget.selectedRegionId);
      });
    } else {
      cubit.loadCurrentRegionById(cityId: widget.selectedRegionId);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegionsCubit>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BlocBuilder<RegionsCubit, RegionsState>(
        builder: (context, state) {
          if (state is RegionsLoading) {
            return AppLoader(padding: 3);
          } else if (state is RegionsError) {
            return CustomErrorWidget(onPressed: () {
              cubit.getRegionsByIdCountry(
                  fkCountry: AppConstants.currentCountry(context) ?? '');
            });
          }
          return CustomSearchableDropDown<RegionModel>(
            hint: widget.hint ?? "حدد المنطقة",
            items: cubit.regionsList,
            selectedItem: cubit.selectedCity,
            itemAsString: (region) => region!.regionName,
            onChanged: (city) {
              if (city == null) {
                return;
              }
              cubit.selectedCity = city;
              widget.onSelected?.call(city);
            },
            filterFn: (region, term) {
              return region.regionName
                  .toLowerCase()
                  .contains(term.toLowerCase());
            },
            compareFn: (region, selected) =>
                region.regionId == selected.regionId,
            validator: (value) {
              return InputValidator.requiredFiled(value);
            },
          );
        },
      ),
    );
  }
}
