import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../pages/agents_distributors_actions_page.dart';

class AddAgentButton extends StatelessWidget {
  const AddAgentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, color: AppColors.white),
      onPressed: () async => {
        await AppNavigator.push(AgentDistributorsActionsPage()),
        // cubit.getAgentsAndDistributors(),
      },
      backgroundColor: AppColors.kMainColor,
    );
  }
}
