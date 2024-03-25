import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../data/models/TicketModel.dart';
import '../repositories/tickets_repo.dart';

@lazySingleton
class EditTicketTypeUseCase
    extends UseCase<Either<String, TicketModel>, EditTicketTypeParams> {
  EditTicketTypeUseCase(this._repository);

  final TicketsRepo _repository;

  @override
  Future<Either<String, TicketModel>> call(EditTicketTypeParams params) {
    return _repository.editTicketType(params);
  }
}

class EditTicketTypeParams {
  final String id;

  EditTicketTypeParams({required this.id});
}
