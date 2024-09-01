import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/communication_modle.dart';
import '../../domain/repositories/wrong_numbers_repo.dart';
import '../../domain/use_cases/get_wrong_numbers_usecase.dart';
import '../data_sources/wrong_numbers_datasource.dart';

@LazySingleton(as: WrongNumbersRepo)
class WrongNumbersRepoImpl implements WrongNumbersRepo {
  final WrongNumbersDatasource _dataSource;

  const WrongNumbersRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getWrongNumbers(
    GetWrongNumbersParams params,
  ) async {
    try {
      final response = await _dataSource.getWrongNumbers(params);
      return Right(response.copyWith(
        data: List<CommunicationModel>.from(
          response.data.map((e) => CommunicationModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getWrongNumbers in repo $e");
      return Left(e.toString());
    }
  }
}
