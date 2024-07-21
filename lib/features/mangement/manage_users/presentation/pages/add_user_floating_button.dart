import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/config/theme/theme.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import 'action_user_page.dart';

class AddUserFloatingButton extends StatelessWidget {
  const AddUserFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (!context.read<PrivilegeCubit>().checkPrivilege('49')) {
      return SizedBox.shrink();
    }
    return FloatingActionButton(
      onPressed: () => AppNavigator.push(ActionUserPage()),
      child: Icon(CupertinoIcons.add, color: AppColors.white),
      heroTag: "add user",
      backgroundColor: kMainColor,
    );
  }
}
