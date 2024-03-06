import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../model/maincitymodel.dart';
import '../../utils/app_styles.dart';
import '../manager/cities_cubit/cities_cubit.dart';

class CitiesDropDownWidget extends StatelessWidget {
  const CitiesDropDownWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CitiesCubit>();
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: DropdownButtonFormField<CityModel?>(
          isExpanded: true,
          validator: (value) {
            if (value == null) {
              return "هذا الحقل مطلوب";
            }
            return null;
          },
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.grey,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade300,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
          hint: Text("حدد المدينة"),
          items: cubit.citiesList
              .toSet()
              .map<DropdownMenuItem<CityModel?>>((CityModel? city) {
            return DropdownMenuItem<CityModel?>(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsetsDirectional.all(2),
                decoration: AppStyles.customBoxDecoration,
                child: ListTile(
                  trailing: Text(
                    city?.name_city ?? '',
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
              value: city,
            );
          }).toList(),
          value: cubit.selectedCity,
          selectedItemBuilder: (context) {
            return cubit.citiesList.toSet().map((item) {
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
          },
          onSaved: (city) {
            if (city == null) {
              return;
            }
            cubit.selectedCity = city;
          },
        ),
      ),
    );
  }
}
