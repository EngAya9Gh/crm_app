import 'dart:io';
import 'package:collection/collection.dart';
import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/task_management/domain/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../model/usermodel.dart';
import '../../data/models/user_region_department.dart';

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
  final String? title;
  final List<UserModel> participants;
  final UserRegionDepartment? assignTo;
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
  final String userId;
  final String description;
  final String? clientId;
  final String? mainTypeTask;
  final String? publicType;

  AddTaskParams({
    required this.title,
    required this.description,
    required this.userId,
    required this.participants,
    this.assignTo,
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
      "assigned_to": assignTo?.idUser.toString(),
      'start_date': startDate?.toIso8601String(),
      'deadline': deadLineDate?.toIso8601String(),
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
      'public_Type': publicType,
    }..removeWhere((key, value) => value == null || value == '');
  }

  String dateToString(DateTime dateTime) =>
      dateTime.year.toString() + '-' + dateTime.month.toString() + '-' + dateTime.day.toString();
}
