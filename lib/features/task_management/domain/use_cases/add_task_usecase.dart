import 'dart:io';

import 'package:collection/collection.dart';
import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/task_management/domain/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../model/usermodel.dart';

@injectable
class AddTaskUsecase extends UseCase<Result<ResponseWrapper<bool>>, AddTaskParams> {
  AddTaskUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(AddTaskParams params) {
    return repository.addTask(params.toMap);
  }
}

class AddTaskParams {
  final String title;
  final List<UserModel> participants;
  final UserModel assignTo;
  final DateTime startDate;
  final DateTime deadLineDate;
  final File file;
  final String regionId;
  final String departmentId;
  final bool? isRecurring;
  final String? recurringType;
  final String? numberOfRecurring;
  final String? groupId;
  final String? invoiceId;

  AddTaskParams({
    required this.title,
    required this.participants,
    required this.assignTo,
    required this.startDate,
    required this.deadLineDate,
    required this.file,
    required this.regionId,
    required this.departmentId,
    this.isRecurring,
    this.recurringType,
    this.numberOfRecurring,
    this.groupId,
    this.invoiceId,
  });

  Map<String, dynamic> get toMap {
    final Map<String, dynamic> map = {};
    participants.forEachIndexed((i, element) {
      map.addAll({'collaborator_employee_id[$i]': element.idUser});
    });
    return {
      'title': title,
      'file_path': file,
      "assigned_to": assignTo.idUser,
      'start_date': startDate.toIso8601String(),
      'deadline': deadLineDate.toIso8601String(),
      ...map,
      "invoice_id": invoiceId,
      "group_id": groupId,
      "recurring": isRecurring == true
          ? '1'
          : isRecurring == false
              ? '0'
              : null,
      'recurring_type': recurringType,
      'Number_Of_Recurring': numberOfRecurring,
      'assignment_type_from': 'user',
      'assigend_department_to': departmentId,
      'assigend_region_to': regionId,
    }..removeWhere((key, value) => value == null || value == '');
  }

  String dateToString(DateTime dateTime) =>
      dateTime.year.toString() + '-' + dateTime.month.toString() + '-' + dateTime.day.toString();
}
