import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/get_clients_transfer_approvals_usecase.dart';

abstract class ClientsTransferApprovalsDatasource {
  Future<PaginationResponseWrapper> getClientsTransferApprovals(
    GetClientsTransferApprovalsParams params,
  );
}

@LazySingleton(as: ClientsTransferApprovalsDatasource)
class ClientsTransferApprovalsDatasourceImpl
    implements ClientsTransferApprovalsDatasource {
  final ApiServices _api;

  const ClientsTransferApprovalsDatasourceImpl(this._api);

  @override
  Future<PaginationResponseWrapper> getClientsTransferApprovals(
      GetClientsTransferApprovalsParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.client.getTransferClientsWithPrivileges,
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getClientsTransferApprovals in datasource => $e");
      throw e.message;
    }
  }
}
