import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../model/maincitymodel.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentLocationWidget extends StatelessWidget {
  AgentLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
    return Column(
      children: [
        Row(
          children: [
            Text('المدينة', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('*', style: TextStyle(color: Colors.red)),
          ],
        ),
        BlocBuilder<AgentsDistributorsActionsCubit,
            AgentsDistributorsActionsState>(
          buildWhen: (previous, current) =>
              current is AgentsDistributorsActionsCityChanged,
          builder: (context, state) {
            if (state is AgentsDistributorsActionsFailure) {
              return CustomErrorWidget(
                onPressed: () {
                  cubit.getAllCity(
                    fkCountry: AppConstants.currentCountry(context) ?? '',
                  );
                },
              );
            }
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
                  value: cubit.selectedCountryFromCity,
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
                    cubit.onSelectCity(city.id_city);
                  },
                  onSaved: (city) {
                    if (city == null) {
                      return;
                    }
                    cubit.onSelectCity(city.id_city);
                    cubit.onSelectCountry(AppConstants.currentCountry(context));
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
