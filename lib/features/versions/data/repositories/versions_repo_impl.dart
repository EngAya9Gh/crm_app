import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart';
import 'package:crm_smart/features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart';
import 'package:crm_smart/model/versionModel.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../core/services/api/api_utils.dart';
import '../../../../model/notificationModel.dart';
import '../../domain/repositories/versions_repo.dart';
import '../../domain/use_cases/add_version_usecase.dart';
import '../../domain/use_cases/get_versions_usecase.dart';
import '../data_sources/versions_datasource.dart';

@LazySingleton(as: versionsRepo)
class NotificationsRepoImpl implements versionsRepo {
  final NotificationsDatasource _dataSource;

  const NotificationsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getVersions(
    GetVersionsParams params,
  ) async {
    try {
      final data = await _dataSource.getVersions(params);
      return Right(data.copyWith(
        data: List<VersionModel>.from(
          data.data.map((e) => VersionModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getNotifications in repo => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> addVersion(AddVersionPramas params) async{
    try {
      final data = await _dataSource.addVersion(params);
      return Right(data);
    } catch (e) {
      debugPrint("error in getNotifications in repo => $e");
      return Left(e.toString());
    }

    // return toApiResult(() => _dataSource.addVersion(params));
  }
}
