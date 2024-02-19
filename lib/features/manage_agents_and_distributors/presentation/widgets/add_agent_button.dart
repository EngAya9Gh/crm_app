import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/config/theme/theme.dart';
import '../../../../core/utils/app_navigator.dart';
import '../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import '../pages/agents_distributors_actions_page.dart';

class AddAgentButton extends StatelessWidget {
  const AddAgentButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsCubit>(context);
    return FloatingActionButton(
      child: Icon(Icons.add, color: AppColors.white),
      onPressed: () async => {
        await AppNavigator.push(AgentDistributorsActionsPage()),
        cubit.getAgentsAndDistributors(),
      },
      backgroundColor: kMainColor,
    );
  }
}
