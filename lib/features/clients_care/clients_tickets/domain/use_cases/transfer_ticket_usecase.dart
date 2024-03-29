import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../repositories/tickets_repo.dart';

@lazySingleton
class TransferTicketUseCase
    extends UseCase<Either<String, dynamic>, TransferTicketParams> {
  TransferTicketUseCase(this._repository);

  final TicketsRepo _repository;

  @override
  Future<Either<String, dynamic>> call(TransferTicketParams params) async {
    return await _repository.transferTicket(params);
  }
}

class TransferTicketParams {
  final String idTicket;
  final String reasonTransfer;
  final String fkUserTo;

  TransferTicketParams({
    required this.idTicket,
    required this.reasonTransfer,
    required this.fkUserTo,
  });

  Map<String, dynamic> toMap() {
    return {
      "ReasonTransfer": reasonTransfer,
      "fkuser_to": fkUserTo,
    };
  }
}
