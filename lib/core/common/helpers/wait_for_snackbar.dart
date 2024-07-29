import 'dart:async';

import '../../utils/app_constants.dart';

Future<void> waitForSnackbar(
  int numberOfSnackbars,
  FutureOr<void> Function()? computation,
) async {
  final int totalTime = AppConstants.snackbarDuration * numberOfSnackbars + 1;
  return Future.delayed(
    Duration(seconds: totalTime),
    computation,
  );
}
