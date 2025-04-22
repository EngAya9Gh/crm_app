import 'package:crm_smart/features/clients_care/clients_tickets/data/models/ticket_model.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/domain/use_cases/get_system_rating_tickets_use_case.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/elevation_model.dart';
import '../use_cases/get_elevation_sys_support_use_case.dart';

abstract class ElevationAcrossSystemRepo {
  Future<Result<ResponseWrapper<List<ElevationModel>>>> getRating(GetRatingParams params);
  Future<Result<ResponseWrapper<List<TicketModel>>>> getSystemRatingTickets(GetOrAddSystemRatingTicktesParams params);
  Future<Result<ResponseWrapper<TicketModel>>> addSystemRatingTicket(GetOrAddSystemRatingTicktesParams params);
}
