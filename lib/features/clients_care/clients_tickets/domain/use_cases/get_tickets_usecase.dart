import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../data/models/ticket_model.dart';
import '../repositories/tickets_repo.dart';

@lazySingleton
class GetTicketsUseCase
    extends UseCase<Either<String, List<TicketModel>>, GetTicketsParams> {
  GetTicketsUseCase(this._repository);

  final TicketsRepo _repository;

  @override
  Future<Either<String, List<TicketModel>>> call(
      GetTicketsParams params) async {
    return await _repository.getTickets();
  }
}

class GetTicketsParams {}
