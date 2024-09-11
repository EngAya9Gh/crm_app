import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../pages/action_user_page.dart';

class AddUserFloatingButton extends StatelessWidget {
  const AddUserFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (!context.read<PrivilegesCubit>().checkPrivilege('49')) {
      return SizedBox.shrink();
    }
    return FloatingActionButton(
      onPressed: () => AppNavigator.go(
        ActionUserPage(),
        name: AppRoutesNames.managementInternalRoutes.addUser,
      ),
      child: Icon(CupertinoIcons.add, color: AppColors.white),
      heroTag: "add user",
      backgroundColor: AppColors.primaryColor,
    );
  }
}
