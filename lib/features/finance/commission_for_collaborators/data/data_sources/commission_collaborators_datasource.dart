import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../model/invoiceModel.dart';
import '../../domain/use_cases/get_commission_collaborators_usecase.dart';
import '../models/commission_collaborators_response.dart';


@injectable
class CommissionForCollaboratorsDatasource {
  final ApiServices api;

  CommissionForCollaboratorsDatasource(this.api);

  Future<CommissionCollaboratorsResponseModel> getCommissionCollaborators(CommissionCollaboratorsParams params) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.finance.participateInvoices,
        queryParameters: params.toMap(),
      );

      return CommissionCollaboratorsResponseModel.fromMap(response);
    } catch (e) {
      debugPrint("error in client dept data source => $e");
      throw Exception("$e");
    }
  }
}
