import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/data/models/ticket_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/elevation_model.dart';
import '../repositories/sys_support_rating_repo.dart';

@lazySingleton
class GetSystemRatingTicketsUseCase extends BaseUsecase<Result<ResponseWrapper<List<TicketModel>>>, GetOrAddSystemRatingTicktesParams> {
  GetSystemRatingTicketsUseCase(this._repository);

  final ElevationAcrossSystemRepo _repository;

  @override
  Future<Result<ResponseWrapper<List<TicketModel>>>> call(
    GetOrAddSystemRatingTicktesParams params,
  ) async {
    return await _repository.getSystemRatingTickets(params);
  }
}

class GetOrAddSystemRatingTicktesParams {
  final int ratingId;
final String? detailsProblem;
final String? typeProblem;

  const GetOrAddSystemRatingTicktesParams({
    required this.ratingId,
    this.detailsProblem,
    this.typeProblem,
  });

  
  Map<String, dynamic> toMapAdd() {
    return {
      'details_problem': this.detailsProblem,
      'type_problem': this.typeProblem,
    }..removeWhere((key, value) => value == null || value == 'null' || value == '');
  }

}
