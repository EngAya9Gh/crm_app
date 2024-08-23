import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/location/branch_model.dart';
import '../../domain/repositories/branches_repository.dart';
import '../../domain/use_cases/get_branches_by_id_country_use_case.dart';
import '../data_sources/branches_datasource.dart';

@LazySingleton(as: BranchesRepository)
class BranchesRepositoryImpl implements BranchesRepository {
  final BranchesDatasource _datasource;

  const BranchesRepositoryImpl(this._datasource);

  @override
  Future<Either<String, List<BranchModel>>> getBranchesByIdCountry(
    GetBranchesByIdCountryParams params,
  ) async {
    try {
      final data = await _datasource.getBranchesByIdCountry(params);
      final List<BranchModel> branches = List<BranchModel>.from(
        data.map((e) => BranchModel.fromJson(e)),
      );

      return Right(branches);
    } catch (e) {
      debugPrint('error in getBranchesByIdCountry: $e');
      return Left(e.toString());
    }
  }
}
