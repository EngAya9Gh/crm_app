import 'package:dartz/dartz.dart';

import '../../data/models/TicketModel.dart';
import '../use_cases/add_ticket_usecase.dart';
import '../use_cases/edit_ticket_type_usecase.dart';
import '../use_cases/get_ticket_by_id_usecase.dart';

abstract class TicketsRepo {
  Future<Either<String, List<TicketModel>>> getTickets();

  Future<Either<String, TicketModel>> getTicketById(GetTicketByIdParams params);

  Future<Either<String, TicketModel>> editTicketType(
      EditTicketTypeParams params);

  Future<Either<String, TicketModel>> addTicket(AddTicketParams params);
}
