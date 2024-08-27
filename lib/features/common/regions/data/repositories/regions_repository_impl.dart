import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/location/region_model.dart';
import '../../domain/repositories/regions_repository.dart';
import '../../domain/use_cases/get_regions_use_case.dart';
import '../data_sources/regions_datasource.dart';

@LazySingleton(as: RegionsRepository)
class RegionsRepositoryImpl implements RegionsRepository {
  final RegionsDatasource datasource;

  RegionsRepositoryImpl(this.datasource);

  Future<Either<String, PaginationResponseWrapper>> getRegions(
    GetRegionsParams params,
  ) async {
    try {
      final result = await datasource.getRegions(params);
      return Right(result.copyWith(
        data: List<RegionModel>.from(result.data.map((e) {
          return RegionModel.fromJson(e);
        })),
      ));
    } catch (e) {
      debugPrint("error in getRegions in repo: ${e}");
      return Left(e.toString());
    }
  }
}
