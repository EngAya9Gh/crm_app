import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/config/theme/theme.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../ui/screen/agents_and_distributors/agents_and_distributors_action.dart';

class AddAgentButton extends StatelessWidget {
  const AddAgentButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, color: AppColors.white),
      onPressed: () => AppNavigator.push(AgentAndDistributorsAction()),
      backgroundColor: kMainColor,
    );
  }
}
