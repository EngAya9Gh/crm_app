import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../model/communication_modle.dart';
import '../../domain/repositories/greeting_communication_repo.dart';
import '../../domain/use_cases/get_greeting_communication_use_case.dart';
import '../data_sources/greeting_communication_datasource.dart';

@LazySingleton(as: GreetingCommunicationRepo)
class GreetingCommunicationRepoImpl implements GreetingCommunicationRepo {
  final GreetingCommunicationDatasource _dataSource;

  const GreetingCommunicationRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getGreetingCommunication(
    GetGreetingCommunicationParams params,
  ) async {
    try {
      final response = await _dataSource.getGreetingCommunication(params);
      return Right(response.copyWith(
        data: List<CommunicationModel>.from(
          response.data.map((e) => CommunicationModel.fromJson(e)),
        )..where((element) => element.typeCommuncation == "ترحيب").toList(),
      ));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint("error in getGreetingCommunication in repo $e");
      return Left(e.toString());
    }
  }
}
