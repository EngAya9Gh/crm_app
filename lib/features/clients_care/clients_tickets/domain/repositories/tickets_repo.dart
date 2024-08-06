import 'package:dartz/dartz.dart';

import '../../data/models/ticket_model.dart';
import '../use_cases/add_ticket_usecase.dart';
import '../use_cases/edit_ticket_type_usecase.dart';
import '../use_cases/get_client_ticket_usecase.dart';
import '../use_cases/get_ticket_by_id_usecase.dart';
import '../use_cases/get_tickets_usecase.dart';
import '../use_cases/transfer_ticket_usecase.dart';

abstract class TicketsRepo {
  Future<Either<String, List<TicketModel>>> getTickets(GetTicketsParams params);

  Future<Either<String, TicketModel?>> getClientTicket(
      GetClientTicketParams params);

  Future<Either<String, TicketModel>> getTicketById(GetTicketByIdParams params);

  Future<Either<String, TicketModel>> editTicketType(
      EditTicketTypeParams params);

  Future<Either<String, TicketModel>> addTicket(AddTicketParams params);

  Future<Either<String, dynamic>> transferTicket(TransferTicketParams params);
}
