
import 'package:crm_smart/features/clients_care/violations_clienta_care/domain/use_cases/get_violation_types_usecase.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/domain/use_cases/update_violadtion_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart';
import '../../domain/repositories/violations_repository.dart';
import '../../domain/use_cases/get_all_management_usecase.dart';
import '../../domain/use_cases/get_violations_usecase.dart';
import '../data_sources/violations_clients_care_datasource.dart';
import '../models/management_model.dart';
import '../models/violation_type_model.dart';
import '../models/violations_model.dart';

@LazySingleton(as: ViolationsRepository)
class ViolationsRepositoryImpl implements ViolationsRepository {
  final ViolationsClientsCareDatasource _dataSource;

  const ViolationsRepositoryImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getViolations(
      GetViolationsParams params,
      ) async {
    try {
      final response = await _dataSource.getViolations(params);
      return Right(response.copyWith(
        data: List<ViolationModel>.from(
          response.data.map((e) => ViolationModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getWrongNumbers in repo $e");
      return Left(e.toString());
    }
  }

  @override
  Future<ResponseWrapper<ViolationModel>> updateViolation(UpdateViolationParams params) {
    return _dataSource.updateViolation(params);
  }
  @override
  Future<ResponseWrapper<List<ManagementModel>>> getAllManagements( GetManagementsParams params) {
    return _dataSource.getAllManagements(params);
  }
  @override
  Future<ResponseWrapper<List<ViolationType>>> getAllViolationsTypes( GetViolationsTypesParams params) {
    return _dataSource.getViolationTypes(params);
  }
}


