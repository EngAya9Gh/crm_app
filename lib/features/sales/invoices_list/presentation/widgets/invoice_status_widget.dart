import 'package:flutter/material.dart';
import '../../../../../core/common/widgets/app_status_chip.dart';

enum StatusClient { subscriber, withdrawn, unsupported }

extension StatusClientExt on StatusClient {
  String get text {
    switch (this) {
      case StatusClient.subscriber:
        return "مشترك";
      case StatusClient.withdrawn:
        return "منسحب";
      case StatusClient.unsupported:
        return "غير معتمد بعد";
    }
  }

  Color get color {
    switch (this) {
      case StatusClient.subscriber:
        return Colors.green;
      case StatusClient.withdrawn:
        return Colors.redAccent;
      case StatusClient.unsupported:
        return Colors.orangeAccent;
    }
  }
}

Widget prepareStatusWidget({
  required bool isShowDeleted,
  required bool? isDeleted,
  required String? isApprove,
  required String? stateclient,
}) {
  if (isShowDeleted && isDeleted == true) {
    return AppStatusChip(
      status: 'محذوف',
      color: Colors.red,
    );
  }
  if (isApprove == '1' && stateclient == StatusClient.subscriber.text) {
    return AppStatusChip(
      status: StatusClient.subscriber.text,
      color: StatusClient.subscriber.color,
    );
  }
  if (isApprove != '1' && stateclient == StatusClient.unsupported.text) {
    return AppStatusChip(
      status: StatusClient.unsupported.text,
      color: StatusClient.unsupported.color,
    );
  }
  if (stateclient == StatusClient.withdrawn.text) {
    return AppStatusChip(
      status: StatusClient.withdrawn.text,
      color: StatusClient.withdrawn.color,
    );
  }
  return SizedBox.shrink();
}