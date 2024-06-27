import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../core/utils/responsive_padding.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_card.dart';
import '../manager/waiting_agents/waiting_agents_cubit.dart';

class WaitingAgentsPageBody extends StatelessWidget {
  const WaitingAgentsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<WaitingAgentsCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => await cubit.getWaitingAgents(),
              child: BlocBuilder<WaitingAgentsCubit, WaitingAgentsState>(
                builder: (context, state) {
                  if (state.getWaitingAgentsStatus.isLoading()) {
                    return CustomLoadingIndicator();
                  } else if (state.getWaitingAgentsStatus.isFailed()) {
                    return CustomErrorWidget(
                      onPressed: () async => await cubit.getWaitingAgents(),
                    );
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
                            AppText("${cubit.waitingAgentsList.length}"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(10.0),
                          itemCount: cubit.waitingAgentsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AgentCard(
                              tabIndex: 4,
                              agentModel: cubit.waitingAgentsList[index],
                            );
                          },
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
