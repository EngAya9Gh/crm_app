import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_filter_icon.dart';
import '../../../../../core/common/widgets/custom_search_widget.dart';
import '../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_bottom_sheet.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../clients_care/clients_attachments/presentation/widgets/filter_clients_attachments_sheet.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_card.dart';
import '../manager/waiting_agents/waiting_agents_cubit.dart';
import 'filter_waiting_agents_sheet.dart';

class WaitingAgentsPageBody extends StatelessWidget {
  const WaitingAgentsPageBody({super.key});

  static final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<WaitingAgentsCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomSearchWidget(
                  searchController: textController,
                  onChanged: (value) {
                    AppConstants.debounceFunction(
                      () {
                        cubit..changeFilter(cubit.state.getWaitingAgentsParams.copyWith(filter: () => value))..getWaitingAgents();
                      },
                      tag: "search_support_page",
                      isDebounced: true,
                    );
                  },
                ),
              ),
              CustomFilterIcon(
                onTap: () async {
                  await AppBottomSheet.show(
                    context: context,
                    child: FilterWaitingAgentSheet(
                      canReset: !(cubit.state.getWaitingAgentsParams.isEmpty()),
                    ),
                  ).then(
                    (value) => (value ?? false) ? null : cubit.changeFilter(cubit.state.getWaitingAgentsParams.copyWith(source: null)),
                  );
                },
              ),
              SizedBox(width: 8),
            ],
          ),
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
                        padding: EdgeInsets.symmetric(horizontal: (25.0).scaleWidth),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText("العدد"),
                            AppText("${cubit.waitingAgentsList.length}/${state.totalCount}"),
                          ],
                        ),
                      ),
                      10.height,
                      Expanded(
                        child: AppPaginatedList(
                          items: cubit.waitingAgentsList,
                          onLoadMore: () {
                            if (state.reachedMax) {
                              return () {};
                            }
                            return cubit
                              ..changeFilter(state.getWaitingAgentsParams.copyWith(page: state.getWaitingAgentsParams.page + 1))
                              ..getWaitingAgents();
                          },
                          itemBuilder: (context, index) {
                            return AgentCard(
                              tabIndex: 4,
                              agentModel: cubit.waitingAgentsList[index],
                              routName: AppRoutesNames.agentProfile.inWaitingAgents,
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
