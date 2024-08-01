import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../model/calendar/event_model.dart';
import '../../domain/repositories/dates_table_repo.dart';
import '../../domain/use_cases/cancel_schedule_usecase.dart';
import '../../domain/use_cases/change_date_to_done_usecase.dart';
import '../../domain/use_cases/get_date_installation_usecase.dart';
import '../../domain/use_cases/get_invoices_by_client_for_date_usecase.dart';
import '../../domain/use_cases/get_subscribed_clients_usecase.dart';
import '../../domain/use_cases/reschedule_date_usecase.dart';
import '../../domain/use_cases/return_schedule_visit_to_open_usecase.dart';
import '../data_sources/dates_table_datasource.dart';
import '../models/date_invoice_model.dart';
import '../models/subscribed_client_model.dart';

@LazySingleton(as: DatesTableRepo)
class DatesTableRepoImpl implements DatesTableRepo {
  final DatesTableDataSource _datesTableDataSource;

  DatesTableRepoImpl(this._datesTableDataSource);

  @override
  Future<Either<String, List<EventModel>>> getDateInstallation(
    GetDateInstallationParams params,
  ) async {
    try {
      final data = await _datesTableDataSource.getDateInstallation(params);
      final events =
          List<EventModel>.from(data.map((e) => EventModel.fromJson(e)));
      print("events length: ${events.length}");
      return Right(events);
    } catch (e) {
      debugPrint("error in getDateInstallation => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> rescheduleDate(
    RescheduleDateParams params,
  ) async {
    try {
      final data = await _datesTableDataSource.rescheduleDate(params);
      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> changeDateToDone(
    ChangeDateToDoneParams params,
  ) async {
    try {
      final data = await _datesTableDataSource.changeDateToDone(params);
      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> cancelSchedule(
      CancelScheduleParams params) async {
    try {
      final data = await _datesTableDataSource.cancelSchedule(params);
      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> returnScheduleVisitToOpen(
    ReturnScheduleVisitToOpenParams params,
  ) async {
    try {
      final data =
          await _datesTableDataSource.returnScheduleVisitToOpen(params);
      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<SubscribedClientModel>>> getSubscribedClients(
    GetSubscribedClientsParams params,
  ) async {
    try {
      final data = await _datesTableDataSource.getSubscribedClients(params);
      final subscribedClients = List<SubscribedClientModel>.from(data.map((e) {
        return SubscribedClientModel.fromJson(e);
      }));
      return Right(subscribedClients);
    } catch (e) {
      debugPrint("error in getSubscribedClients => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<DateInvoiceModel>>> getInvoicesByClientForDate(
      GetInvoicesByClientForDateParams params) async {
    try {
      final data =
          await _datesTableDataSource.getInvoicesByClientForDate(params);
      final dateInvoices = List<DateInvoiceModel>.from(data.map((e) {
        return DateInvoiceModel.fromMap(e);
      }));
      return Right(dateInvoices);
    } catch (e) {
      debugPrint("error in getInvoicesByClientForDate => $e");
      return Left(e.toString());
    }
  }
}
