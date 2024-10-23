import 'package:flutter/material.dart';

import '../../../features/task_management/presentation/manager/task_cubit.dart';

Color getColorForStatus({TaskStatusType? status,String? name}) {
  if(name!=null){
    switch (name) {
      case "recieve":
        return Colors.blue;
      case "Evaluated":
        return Colors.orange;
      case "Completed":
        return Colors.green;
      case "Open":
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
  switch (status) {
    case TaskStatusType.receive:
      return Colors.blue;
    case TaskStatusType.Evaluated:
      return Colors.orange;
    case TaskStatusType.Completed:
      return Colors.green;
    case TaskStatusType.Open:
      return Colors.purple;
    default:
      return Colors.grey;
  }
}
