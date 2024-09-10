import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../../core/common/extensions/build_context.dart';
import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../data/models/agent_distributor_model.dart';
import '../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import '../pages/agent_distributor_profile_page.dart';
import '../pages/agents_distributors_actions_page.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({
    Key? key,
    required this.agentModel,
    this.tabIndex,
  }) : super(key: key);

  final AgentDistributorModel agentModel;
  final int? tabIndex;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsCubit>(context);
    return AppCardContainer(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      onTap: () {
        AppNavigator.go(AgentProfilePage(
          tabIndex: tabIndex,
          agent: agentModel,
        ));
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Slidable(
          key: ValueKey(agentModel.idAgent),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.35,
            children: [
              SlidableAction(
                onPressed: (actionContext) async {
                  await AppNavigator.go(
                    AgentDistributorsActionsPage(
                        agentDistributorModel: agentModel),
                  );
                  cubit.getAgentsAndDistributors();
                },
                backgroundColor: context.colorScheme.primaryContainer,
                foregroundColor: Colors.white,
                icon: Icons.edit_rounded,
                label: 'تعديل',
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      agentModel.nameAgent,
                      style: TextStyle(
                          fontSize: 14, fontFamily: AppFonts.fontFamily2),
                    ),
                  ),
                  Text(
                    agentModel.addDate != null
                        ? DateTime.tryParse(agentModel.addDate.toString()) !=
                                null
                            ? intl.DateFormat("dd MMMM yyyy, hh:mm a")
                                .format(DateTime.parse(agentModel.addDate!))
                            : agentModel.addDate.toString()
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.fontFamily2,
                        color: AppColors.primaryColor),
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
