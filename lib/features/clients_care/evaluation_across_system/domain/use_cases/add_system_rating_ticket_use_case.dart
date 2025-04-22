import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/data/models/ticket_model.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/domain/use_cases/get_system_rating_tickets_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/elevation_model.dart';
import '../repositories/sys_support_rating_repo.dart';

@lazySingleton
class AddSystemRatingTicketsUseCase extends BaseUsecase<Result<ResponseWrapper<TicketModel>>, GetOrAddSystemRatingTicktesParams> {
  AddSystemRatingTicketsUseCase(this._repository);

  final ElevationAcrossSystemRepo _repository;

  @override
  Future<Result<ResponseWrapper<TicketModel>>> call(
    GetOrAddSystemRatingTicktesParams params,
  ) async {
    return await _repository.addSystemRatingTicket(params);
  }
}
