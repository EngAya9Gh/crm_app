import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../data/models/TicketModel.dart';
import '../repositories/tickets_repo.dart';

@lazySingleton
class AddTicketUseCase
    extends UseCase<Either<String, TicketModel>, AddTicketParams> {
  AddTicketUseCase(this._repository);

  final TicketsRepo _repository;

  @override
  Future<Either<String, TicketModel>> call(AddTicketParams params) {
    return _repository.addTicket(params);
  }
}

class AddTicketParams {
  final String id;

  AddTicketParams({required this.id});
}
