import 'package:crm_smart/features/common/client_profile/invoices_tab/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../../model/invoiceModel.dart';

abstract interface class InvoicesTabDataSource {
  Future<Either<String, List<InvoiceModel>>> getInvoiceByPrivileges(
      GetInvoicesByPrivilegesParams params);
}

@LazySingleton(as: InvoicesTabDataSource)
class InvoicesTabDataSourceImpl implements InvoicesTabDataSource {
  final ApiServices _apiServices;

  InvoicesTabDataSourceImpl(this._apiServices);

  @override
  Future<Either<String, List<InvoiceModel>>> getInvoiceByPrivileges(
    GetInvoicesByPrivilegesParams params,
  ) async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(
        endPoint: EndPoints.invoice.getInvoicesByPrivileges,
        queryParameters: params.toMap(),
      );

      final data = apiDataHandler(response);

      List<InvoiceModel> prodList = [];
      for (int i = 0; i < data.length; i++) {
        prodList.add(InvoiceModel.fromJson(data[i]));
      }

      return Right(prodList);
    } on BaseAppException catch (e) {
      print("error in getInvoiceByPrivileges => ${e.message}");
      return Left(e.message);
    }
  }
}
