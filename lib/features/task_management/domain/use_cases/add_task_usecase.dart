import 'dart:io';

import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/services/api/result.dart';
import '../../../../model/usermodel.dart';
import '../../data/models/user_region_department.dart';
import '../repositories/task_repository.dart';

@injectable
class AddTaskUsecase extends BaseUsecase<Result<ResponseWrapper<bool>>, AddOrUpdateTaskParams> {
  AddTaskUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(AddOrUpdateTaskParams params) {
    return repository.addTask(params.toMap);
  }
}

class AddOrUpdateTaskParams {
  final int? taskId;
  final String? title;
  final List<UserModel> participants;
  final String? assignTo;
  final String? assignToId;
  final String? assignFrom;
  final String? assignFromId;
  final DateTime? startDate;
  final DateTime? deadLineDate;
  final File? file;
  final String? regionId;
  final String? departmentId;
  final bool? isRecurring;
  final String? recurringType;
  final String? numberOfRecurring;
  final String? groupId;
  final String? invoiceId;
  final String? userId;
  final String description;
  final String? clientId;
  final String? mainTypeTask;
  final String? publicType;

  AddOrUpdateTaskParams({
    this.taskId,
    required this.title,
    required this.description,
    required this.userId,
    required this.participants,
    this.assignTo,
    this.assignToId,
    this.assignFrom,
    this.assignFromId,
    this.startDate,
    this.deadLineDate,
    this.file,
    this.regionId,
    this.departmentId,
    this.isRecurring,
    this.recurringType,
    this.numberOfRecurring,
    this.groupId,
    this.invoiceId,
    this.clientId,
    this.mainTypeTask,
    this.publicType,
  });

  Map<String, dynamic> get toMap {
    final Map<String, dynamic> map = {};
    participants.forEachIndexed((i, element) {
      map.addAll({'collaborator_employee_id[$i]': element.idUser});
    });
    return {
      'title': title,
      'file_path': file,
      "assign_to_id": assignToId,
      "assign_to": assignTo,
      "assign_from": assignFrom,
      "assign_from_id": assignFromId,
      'start_date': startDate != null ? DateFormat('yyyy-MM-dd HH:mm:ss').format(startDate!) : null,
      'deadline': deadLineDate != null ? DateFormat('yyyy-MM-dd HH:mm:ss').format(deadLineDate!) : null,
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
      'id_user': userId,
      'description': description,
      'client_id': clientId,
      'main_type_task': mainTypeTask,
      'code': publicType,
    }..removeWhere((key, value) => value == null || value == '');
  }

  String dateToString(DateTime dateTime) => dateTime.year.toString() + '-' + dateTime.month.toString() + '-' + dateTime.day.toString();
}
