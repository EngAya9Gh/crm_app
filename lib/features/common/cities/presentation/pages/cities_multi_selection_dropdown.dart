import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/location/city_model.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../manager/cities_cubit.dart';

class CitiesMultiSelectionDropdown extends StatefulWidget {
  const CitiesMultiSelectionDropdown({
    super.key,
    this.selectedCities,
    this.hint,
    this.onSave,
  });

  final String? hint;
  final List<CityModel>? selectedCities;
  final Function(List<CityModel>)? onSave;

  @override
  State<CitiesMultiSelectionDropdown> createState() =>
      _CitiesMultiSelectionDropdownState();
}

class _CitiesMultiSelectionDropdownState
    extends State<CitiesMultiSelectionDropdown> {
  late final CitiesCubit cubit;

  @override
  void initState() {
    cubit = context.read<CitiesCubit>();

    if (cubit.citiesList.isEmpty) {
      cubit.getAllCity(fkCountry: AppConstants.currentCountry);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CitiesCubit>();

    return BlocBuilder<CitiesCubit, CitiesState>(
      builder: (context, state) {
        if (state.getCityStatus.isLoading()) {
          return AppLoader(padding: 3);
        } else if (state.getCityStatus.isFailed()) {
          return CustomErrorWidget(onPressed: () {
            cubit.getAllCity(fkCountry: AppConstants.currentCountry);
          });
        }
        return CustomMultiSelectionDropdown<CityModel>(
          hint: widget.hint ?? "المدينة",
          items: cubit.citiesList,
          selectedItems: widget.selectedCities ?? [],
          itemAsString: (city) => city!.cityName,
          filterFn: (city, term) {
            return city.cityName.toLowerCase().contains(term.toLowerCase());
          },
          onSave: (value) {
            widget.onSave?.call(value);
          },
          compareFn: (city, selected) => city.cityId == selected.cityId,
        );
      },
    );
  }
}
