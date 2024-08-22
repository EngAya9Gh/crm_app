import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../../common/cities/presentation/pages/cities_searchable_drop_down.dart';
import '../../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentLocationWidget extends StatelessWidget {
  AgentLocationWidget({
    super.key,
    this.cityId,
  });

  final String? cityId;

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
                    fkCountry: AppConstants.currentCountry,
                  );
                },
              );
            }
            return CitiesSearchableDropDown(
              selectedCityId: cityId,
              onSelected: (city) {
                if (city == null) {
                  return;
                }
                cubit.onSelectCity(city.idCity);
              },
            );
          },
        ),
      ],
    );
  }
}
