import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/communication_modle.dart';
import '../../domain/repositories/previous_ratings_repo.dart';
import '../../domain/use_cases/get_previous_ratings_usecase.dart';
import '../data_sources/previous_ratings_datasource.dart';

@LazySingleton(as: PreviousRatingsRepo)
class PreviousRatingsRepoImpl implements PreviousRatingsRepo {
  final PreviousRatingsDatasource _dataSource;

  const PreviousRatingsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getPreviousRatings(
    GetPreviousRatingsParams params,
  ) async {
    try {
      final response = await _dataSource.getPreviousRatings(params);
      return Right(response.copyWith(
        data: List<CommunicationModel>.from(
          response.data.map((e) => CommunicationModel.fromJson(e)),
        ),
      ));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint("error in getPreviousRatings in repo $e");
      return Left(e.toString());
    }
  }
}
