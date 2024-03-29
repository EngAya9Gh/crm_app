import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/ticket_model.dart';
import '../../domain/repositories/tickets_repo.dart';
import '../../domain/use_cases/add_ticket_usecase.dart';
import '../../domain/use_cases/edit_ticket_type_usecase.dart';
import '../../domain/use_cases/get_ticket_by_id_usecase.dart';
import '../data_sources/tickets_data_source.dart';

@LazySingleton(as: TicketsRepo)
class TicketsRepoImpl implements TicketsRepo {
  final TicketsDataSource _dataSource;

  TicketsRepoImpl(this._dataSource);

  Future<Either<String, List<TicketModel>>> getTickets() {
    return _dataSource.getTickets();
  }

  Future<Either<String, TicketModel>> getTicketById(
      GetTicketByIdParams params) {
    return _dataSource.getTicketById(params);
  }

  Future<Either<String, TicketModel>> editTicketType(
      EditTicketTypeParams params) {
    return _dataSource.editTicketType(params);
  }

  Future<Either<String, TicketModel>> addTicket(AddTicketParams params) {
    return _dataSource.addTicket(params);
  }
}
