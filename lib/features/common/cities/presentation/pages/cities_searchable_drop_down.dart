import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/location/city_model.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../manager/cities_cubit.dart';

class CitiesSearchableDropDown extends StatefulWidget {
  const CitiesSearchableDropDown({
    super.key,
    this.hint,
    this.selectedCityId,
    this.icon,
    this.onSelected,
  });

  final String? hint;
  final String? selectedCityId;
  final IconData? icon;
  final Function(CityModel? city)? onSelected;

  @override
  State<CitiesSearchableDropDown> createState() =>
      _CitiesSearchableDropDownState();
}

class _CitiesSearchableDropDownState extends State<CitiesSearchableDropDown> {
  late final CitiesCubit cubit;

  @override
  void initState() {
    cubit = context.read<CitiesCubit>();

    if (cubit.citiesList.isNotEmpty) {
      cubit.loadCurrentCityById(cityId: widget.selectedCityId);
      return;
    }

    cubit.getAllCity(fkCountry: AppConstants.currentCountry).then((value) {
      cubit.loadCurrentCityById(cityId: widget.selectedCityId);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CitiesCubit>();

    return BlocBuilder<CitiesCubit, CitiesState>(
      builder: (context, state) {
        return state.getCityStatus.when(
          success: (data) {
            return CustomSearchableDropDown<CityModel>(
              hint: widget.hint ?? "المدينة",
              items: cubit.citiesList,
              selectedItem: cubit.selectedCity,
              itemAsString: (city) => city!.cityName,
              onChanged: (city) {
                if (city == null) {
                  return;
                }
                cubit.selectedCity = city;
                widget.onSelected?.call(city);
              },
              filterFn: (city, term) {
                return city.cityName.toLowerCase().contains(term.toLowerCase());
              },
              compareFn: (city, selected) => city.cityId == selected.cityId,
              validator: (value) {
                if (value == null) {
                  return "هذا الحقل مطلوب";
                }
                return null;
              },
            );
          },
          failure: (error, data) {
            return CustomErrorWidget(onPressed: () {
              cubit.getAllCity(fkCountry: AppConstants.currentCountry);
            });
          },
        );
      },
    );
  }
}
