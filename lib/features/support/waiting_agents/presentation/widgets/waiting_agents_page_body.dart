import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/config/navigator/app_routes_names.dart';
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
                    return AppLoader();
                  } else if (state.getWaitingAgentsStatus.isFailed()) {
                    return AppErrorWidget(
                      onPressed: () async => await cubit.getWaitingAgents(),
                    );
                  }
                  return Column(
                    children: [
                      10.height,
                      // clients count
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: (25.0).scaleWidth),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText("العدد"),
                            AppText("${cubit.waitingAgentsList.length}"),
                          ],
                        ),
                      ),
                      10.height,
                      Expanded(
                        child: AppPaginatedList(
                          items: cubit.waitingAgentsList,
                          itemBuilder: (context, index) {
                            return AgentCard(
                              tabIndex: 4,
                              agentModel: cubit.waitingAgentsList[index],
                              routName:
                                  AppRoutesNames.agentProfile.inWaitingAgents,
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
