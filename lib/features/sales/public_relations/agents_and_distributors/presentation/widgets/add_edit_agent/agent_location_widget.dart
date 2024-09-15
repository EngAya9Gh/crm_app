import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/widgets/custom_error_widget.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText('المدينة*'),
        BlocBuilder<AgentsDistributorsActionsCubit,
            AgentsDistributorsActionsState>(
          buildWhen: (previous, current) =>
              current is AgentsDistributorsActionsCityChanged,
          builder: (context, state) {
            if (state is AgentsDistributorsActionsFailure) {
              return AppErrorWidget(
                onPressed: () => cubit.getAllCity(),
              );
            }
            return CitiesSearchableDropDown(
              selectedCityId: cityId,
              onSelected: (city) {
                if (city == null) {
                  return;
                }
                cubit.onSelectCity(city.cityId);
              },
            );
          },
        ),
      ],
    );
  }
}
