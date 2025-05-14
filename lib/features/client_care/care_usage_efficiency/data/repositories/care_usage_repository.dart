import 'package:crm_smart/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../datasources/care_usage_remote_data_source.dart';
import '../models/care_usage_model.dart';
import '../../domain/repositories/care_usage_repository.dart';
import '../../domain/usecases/get_care_usage_list.dart';

@LazySingleton(as: CareUsageRepository)
class CareUsageRepositoryImpl implements CareUsageRepository {
  final CareUsageRemoteDataSource _dataSource;

  const CareUsageRepositoryImpl(this._dataSource);


  @override
  Future<Either<String, PaginationResponseWrapper>> getCareUsageList({
    int? skip,
    String? filter,
    String? endFrom,
    String? endTo,
    String? startFrom,
    String? startTo,
    String? lastActivityFrom,
    String? lastActivityTo,
    String? state,
    String? premium,
    List<String>  package=const[],
    int? fkRegoin,
    int? activityTypeFk,
    int? shouldCommunicate,
  }) async {
    try {
      final response = await _dataSource.getCareUsageList(
        GetCareUsageListParams(
          skip: skip,
          filter: filter,
          endFrom: endFrom,
          endTo: endTo,
          startFrom: startFrom,
          startTo: startTo,
          lastActivityFrom: lastActivityFrom,
          lastActivityTo: lastActivityTo,
          state: state,
          premium: premium,
          package: package,
          fkRegoin: fkRegoin,
          activityTypeFk: activityTypeFk,
          shouldCommunicate: shouldCommunicate,
        ),
      );

      return Right(response.copyWith(
        data: List<CareUsageModel>.from(
          (response.data as List).map((e) => CareUsageModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getCareUsageList in repo $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, CareUsageModel>> doneCommunication(int communicationId) async {
   try {
      final result = await _dataSource.doneCommunication(communicationId);
      return Right(result);
    } catch (e) {
      return Left(  e.toString() );
    }
  }


}
