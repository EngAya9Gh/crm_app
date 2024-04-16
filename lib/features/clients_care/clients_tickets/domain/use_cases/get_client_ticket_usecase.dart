import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../data/models/ticket_model.dart';
import '../repositories/tickets_repo.dart';

@lazySingleton
class GetClientTicketsUseCase
    extends UseCase<Either<String, TicketModel?>, GetClientTicketParams> {
  GetClientTicketsUseCase(this._repository);

  final TicketsRepo _repository;

  @override
  Future<Either<String, TicketModel?>> call(
      GetClientTicketParams params) async {
    return await _repository.getClientTicket(params);
  }
}

class GetClientTicketParams {
  final String clientId;

  GetClientTicketParams(this.clientId);
}
