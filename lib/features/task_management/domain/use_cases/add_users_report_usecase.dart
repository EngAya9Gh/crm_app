import 'dart:io';

import 'package:collection/collection.dart';
import 'package:crm_smart/features/task_management/data/models/users_report_model.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/services/api/result.dart';
import '../../../../model/usermodel.dart';
import '../../data/models/user_region_department.dart';
import '../repositories/task_repository.dart';

@injectable
class GetUsersReportsTaskUsecase extends BaseUsecase<Result<ResponseWrapper<List<UserReportModel>>>, GetUsersReportsParams> {
  GetUsersReportsTaskUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<List<UserReportModel>>>> call(GetUsersReportsParams params) {
    return repository.getUsersReports(params);
  }
}

class GetUsersReportsParams {
  final int page;
  final int limit;
  final String? filter;
  final String? type_administration;
  final String? fk_regoin;

  const GetUsersReportsParams({
    required this.page,
    this.limit = 15,
    this.filter,
    this.type_administration,
    this.fk_regoin,
  });




  Map<String, dynamic> toMap() {
    return {
      'page': this.page,
      'limit': this.limit,
      'filter': this.filter,
      'type_administration': this.type_administration,
      'fk_regoin': this.fk_regoin,
    }..removeWhere(
        (key, value) => value == null || value == '',
      );
  }

  GetUsersReportsParams copyWith({
    int? page,
    int? limit,
    String? filter,
    String? type_administration,
    String? fk_regoin,
  }) {
    return GetUsersReportsParams(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      filter: filter ?? this.filter,
      type_administration: type_administration ?? this.type_administration,
      fk_regoin: fk_regoin ?? this.fk_regoin,
    );
  }
}
