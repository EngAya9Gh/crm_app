import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/errors/server_exceptions.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../data/models/ticket_model.dart';
import '../../domain/use_cases/add_ticket_usecase.dart';
import '../../domain/use_cases/edit_ticket_type_usecase.dart';
import '../../domain/use_cases/get_client_ticket_usecase.dart';
import '../../domain/use_cases/get_ticket_by_id_usecase.dart';
import '../../domain/use_cases/transfer_ticket_usecase.dart';

abstract class TicketsDataSource {
  Future<Either<String, List<TicketModel>>> getTickets();

  Future<Either<String, TicketModel?>> getClientTicket(
      GetClientTicketParams params);

  Future<Either<String, TicketModel>> getTicketById(GetTicketByIdParams params);

  Future<Either<String, TicketModel>> editTicketType(
      EditTicketTypeParams params);

  Future<Either<String, TicketModel>> addTicket(AddTicketParams params);

  Future<Either<String, dynamic>> transferTicket(TransferTicketParams params);
}

@LazySingleton(as: TicketsDataSource)
class TicketsDataSourceImpl implements TicketsDataSource {
  final ApiServices _api;

  TicketsDataSourceImpl(this._api);

  @override
  Future<Either<String, TicketModel>> addTicket(AddTicketParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: EndPoints.tickets.addTicket,
        data: params.toMap(),
      );
      final data = apiDataHandler(response);
      return Right(TicketModel.fromMap(data));
    } on ServerException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, TicketModel>> editTicketType(
      EditTicketTypeParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: "${EndPoints.tickets.editTicketType}${params.idTicket}",
        data: params.toMap(),
      );
      final data = apiDataHandler(response);
      return Right(TicketModel.fromMap(data));
    } on ServerException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, List<TicketModel>>> getTickets() async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.tickets.getTickets,
      );
      final data = apiDataHandler(response);
      return Right((data as List).map((e) => TicketModel.fromMap(e)).toList());
    } on ServerException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, TicketModel?>> getClientTicket(
      GetClientTicketParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: '${EndPoints.tickets.getClientTicket}${params.clientId}',
      );
      final Map data = apiDataHandler(response);
      if (data.isEmpty) return Right(null);
      return Right(TicketModel.fromMap(data));
    } on ServerException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, TicketModel>> getTicketById(
      GetTicketByIdParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: "${EndPoints.tickets.getTicketById}${params.id}",
      );
      final data = apiDataHandler(response);
      return Right(TicketModel.fromMap(data));
    } on ServerException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, dynamic>> transferTicket(
      TransferTicketParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);

      return Right(_api.post(
        endPoint: "${EndPoints.tickets.transferTicket}${params.idTicket}",
        data: params.toMap(),
      ));
    } on ServerException catch (e) {
      return Left(e.message);
    }
  }
}
