import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../model/maincitymodel.dart';
import '../../utils/app_constants.dart';
import '../manager/cities_cubit/cities_cubit.dart';
import 'custom_error_widget.dart';
import 'custom_loading_indicator.dart';

class CitiesDropDownWidget extends StatelessWidget {
  const CitiesDropDownWidget({
    Key? key,
    this.icon,
    this.onSelected,
  }) : super(key: key);

  final IconData? icon;
  final VoidCallback? onSelected;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CitiesCubit>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BlocBuilder<CitiesCubit, CitiesState>(
        builder: (context, state) {
          if (state is CitiesLoading) {
            return CustomLoadingIndicator();
          } else if (state is CitiesError) {
            return CustomErrorWidget(onPressed: () {
              cubit.getAllCity(
                  fkCountry: AppConstants.currentCountry(context) ?? '');
            });
          }
          return DropdownButtonFormField<CityModel?>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            isExpanded: true,
            validator: (value) {
              if (value == null) {
                return "هذا الحقل مطلوب";
              }
              return null;
            },
            icon: cubit.selectedCity == null
                ? Icon(
                    icon ?? Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey,
                  )
                : InkWell(
                    onTap: () {
                      cubit.selectedCity = null;
                      onSelected?.call();
                    },
                    child: Icon(
                      Icons.clear,
                      color: Colors.grey,
                    ),
                  ),
            hint: Text(
              "حدد المدينة",
              style: context.textTheme.titleSmall?.copyWith(
                color: Colors.grey.shade600,
                fontSize: 12.sp,
              ),
            ),
            items: cubit.citiesList
                .map<DropdownMenuItem<CityModel?>>((CityModel? city) {
              return DropdownMenuItem<CityModel?>(
                alignment: Alignment.centerRight,
                child: ListTile(
                  trailing: Text(
                    city?.name_city ?? '',
                    textDirection: TextDirection.rtl,
                  ),
                ),
                value: city,
              );
            }).toList(),
            value: cubit.selectedCity,
            selectedItemBuilder: (context) {
              return cubit.citiesList.map((item) {
                return DropdownMenuItem<CityModel>(
                  value: item,
                  alignment: Alignment.centerRight,
                  child: AppText(
                    item.name_city,
                    style: context.textTheme.titleSmall,
                  ),
                );
              }).toList();
            },
            onChanged: (city) {
              if (city == null) {
                return;
              }
              cubit.selectedCity = city;
              onSelected?.call();
            },
            onSaved: (city) {
              if (city == null) {
                return;
              }
              cubit.selectedCity = city;
            },
          );
        },
      ),
    );
  }
}
