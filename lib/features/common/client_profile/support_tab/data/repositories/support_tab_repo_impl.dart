import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../model/calendar/event_model.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../domain/repositories/support_tab_repo.dart';
import '../../domain/use_cases/add_date_install_usecase.dart';
import '../../domain/use_cases/cancel_date_usecase.dart';
import '../../domain/use_cases/get_invoice_by_client_usecase.dart';
import '../../domain/use_cases/receive_device_usecase.dart';
import '../../domain/use_cases/returnToApprove.dart';
import '../../domain/use_cases/set_date_done_usecase.dart';
import '../../domain/use_cases/set_ready_install_usecase.dart';
import '../data_sources/support_tab_datasource.dart';

@LazySingleton(as: SupportTabRepo)
class SupportTabRepoImpl implements SupportTabRepo {
  final SupportTabDataSource _supportTabDataSource;

  SupportTabRepoImpl(this._supportTabDataSource);

  @override
  Future<Either<String, List<InvoiceModel>>> getInvoiceByClient(
    GetInvoiceByClientParams params,
  ) async {
    try {
      final data = await _supportTabDataSource.getInvoiceByClient(params);

      List<InvoiceModel> prodList =
          List<InvoiceModel>.from(data.map((e) => InvoiceModel.fromJson(e)));

      return Right(prodList);
    } catch (e) {
      debugPrint("error in getInvoiceByClient => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, InvoiceModel>> setDateDone(SetDateDoneParams params) {
    return _supportTabDataSource.setDateDone(params);
  }

  @override
  Future<Either<String, PaginationResponseWrapper>> setReadyInstall(
      SetReadyInstallParams params) async {
    try {
      final data = await _supportTabDataSource.setReadyInstall(params);
      return Right(data.copyWith(
        data: InvoiceModel.fromJson(data.data),
      ));
    } catch (e) {
      debugPrint("error in setReadyInstall => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, EventModel>> addDateInstall(
    AddDateInstallParams params,
  ) async {
    try {
      final data = await _supportTabDataSource.addDateInstall(params);
      final EventModel event = EventModel.fromJson(data);
      return Right(event);
    } catch (e) {
      debugPrint("error in addDateInstall => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, InvoiceModel>> returnToApprove(
      ReturnToApproveParams params) {
    // TODO: implement returnToApprove
    return _supportTabDataSource.returnApprove(params);
  }

  @override
  Future<Either<String, InvoiceModel>> receiveDevice(
      ReceiveDeviceParams params) {
    // TODO: implement receiveDevice
    return _supportTabDataSource.receiveDevice(params);
  }

  @override
  Future<Either<String, InvoiceModel>> cancelDateInstall(
    CancelDateInstallParams params,
  ) async {
    try {
      final data = await _supportTabDataSource.cancelDateInstall(params);
      final event = InvoiceModel.fromJson(data);
      return Right(event);
    } catch (e) {
      debugPrint("error in cancelDateInstall => $e");
      return Left(e.toString());
    }
  }
}
