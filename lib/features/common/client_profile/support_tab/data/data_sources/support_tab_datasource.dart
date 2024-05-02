import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../domain/use_cases/add_date_install_usecase.dart';
import '../../domain/use_cases/get_invoice_by_client_usecase.dart';
import '../../domain/use_cases/set_date_done_usecase.dart';
import '../../domain/use_cases/set_ready_install_usecase.dart';

abstract interface class SupportTabDataSource {
  Future<Either<String, List<InvoiceModel>>> getInvoiceByClient(
    GetInvoiceByClientParams params,
  );

  Future<Either<String, InvoiceModel>> setDateDone(
    SetDateDoneParams params,
  );

  Future<Either<String, InvoiceModel>> setReadyInstall(
    SetReadyInstallParams params,
  );

  Future<Either<String, dynamic>> addDateInstall(AddDateInstallParams params);
}

@LazySingleton(as: SupportTabDataSource)
class SupportTabDataSourceImpl implements SupportTabDataSource {
  final ApiServices _apiServices;

  SupportTabDataSourceImpl(this._apiServices);

  @override
  Future<Either<String, List<InvoiceModel>>> getInvoiceByClient(
    GetInvoiceByClientParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _apiServices.get(
        endPoint: EndPoints.client.getInvoiceByIdClient,
        queryParameters: params.toMap(),
      );

      final data = apiDataHandler(response);

      List<InvoiceModel> prodList = [];
      for (int i = 0; i < data.length; i++) {
        prodList.add(InvoiceModel.fromJson(data[i]));
      }

      return Right(prodList);
    } on BaseAppException catch (e) {
      print("error in getInvoiceByClient => ${e.message}");
      return Left(e.message);
    } catch (e) {
      print("error in getInvoiceByClient => $e");
      return Left("error in getInvoiceByClient");
    }
  }

  @override
  Future<Either<String, dynamic>> addDateInstall(
      AddDateInstallParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.post(
        endPoint: EndPoints.events.addDateInstall,
        data: params.toMap(),
      );

      final data = apiDataHandler(response);

      return Right(data);
    } on BaseAppException catch (e) {
      print("error in addDateInstall => ${e.message}");
      return Left(e.message);
    } catch (e) {
      print("error in addDateInstall => $e");
      return Left("error in addDateInstall");
    }
  }

  @override
  Future<Either<String, InvoiceModel>> setDateDone(
      SetDateDoneParams params) async {
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
      print("error in setDateDone => ${e.message}");
      return Left(e.message);
    } catch (e) {
      print("error in setDateDone => $e");
      return Left("error in setDateDone");
    }
  }

  @override
  Future<Either<String, InvoiceModel>> setReadyInstall(
      SetReadyInstallParams params) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _apiServices.post(
          endPoint: EndPoints.client.setReadyInstall,
          data: params.toMap(),
          queryParameters: {'id_invoice': params.id_invoice});

      final data = apiDataHandler(response);

      final InvoiceModel invoiceModel = InvoiceModel.fromJson(data[0]);

      return Right(invoiceModel);
    } on BaseAppException catch (e) {
      print("error in setReadyInstall => ${e.message}");
      return Left(e.message);
    } catch (e) {
      print("error in setReadyInstall => $e");
      return Left("error in setReadyInstall");
    }
  }
}
