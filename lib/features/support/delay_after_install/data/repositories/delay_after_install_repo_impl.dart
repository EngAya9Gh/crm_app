import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/invoiceModel.dart';
import '../../domain/repositories/delay_after_install_repo.dart';
import '../../domain/use_cases/get_delay_after_install_use_case.dart';
import '../data_sources/get_delay_after_install_datasource.dart';

@LazySingleton(as: DelayAfterInstallRepo)
class DelayAfterInstallRepoImpl implements DelayAfterInstallRepo {
  final DelayAfterInstallDatasource _dataSource;

  const DelayAfterInstallRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getDelayAfterInstall(
    GetDelayAfterInstallParams params,
  ) async {
    try {
      final response = await _dataSource.getDelayAfterInstall(params);
      return Right(response.copyWith(
        data: List<InvoiceModel>.from(
          response.data.map((e) => InvoiceModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getDelayAfterInstall $e");
      return Left(e.toString());
    }
  }
}
