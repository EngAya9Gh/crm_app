import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/client_model.dart';
import '../../data/models/ticket_model.dart';
import '../../domain/repositories/tickets_repo.dart';
import '../../domain/use_cases/add_ticket_usecase.dart';
import '../../domain/use_cases/edit_ticket_type_usecase.dart';
import '../../domain/use_cases/get_client_ticket_usecase.dart';
import '../../domain/use_cases/get_ticket_by_id_usecase.dart';
import '../../domain/use_cases/transfer_ticket_usecase.dart';
import '../data_sources/tickets_data_source.dart';

@LazySingleton(as: TicketsRepo)
class TicketsRepoImpl implements TicketsRepo {
  final TicketsDataSource _dataSource;

  TicketsRepoImpl(this._dataSource);

  @override
  Future<Either<String, List<TicketModel>>> getTickets() async {
    try {
      final data = await _dataSource.getTickets();
      return Right((data as List).map((e) => TicketModel.fromMap(e)).toList());
    } catch (e) {
      debugPrint("error in getTickets => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, TicketModel?>> getClientTicket(
    GetClientTicketParams params,
  ) async {
    try {
      final Map data = await _dataSource.getClientTicket(params);
      if (data.isEmpty) return Right(null);
      return Right(TicketModel.fromMap(data));
    } catch (e) {
      debugPrint("error in getClientTicket => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, TicketModel>> getTicketById(
    GetTicketByIdParams params,
  ) async {
    try {
      final data = await _dataSource.getTicketById(params);
      return Right(TicketModel.fromMap(data));
    } catch (e) {
      debugPrint("error in getTicketById => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, TicketModel>> editTicketType(
    EditTicketTypeParams params,
  ) async {
    try {
      final data = await _dataSource.editTicketType(params);
      return Right(TicketModel.fromMap(data));
    } catch (e) {
      debugPrint("error in editTicketType => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, TicketModel>> addTicket(AddTicketParams params) async {
    try {
      final data = await _dataSource.addTicket(params);
      return Right(TicketModel.fromMap(data));
    } catch (e) {
      debugPrint("error in addTicket => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> transferTicket(
    TransferTicketParams params,
  ) async {
    try {
      final data = await _dataSource.transferTicket(params);
      final ClientModel client = ClientModel.fromJson(data);
      return Right(client);
    } catch (e) {
      debugPrint("error in transferTicket => $e");
      return Left(e.toString());
    }
  }
}
