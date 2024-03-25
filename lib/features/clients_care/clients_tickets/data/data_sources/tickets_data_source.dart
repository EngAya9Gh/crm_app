import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/api/exceptions.dart';
import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/utils/end_points.dart';
import '../../data/models/TicketModel.dart';
import '../../domain/use_cases/add_ticket_usecase.dart';
import '../../domain/use_cases/edit_ticket_type_usecase.dart';
import '../../domain/use_cases/get_ticket_by_id_usecase.dart';

abstract class TicketsDataSource {
  Future<Either<String, List<TicketModel>>> getTickets();

  Future<Either<String, TicketModel>> getTicketById(GetTicketByIdParams params);

  Future<Either<String, TicketModel>> editTicketType(
      EditTicketTypeParams params);

  Future<Either<String, TicketModel>> addTicket(AddTicketParams params);
}

@LazySingleton(as: TicketsDataSource)
class TicketsDataSourceImpl implements TicketsDataSource {
  final ApiServices _api;

  TicketsDataSourceImpl(this._api);

  @override
  Future<Either<String, TicketModel>> addTicket(AddTicketParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url_laravel);
      final response = await _api.post(
        endPoint: EndPoints.tickets.addTicket,
        data: params.toMap(),
      );
      final data = apiDataHandler(response);
      return Right(TicketModel.fromJson(data));
    } on AppException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, TicketModel>> editTicketType(
      EditTicketTypeParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url_laravel);
      final response = await _api.post(
        endPoint: "${EndPoints.tickets.editTicketType}${params.idTicket}",
        data: params.toMap(),
      );
      final data = apiDataHandler(response);
      return Right(TicketModel.fromJson(data));
    } on AppException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, List<TicketModel>>> getTickets() async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url_laravel);
      final response = await _api.get(
        endPoint: EndPoints.tickets.getTickets,
      );
      final data = apiDataHandler(response);
      return Right((data as List).map((e) => TicketModel.fromJson(e)).toList());
    } on AppException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, TicketModel>> getTicketById(
      GetTicketByIdParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.url_laravel);
      final response = await _api.get(
        endPoint: "${EndPoints.tickets.getTicketById}${params.id}",
      );
      final data = apiDataHandler(response);
      return Right(TicketModel.fromJson(data));
    } on AppException catch (e) {
      return Left(e.message);
    }
  }
}
