import 'package:crm_smart/core/services/api/api_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../model/chartmodel.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../domain/repositories/recommended_client_reports_repo.dart';
import '../../domain/use_cases/get_recommended_client_reports_usecase.dart';
import '../data_sources/recommended_client_reports_datasource.dart';
import '../models/recommended_client_model.dart';

@LazySingleton(as: RecommendedClientsReportsRepo)
class RecommendedClientsReportsRepoImpl implements RecommendedClientsReportsRepo {
  final RecommendedClientReportsDatasource _dataSource;

  const RecommendedClientsReportsRepoImpl(this._dataSource);

  @override
  Future<Result<ResponseWrapper<List<RecommendClientsReports>>>> getRecommendClientsReports() async {
    return toApiResult(() => _dataSource.getRecommendedClientReports());
  }
}
