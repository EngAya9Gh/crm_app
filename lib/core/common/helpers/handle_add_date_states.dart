import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:flutter/material.dart';

import '../../utils/app_navigator.dart';
import '../models/page_state/bloc_status.dart';
import '../widgets/app_elevated_button.dart';

void handleAddDateStates({
  required BuildContext context,
  required BlocStatus state,
  required VoidCallback onPressed,
  VoidCallback? onSuccess,
}) {
  if (state.isLoading() || state.isInitial()) {
    return;
  }
  if (state.isFailed()) {
    if (state.error == 'warning') {
      showDialog(
        context: context,
        builder: (context) => _showWarningDialog(
          context,
          onPressed: onPressed,
        ),
      );
    } else if (state.error == 'refused') {
      AppSnackbar.showSnakeBar('لديك موعد اخر في نفس الوقت');
    } else if (state.error == "cannot cancel install") {
      AppSnackbar.showSnakeBar('لا يمكن اعادة العميل للانتظار');
    } else {
      AppSnackbar.showSnakeBar(state.error.toString());
    }
    return;
  }
  onSuccess?.call();
}

AlertDialog _showWarningDialog(BuildContext context,
    {VoidCallback? onPressed}) {
  return AlertDialog(
    title: const Text('تأكيد'),
    content: const Text('لديك موعد اخر في وقت قريب، هل تريد الاستمرار؟'),
    actions: [
      AppElevatedButton(
        onPressed: () => AppNavigator.pop(),
        child: const Text('لا'),
      ),
      AppElevatedButton(
        onPressed: onPressed,
        child: const Text('نعم'),
      ),
    ],
  );
}
