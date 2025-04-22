import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/data/models/ticket_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/elevation_model.dart';
import '../repositories/sys_support_rating_repo.dart';

@lazySingleton
class GetSystemRatingTicketsUseCase extends BaseUsecase<Result<ResponseWrapper<List<TicketModel>>>, GetSystemRatingTicktesParams> {
  GetSystemRatingTicketsUseCase(this._repository);

  final ElevationAcrossSystemRepo _repository;

  @override
  Future<Result<ResponseWrapper<List<TicketModel>>>> call(
    GetSystemRatingTicktesParams params,
  ) async {
    return await _repository.getSystemRatingTickets(params);
  }
}

class GetSystemRatingTicktesParams {
  final int ratingId;

  const GetSystemRatingTicktesParams({
    required this.ratingId,
  });
}
