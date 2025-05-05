import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../repositories/care_usage_repository.dart';

@lazySingleton
class GetCareUsageListUseCase {
  final CareUsageRepository repository;

  GetCareUsageListUseCase(this.repository);

  Future<Either<String, PaginationResponseWrapper>> call(
      GetCareUsageListParams params) async {
    return await repository.getCareUsageList(
      skip: params.skip,
      filter: params.filter,
      endFrom: params.endFrom,
      endTo: params.endTo,
      startFrom: params.startFrom,
      startTo: params.startTo,
      lastActivityFrom: params.lastActivityFrom,
      lastActivityTo: params.lastActivityTo,
      state: params.state,
      premium: params.premium,
      package: params.package,
      fkRegoin: params.fkRegoin,
      activityTypeFk: params.activityTypeFk,
      shouldCommunicate: params.shouldCommunicate,
    );
  }
}

class GetCareUsageListParams extends Equatable {
  final int? skip;
  final String? filter;
  final String? endFrom;
  final String? endTo;
  final String? startFrom;
  final String? startTo;
  final String? lastActivityFrom;
  final String? lastActivityTo;
  final String? state;
  final String? premium;
  final String? package;
  final int? fkRegoin;
  final int? activityTypeFk;
  final int? shouldCommunicate;

  const GetCareUsageListParams({
    this.skip,
    this.filter,
    this.endFrom,
    this.endTo,
    this.startFrom,
    this.startTo,
    this.lastActivityFrom,
    this.lastActivityTo,
    this.state,
    this.premium,
    this.package,
    this.fkRegoin,
    this.activityTypeFk,
    this.shouldCommunicate,
  });

  @override
  List<Object?> get props => [
        skip,
        filter,
        endFrom,
        endTo,
        startFrom,
        startTo,
        lastActivityFrom,
        lastActivityTo,
        state,
        premium,
        package,
        fkRegoin,
        activityTypeFk,
        shouldCommunicate,
      ];
}
