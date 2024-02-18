import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/enums/enums.dart';
import '../../../../common/widgets/custom_error_widget.dart';
import '../../../../common/widgets/custom_loading_indicator.dart';
import '../../../../core/di/di_container.dart';
import '../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import 'agent_card.dart';

class AgentsAndDistributorsPageBody extends StatelessWidget {
  const AgentsAndDistributorsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = sl<AgentsDistributorsCubit>();
    return RefreshIndicator(
      onRefresh: () async => cubit.getAgentsAndDistributors(),
      child: BlocBuilder<AgentsDistributorsCubit, AgentsDistributorsState>(
        builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return CustomLoadingIndicator();
          } else if (state.status == StateStatus.failure) {
            return CustomErrorWidget(onPressed: cubit.getAgentsAndDistributors);
          }
          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: state.agentsAndDistributorsList.length,
            itemBuilder: (BuildContext context, int index) => Builder(
              builder: (context) => AgentCard(
                agentModel: state.agentsAndDistributorsList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
