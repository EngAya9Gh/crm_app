import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/api_utils.dart';
import 'package:crm_smart/features/auth/login/domain/use_cases/login_usecase.dart';
import 'package:crm_smart/features/home/domain/models/home_statistics_model.dart';
import 'package:crm_smart/features/home/presentation/pages/mob_home_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';

abstract class HomeRemoteDataSource {
  Future<ResponseWrapper<HomeStatisticsModel>> getHomeStatistices();
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices _apiServices;

  HomeRemoteDataSourceImpl(this._apiServices);

  @override
  Future<ResponseWrapper<HomeStatisticsModel>> getHomeStatistices() async {
    fun() async {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(endPoint: EndPoints.statistics);

      return ResponseWrapper<HomeStatisticsModel>(data: null, message: HomeStatisticsModel.fromJson(response));
    }

    return throwAppException(fun);
  }
}
