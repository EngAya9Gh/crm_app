import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agents_search_and_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../../core/utils/responsive_padding.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import 'agent_card.dart';

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
                    return CustomLoadingIndicator();
                  } else if (state.status == StateStatus.failure) {
                    return CustomErrorWidget(
                        onPressed: cubit.getAgentsAndDistributors);
                  }
                  return Column(
                    children: [
                      10.width,
                      // clients count
                      Padding(
                        padding: HWEdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText("العدد"),
                            AppText(
                                "${state.agentsAndDistributorsList.length}"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(10.0),
                          itemCount: state.agentsAndDistributorsList.length,
                          itemBuilder: (BuildContext context, int index) =>
                              AgentCard(
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
