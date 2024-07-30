import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/common/cities/presentation/manager/cities_cubit.dart';
import '../../../model/maincitymodel.dart';
import '../../utils/app_constants.dart';
import 'app_loader.dart';
import 'custom_error_widget.dart';
import 'custom_searchable_dropdown.dart';

class CitiesSearchableDropDown extends StatefulWidget {
  const CitiesSearchableDropDown({
    super.key,
    this.selectedCityId,
    this.icon,
    this.onSelected,
  });

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
    if (cubit.citiesList.isEmpty) {
      cubit
          .getAllCity(fkCountry: AppConstants.currentCountry(context) ?? '')
          .then((value) {
        cubit.loadCurrentCityById(cityId: widget.selectedCityId);
      });
    } else {
      cubit.loadCurrentCityById(cityId: widget.selectedCityId);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CitiesCubit>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BlocBuilder<CitiesCubit, CitiesState>(
        builder: (context, state) {
          if (state is CitiesLoading) {
            return AppLoader(padding: 3);
          } else if (state is CitiesError) {
            return CustomErrorWidget(onPressed: () {
              cubit.getAllCity(
                  fkCountry: AppConstants.currentCountry(context) ?? '');
            });
          }
          return CustomSearchableDropDown<CityModel>(
            hint: "حدد المدينة",
            items: cubit.citiesList,
            selectedItem: cubit.selectedCity,
            itemAsString: (city) => city!.name_city,
            onChanged: (city) {
              if (city == null) {
                return;
              }
              cubit.selectedCity = city;
              widget.onSelected?.call(city);
            },
            filterFn: (city, term) {
              return city.name_city.toLowerCase().contains(term.toLowerCase());
            },
            compareFn: (city, selected) => city.idCity == selected.idCity,
            validator: (value) {
              if (value == null) {
                return "هذا الحقل مطلوب";
              }
              return null;
            },
          );
        },
      ),
    );
  }
}
