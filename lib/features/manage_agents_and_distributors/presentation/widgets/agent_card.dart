import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../model/agent_distributor_model.dart';
import '../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import '../pages/agents_distributors_actions_page.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({
    Key? key,
    required this.agentModel,
  }) : super(key: key);

  final AgentDistributorModel agentModel;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: InkWell(
          onTap: () async {
            await AppNavigator.push(
              AgentDistributorsActionsPage(agentDistributorModel: agentModel),
            );
            cubit.getAgentsAndDistributors();
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 8.0,
                  color: Colors.black87.withOpacity(0.2),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Center(
                    child: Text(
                      agentModel.nameAgent,
                      style: TextStyle(fontSize: 14, fontFamily: kfontfamily2),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
