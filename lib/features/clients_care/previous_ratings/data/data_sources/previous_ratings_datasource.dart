import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_previous_ratings_usecase.dart';

abstract class PreviousRatingsDatasource {
  Future<PaginationResponseWrapper> getPreviousRatings(
    GetPreviousRatingsParams params,
  );
}

@LazySingleton(as: PreviousRatingsDatasource)
class PreviousRatingsDatasourceImpl implements PreviousRatingsDatasource {
  final ApiServices _api;

  const PreviousRatingsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getPreviousRatings(
    GetPreviousRatingsParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.care.previousRatings,
        queryParameters: params.toParams(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getPreviousRatings in datasource => $e");
      throw e.message;
    }
  }
}
