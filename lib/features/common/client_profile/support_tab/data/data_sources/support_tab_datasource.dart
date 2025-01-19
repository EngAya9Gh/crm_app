import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../domain/use_cases/add_date_install_usecase.dart';
import '../../domain/use_cases/cancel_date_usecase.dart';
import '../../domain/use_cases/get_invoice_by_client_usecase.dart';
import '../../domain/use_cases/receive_device_usecase.dart';
import '../../domain/use_cases/returnToApprove.dart';
import '../../domain/use_cases/set_date_done_usecase.dart';
import '../../domain/use_cases/set_ready_install_usecase.dart';
import '../module_invioce_model.dart';

abstract interface class SupportTabDataSource {
  Future<dynamic> getInvoiceByClient(
    GetInvoiceByClientParams params,
  );

  Future<Either<String, InvoiceModel>> setDateDone(
    SetDateDoneParams params,
  );

  Future<PaginationResponseWrapper> setReadyInstall(
    SetReadyInstallParams params,
  );

  Future<Either<String, InvoiceModel>> returnApprove(
    ReturnToApproveParams params,
  );

  Future<Either<String, InvoiceModel>> receiveDevice(
    ReceiveDeviceParams params,
  );

  Future<dynamic> addDateInstall(AddDateInstallParams params);

  Future<dynamic> cancelDateInstall(CancelDateInstallParams params);

  Future<Either<String, List<ModuleInvoiceModel>>> getModulesByInvoice(CancelDateInstallParams params);
}

@LazySingleton(as: SupportTabDataSource)
class SupportTabDataSourceImpl implements SupportTabDataSource {
  final ApiServices _apiServices;

  SupportTabDataSourceImpl(this._apiServices);

  @override
  Future<dynamic> getInvoiceByClient(
    GetInvoiceByClientParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.client.getInvoiceByIdClient(params.idClient),
        queryParameters: params.toMap(),
      );

      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getInvoiceByClient => ${e.message}");
      throw e.message;
    } catch (e) {
      debugPrint("error in getInvoiceByClient => $e");
      rethrow;
    }
  }

  @override
  Future<dynamic> addDateInstall(AddDateInstallParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(
        endPoint: EndPoints.events.addDateInstall,
        data: params.toMap(),
      );

      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("error in addDateInstall => ${e.message}");
      throw e.message;
    }
  }

  @override
  Future<Either<String, InvoiceModel>> setDateDone(SetDateDoneParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(
        endPoint: "${EndPoints.invoice.setDateInstall}${params.id_invoice}",
        data: params.toMap(),
      );

      final data = apiDataHandler(response);
      final InvoiceModel invoiceModel = InvoiceModel.fromJson(data);

      return Right(invoiceModel);
    } on BaseAppException catch (e) {
      debugPrint("error in setDateDone => ${e.message}");
      return Left(e.message);
    } catch (e) {
      debugPrint("error in setDateDone => $e");
      return Left("error in setDateDone");
    }
  }

  @override
  Future<PaginationResponseWrapper> setReadyInstall(
    SetReadyInstallParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(
        endPoint: EndPoints.client.setReadyInstall(params.idInvoice),
        data: params.toBody(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in setReadyInstall in datasource => ${e.message}");
      throw e.message;
    }
  }

  @override
  Future<Either<String, InvoiceModel>> returnApprove(ReturnToApproveParams params) async {
    // TODO: implement returnApprove
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(
        endPoint: EndPoints.invoice.returnToApprove(params.id_invoice),
        data: params.toMap(),
      );

      final data = apiDataHandler(response);

      final InvoiceModel invoiceModel = InvoiceModel.fromJson(data);

      return Right(invoiceModel);
    } on BaseAppException catch (e) {
      debugPrint("error in returnApprove => ${e.message}");
      return Left(e.message);
    } catch (e) {
      debugPrint("error in returnApprove => $e");
      return Left("error in returnApprove");
    }
  }

  @override
  Future<Either<String, InvoiceModel>> receiveDevice(ReceiveDeviceParams params) async {
    // TODO: implement receiveDevice
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(
        endPoint: EndPoints.invoice.changeDeviceState(params.id_invoice),
        data: params.toMap(),
      );

      final data = apiDataHandler(response);

      final InvoiceModel invoiceModel = InvoiceModel.fromJson(data);

      return Right(invoiceModel);
    } on BaseAppException catch (e) {
      debugPrint("error in returnApprove => ${e.message}");
      return Left(e.message);
    } catch (e) {
      debugPrint("error in returnApprove => $e");
      return Left("error in returnApprove");
    }
  }

  @override
  Future<dynamic> cancelDateInstall(CancelDateInstallParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(
        endPoint: EndPoints.invoice.cancelDateInstall(params.idInvoice),
      );

      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("error in cancelDateInstall => ${e.message}");
      throw e.message;
    }
  }

  @override
  Future<Either<String, List<ModuleInvoiceModel>>> getModulesByInvoice(CancelDateInstallParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.invoice.getModulesByInvoice(params.idInvoice),
      );
      return Right(List.from(response['message']).map((e) => ModuleInvoiceModel.fromJson(e)).toList());
    } on BaseAppException catch (e) {
      debugPrint("error in get module => ${e.message}");
        AppSnackbar.showSnakeBar(
          'لايوجد اقرارات بعد ',
          color: ToastColorsEnum.warning);
      // throw e.message;
    }
    return Right([]);
  }
}
