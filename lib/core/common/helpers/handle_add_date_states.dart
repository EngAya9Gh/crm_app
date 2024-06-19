import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:flutter/material.dart';

void handleAddDateStates({
  required BuildContext context,
  required BlocStatus state,
  required VoidCallback onPressed,
  VoidCallback? onSuccess,
}) {
  if (state.isLoading() || state.isInitial()) {
    return;
  }
  if (state.isFail()) {
    if (state.error == 'warning') {
      showDialog(
        context: context,
        builder: (context) => _showWarningDialog(
          context,
          onPressed: onPressed,
        ),
      );
    } else if (state.error == 'refused') {
      AppConstants.showSnakeBar(context, 'لديك موعد اخر في نفس الوقت');
    } else {
      AppConstants.showSnakeBar(context, state.error.toString());
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
