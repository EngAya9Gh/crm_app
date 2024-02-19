import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants/constants.dart';
import '../../../../model/maincitymodel.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentLocationWidget extends StatelessWidget {
  AgentLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          builder: (context, state) {
            final cubit =
                BlocProvider.of<AgentsDistributorsActionsCubit>(context);
            if (state is AgentsDistributorsActionsLoading) {
              return Center(
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is AgentsDistributorsActionsSuccess) {
              return Container(
                child: Directionality(
                  textDirection: TextDirection.rtl,
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
                      items: (cubit.citiesState.data ?? [])
                          .map<DropdownMenuItem<CityModel?>>(
                              (CityModel? country) {
                        return DropdownMenuItem<CityModel?>(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsetsDirectional.only(
                                start: 2, end: 2, top: 2, bottom: 2),
                            decoration: decoration,
                            child: ListTile(
                              trailing: Text(country?.name_city ?? '',
                                  textDirection: TextDirection.rtl),
                            ),
                          ),
                          value: country,
                        );
                      }).toList(),
                      value: cubit.selectedCountryFromCity,
                      selectedItemBuilder: (context) {
                        return (cubit.citiesState.data ?? []).map((item) {
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
                        cubit.onSelectCity(city);
                      },
                      onSaved: (city) {
                        if (city == null) {
                          return;
                        }
                        print('city.id_city');
                        print(city.id_city);
                        cubit.onSelectCity(city);
                        cubit.onSelectCountry(
                            AppConstants.currentCountry(context));
                      },
                    ),
                  ),
                ),
              );
            } else {
              // Handle failure state
              return Text('Failed to load cities');
            }
          },
        ),
      ],
    );
  }
}
