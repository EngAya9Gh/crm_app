import 'package:crm_smart/features/finance/client_dept/domain/use_cases/report_client_dept_usecase.dart';
import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../models/client_dept.dart';

@injectable
class ClientDeptDatasource {
  final ApiServices api;

  ClientDeptDatasource(this.api);

  Future<ResponseWrapper<List<ClientDeptModel>>> getClientDept(GetInvoicesByPrivilegesParams params) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.finance.getClientDept,
        queryParameters: params.toMap(),
      );

      return ResponseWrapper<List<ClientDeptModel>>.fromJson(
          response, (json) => List.from((json as List<dynamic>).map((e) => ClientDeptModel.fromJson(e as Map<String, dynamic>))));
    } catch (e) {
      debugPrint("error in client dept data source => $e");
      throw Exception("$e");
    }
  }
  Future<bool> reportClient(ReportClientParams params) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
        endPoint: EndPoints.finance.reportClientDept(params.clientId.toString()),
      );

      return true;
    } catch (e) {
      debugPrint("error in client dept data source => $e");
      throw Exception("$e");
    }
  }
}
