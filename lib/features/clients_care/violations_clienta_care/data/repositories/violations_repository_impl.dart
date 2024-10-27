
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart';
import '../../domain/repositories/violations_repository.dart';
import '../../domain/use_cases/get_violations_usecase.dart';
import '../data_sources/violations_clients_care_datasource.dart';
import '../models/violations_model.dart';

@LazySingleton(as: ViolationsRepository)
class ViolationsRepositoryImpl implements ViolationsRepository {
  final VioltionsClientsCareDatasource _dataSource;

  const ViolationsRepositoryImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getViolations(
      GetViolationsParams params,
      ) async {
    try {
      final response = await _dataSource.getVioltions(params);
      return Right(response.copyWith(
        data: List<Violations_Model>.from(
          response.data.map((e) => Violations_Model.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getWrongNumbers in repo $e");
      return Left(e.toString());
    }
  }
}

