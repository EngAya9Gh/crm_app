import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../data/models/ticket_model.dart';
import '../repositories/tickets_repo.dart';

@lazySingleton
class AddTicketUseCase
    extends UseCase<Either<String, TicketModel>, AddTicketParams> {
  AddTicketUseCase(this._repository);

  final TicketsRepo _repository;

  @override
  Future<Either<String, TicketModel>> call(AddTicketParams params) async {
    return await _repository.addTicket(params);
  }
}

class AddTicketParams {
  final String fkClient;
  final String typeProblem;
  final String detailsProblem;
  final String ticketSource;
  final String clientType;
  final String notes;

  AddTicketParams({
    required this.fkClient,
    required this.typeProblem,
    required this.detailsProblem,
    required this.ticketSource,
    required this.clientType,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      "fk_client": fkClient,
      "type_problem": typeProblem,
      "details_problem": detailsProblem,
      "ticket_source": ticketSource,
      "client_type": clientType,
      "notes": notes,
    };
  }
}
