import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../pages/agents_distributors_actions_page.dart';

class AddAgentButton extends StatelessWidget {
  const AddAgentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: AppIcon(Icons.add),
      onPressed: () async {
        await AppNavigator.go(
          AgentDistributorsActionsPage(),
          name: AppRoutesNames.salesInternalRoutes.addAgent,
          isNew: false,
        );
      },
      backgroundColor: AppColors.primaryMain,
    );
  }
}
