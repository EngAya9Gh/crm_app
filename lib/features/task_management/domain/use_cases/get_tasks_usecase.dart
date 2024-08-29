import 'package:crm_smart/core/common/helpers/api_helper.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/helpers/responseWrapper.dart';
import '../../../../core/common/usecases/base_usecase.dart';
import '../repositories/task_repository.dart';

@injectable
class GetTasksUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetTaskParams> {
  GetTasksUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetTaskParams params,
  ) {
    return repository.getTasks(params);
  }
}

class GetTaskParams {
  final int skip;
  final int limit;
  final String? filter;
  final String? statusName;
  final String? assignedBy;
  final String? assignedTo;
  final String? departmentFrom;
  final String? departmentTo;
  final String? regionFrom;
  final String? regionTo;
  final DateTime? dateTimeCreated;
  final DateTime? startDateTo;
  final DateTime? startDateFrom;
  final String? createdBy;
  final String? myTasks;
  final String? myBranch;
  final String? myDepartment;

  GetTaskParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    this.filter,
    this.statusName,
    this.assignedBy,
    this.assignedTo,
    this.dateTimeCreated,
    this.startDateTo,
    this.startDateFrom,
    this.createdBy,
    this.regionFrom,
    this.regionTo,
    this.departmentFrom,
    this.departmentTo,
    this.myDepartment,
    this.myBranch,
    this.myTasks,
  });

  Map<String, dynamic> get toMap => {
        'skip': ApiHelper.calculatePage(skip: skip, limit: limit),
        'limit': limit,
        'filter': filter,
        'status_name': statusName,
        'assigned_by': assignedBy,
        'assigned_to': assignedTo,
        'date_time_created': dateTimeCreated?.toIso8601String(),
        'start_date_to':
            startDateTo != null ? startDateTo?.toIso8601String() : null,
        'start_date_from':
            startDateFrom != null ? startDateFrom?.toIso8601String() : null,
        'created_by': createdBy,
        'assigend_department_from': departmentFrom,
        'assigend_department_to': departmentTo,
        'assigend_region_from': regionFrom,
        'assigend_region_to': regionTo,
        'mytasks': myTasks,
        'mydepartment': myDepartment,
        'mybranch': myBranch,
      }..removeWhere((key, value) => value == '' || value == null);

  String dateToString(DateTime dateTime) =>
      dateTime.year.toString() +
      '-' +
      dateTime.month.toString().padLeft(2, '0') +
      '-' +
      dateTime.day.toString().padLeft(2, '0') +
      ' ' +
      dateTime.hour.toString().padLeft(2, '0') +
      ':' +
      dateTime.minute.toString().padLeft(2, '0') +
      ':' +
      dateTime.second.toString().padLeft(2, '0');
}
