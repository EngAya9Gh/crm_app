import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/widgets/app_status_chip.dart';

enum StatusClient { subscriber, withdrawn, unsupported,restrictWithdrawn  }

extension StatusClientExt on StatusClient {
  String get text {
    switch (this) {
      case StatusClient.subscriber:
        return "مشترك";
      case StatusClient.withdrawn:
        return "منسحب";
      case StatusClient.unsupported:
        return "غير معتمد بعد";
        case StatusClient.restrictWithdrawn:
        return "منسحب مقيد";
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
      case StatusClient.restrictWithdrawn:
        return AppColors.secondaryMain;
    }
  }
}

Widget prepareStatusWidget({

  required bool? isDeleted,
  required String? isApprove,
  required String? stateclient,
}) {
  if (  isDeleted == true) {
    return AppStatusChip(
      status: 'محذوف',
      color: Colors.red,
    );
  }
 else if (isApprove == '1' && stateclient == StatusClient.subscriber.text) {
    return AppStatusChip(
      status: StatusClient.subscriber.text,
      color: StatusClient.subscriber.color,
    );
  }
  else if (isApprove != '1' && stateclient == StatusClient.unsupported.text) {
    return AppStatusChip(
      status: StatusClient.unsupported.text,
      color: StatusClient.unsupported.color,
    );
  }
  else if (stateclient == StatusClient.withdrawn.text) {
    return AppStatusChip(
      status: StatusClient.withdrawn.text,
      color: StatusClient.withdrawn.color,
    );
  }
  else if(stateclient==StatusClient.restrictWithdrawn.text){
    return AppStatusChip(
      status: StatusClient.restrictWithdrawn.text,
      color: StatusClient.restrictWithdrawn.color,
    );
  }
  return SizedBox.shrink();
}