import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/api_utils.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/data/models/ticket_model.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/domain/use_cases/get_system_rating_tickets_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../../model/communication_modle.dart';
import '../../domain/repositories/sys_support_rating_repo.dart';
import '../../domain/use_cases/get_elevation_sys_support_use_case.dart';
import '../data_sources/sys_support_rating_datasource.dart';
import '../models/elevation_model.dart';

@LazySingleton(as: ElevationAcrossSystemRepo)
class ElevationAcrossSystemRepoImpl implements ElevationAcrossSystemRepo {
  final ElevationAcrossSystemDatasource _dataSource;

  const ElevationAcrossSystemRepoImpl(this._dataSource);

  @override
  Future<Result<ResponseWrapper<List<ElevationModel>>>> getRating(GetRatingParams params) {
    return toApiResult(() async => _dataSource.getRating(params));
  }

  @override
  Future<Result<ResponseWrapper<List<TicketModel>>>> getSystemRatingTickets(GetSystemRatingTicktesParams params) {
    return toApiResult(() async => _dataSource.systemRatingTickets(params));
  }

  @override
  Future<Result<ResponseWrapper<TicketModel>>> addSystemRatingTicket(GetSystemRatingTicktesParams params) {
    return toApiResult(() async => _dataSource.addSystemRatingTicket(params));
  }
}
