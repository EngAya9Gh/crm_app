import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../model/regoin_model.dart';
import '../../domain/repositories/regions_repository.dart';
import '../../domain/use_cases/get_regions_by_id_country_usecase.dart';
import '../data_sources/regions_datasource.dart';

@LazySingleton(as: RegionsRepository)
class RegionsRepositoryImpl implements RegionsRepository {
  final RegionsDatasource _datasource;

  const RegionsRepositoryImpl(this._datasource);

  @override
  Future<Either<String, List<RegionModel>>> getRegionsByIdCountry(
    GetRegionsByIdCountryParams params,
  ) async {
    try {
      final data = await _datasource.getRegionsByIdCountry(params);
      final List<RegionModel> regions = List<RegionModel>.from(
        data.map((e) => RegionModel.fromJson(e)),
      );

      return Right(regions);
    } catch (e) {
      debugPrint('error in getRegionsByIdCountry: $e');
      return Left(e.toString());
    }
  }
}
