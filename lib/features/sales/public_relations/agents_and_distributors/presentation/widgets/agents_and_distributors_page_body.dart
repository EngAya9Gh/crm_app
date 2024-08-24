import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/common/widgets/count_paginated_list.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import 'agent_card.dart';
import 'agents_search_and_filter.dart';

class AgentsAndDistributorsPageBody extends StatelessWidget {
  AgentsAndDistributorsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          SizedBox(height: 10),
          // search
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AgentsSearchAndFilter(),
          ),

          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => cubit.getAgentsAndDistributors(),
              child:
                  BlocBuilder<AgentsDistributorsCubit, AgentsDistributorsState>(
                builder: (context, state) {
                  if (state.status == StateStatus.loading) {
                    return AppLoader();
                  } else if (state.status == StateStatus.failure) {
                    return AppErrorWidget(
                        onPressed: cubit.getAgentsAndDistributors);
                  }
                  return Column(
                    children: [
                      10.width,
                      // clients count
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: CountPaginatedList<AgentsDistributorsCubit,
                            AgentsDistributorsState>(
                          label: 'العدد',
                          countSelector: (state) =>
                              state.agentsAndDistributorsList.length,
                        ),
                      ),
                      Expanded(
                        child: AppPaginatedList(
                          items: state.agentsAndDistributorsList,
                          itemBuilder: (context, index) => AgentCard(
                            agentModel: state.agentsAndDistributorsList[index],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
