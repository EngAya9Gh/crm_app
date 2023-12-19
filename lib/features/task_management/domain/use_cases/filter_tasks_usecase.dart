import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:crm_smart/features/task_management/domain/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FilterTaskUsecase extends UseCase<Result<ResponseWrapper<List<TaskModel>>>, FilterTaskParams> {
  FilterTaskUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<List<TaskModel>>>> call(FilterTaskParams params) =>
      repository.filterTasks(params.toMap);
}

class FilterTaskParams {
  FilterTaskParams({
    this.statusName,
    this.assignedBy,
    this.assignedTo,
    this.dateTimeCreated,
    this.startDateTo,
    this.startDateFrom,
    this.createdBy,
  });

  final String? statusName;
  final String? assignedBy;
  final String? assignedTo;
  final DateTime? dateTimeCreated;
  final DateTime? startDateTo;
  final DateTime? startDateFrom;
  final DateTime? createdBy;

  Map<String, dynamic> get toMap => {
        'status_name': statusName,
        'assigned_by': assignedBy,
        'assigned_to': assignedTo,
        'date_time_created': dateTimeCreated?.toIso8601String(),
        'start_date_to': startDateTo != null ? dateToString(startDateTo!) : null,
        'start_date_from': startDateFrom != null ? dateToString(startDateFrom!) : null,
        'created_by': createdBy?.toIso8601String(),
      }..removeWhere((key, value) => value == '' || value == null);

  String dateToString(DateTime dateTime) =>
      dateTime.year.toString() +
      '-' +
      dateTime.month.toString() +
      '-' +
      dateTime.day.toString() +
      ' ' +
      dateTime.hour.toString().padLeft(2, '0') +
      ':' +
      dateTime.minute.toString().padLeft(2, '0') +
      ':' +
      dateTime.second.toString().padLeft(2, '0') ;
}
