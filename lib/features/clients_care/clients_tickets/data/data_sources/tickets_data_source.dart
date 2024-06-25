import '../../../../../core/errors/base_app_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/errors/server_exceptions.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/add_ticket_usecase.dart';
import '../../domain/use_cases/edit_ticket_type_usecase.dart';
import '../../domain/use_cases/get_client_ticket_usecase.dart';
import '../../domain/use_cases/get_ticket_by_id_usecase.dart';
import '../../domain/use_cases/transfer_ticket_usecase.dart';

abstract class TicketsDataSource {
  Future<dynamic> getTickets();

  Future<dynamic> getClientTicket(GetClientTicketParams params);

  Future<dynamic> getTicketById(GetTicketByIdParams params);

  Future<dynamic> editTicketType(EditTicketTypeParams params);

  Future<dynamic> addTicket(AddTicketParams params);

  Future<dynamic> transferTicket(TransferTicketParams params);
}

@LazySingleton(as: TicketsDataSource)
class TicketsDataSourceImpl implements TicketsDataSource {
  final ApiServices _api;

  TicketsDataSourceImpl(this._api);

  @override
  Future<dynamic> getTickets() async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.tickets.getTickets,
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      throw Left(e.message);
    }
  }

  @override
  Future<dynamic> getClientTicket(
    GetClientTicketParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: '${EndPoints.tickets.getClientTicket}${params.clientId}',
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      throw Left(e.message);
    }
  }

  @override
  Future<dynamic> getTicketById(GetTicketByIdParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: "${EndPoints.tickets.getTicketById}${params.id}",
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      throw Left(e.message);
    }
  }

  @override
  Future<dynamic> editTicketType(
    EditTicketTypeParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: "${EndPoints.tickets.editTicketType}${params.idTicket}",
        data: params.toMap(),
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<dynamic> addTicket(AddTicketParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: EndPoints.tickets.addTicket,
        data: params.toMap(),
      );
      return apiDataHandler(response);
    } on ServerException catch (e) {
      throw e.message;
    }
  }

  @override
  Future<dynamic> transferTicket(TransferTicketParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: "${EndPoints.tickets.transferTicket}${params.idTicket}",
        data: params.toMap(),
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      throw Left(e.message);
    }
  }
}
