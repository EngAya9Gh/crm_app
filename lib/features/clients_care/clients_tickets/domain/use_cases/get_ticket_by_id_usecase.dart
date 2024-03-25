import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../data/models/TicketModel.dart';
import '../repositories/tickets_repo.dart';

@lazySingleton
class GetTicketByIdUseCase
    extends UseCase<Either<String, TicketModel>, GetTicketByIdParams> {
  GetTicketByIdUseCase(this._repository);

  final TicketsRepo _repository;

  @override
  Future<Either<String, TicketModel>> call(GetTicketByIdParams params) async {
    return await _repository.getTicketById(params);
  }
}

class GetTicketByIdParams {
  final String id;

  GetTicketByIdParams({required this.id});
}
