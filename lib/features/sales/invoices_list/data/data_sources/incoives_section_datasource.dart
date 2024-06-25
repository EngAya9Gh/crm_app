import '../../domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../core/errors/base_app_exception.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../../model/invoiceModel.dart';

abstract interface class InvoicesTabDataSource {
  Future<Either<String, dynamic>> getInvoiceByPrivileges(
      GetInvoicesByPrivilegesParams params);
}

@LazySingleton(as: InvoicesTabDataSource)
class InvoicesTabDataSourceImpl implements InvoicesTabDataSource {
  final ApiServices _apiServices;

  InvoicesTabDataSourceImpl(this._apiServices);

  @override
  Future<Either<String, dynamic>> getInvoiceByPrivileges(
    GetInvoicesByPrivilegesParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.invoice.getInvoicesByPrivileges,
        queryParameters: params.toMap(),
      );
      final int count = response['count'];

      final data = apiDataHandler(response);

      List<InvoiceModel> prodList = [];
      for (int i = 0; i < data.length; i++) {
        prodList.add(InvoiceModel.fromJson(data[i]));
      }

      return Right((prodList, count));
    } on BaseAppException catch (e) {
      debugPrint("error in getInvoiceByPrivileges => ${e.message}");
      return Left(e.message);
    } catch (e) {
      debugPrint("error in getInvoiceByPrivileges => $e");
      return Left("error in getInvoiceByPrivileges");
    }
  }
}
