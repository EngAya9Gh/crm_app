import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/config/theme/theme.dart';
import '../../../../core/utils/app_navigator.dart';
import '../pages/agents_distributors_actions_page.dart';

class AddAgentButton extends StatelessWidget {
  const AddAgentButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, color: AppColors.white),
      onPressed: () => AppNavigator.push(AgentDistributorsActionsPage()),
      backgroundColor: kMainColor,
    );
  }
}
