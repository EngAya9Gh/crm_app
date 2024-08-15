import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../domain/repositories/clients_transfer_approvals_repo.dart';
import '../../domain/use_cases/get_clients_transfer_approvals_usecase.dart';
import '../data_sources/clients_transfer_approvals_datasource.dart';

@LazySingleton(as: ClientsTransferApprovalsRepo)
class ClientsTransferApprovalsRepoImpl implements ClientsTransferApprovalsRepo {
  final ClientsTransferApprovalsDatasource _dataSource;

  const ClientsTransferApprovalsRepoImpl(this._dataSource);

  @override
  Future<Either<String, PaginationResponseWrapper>> getClientsTransferApprovals(
    GetClientsTransferApprovalsParams params,
  ) async {
    try {
      final response = await _dataSource.getClientsTransferApprovals(params);
      return Right(response.copyWith(
        data: List<ClientModel>.from(
          response.data.map((e) => ClientModel.fromJson(e)),
        ),
      ));
    } catch (e) {
      debugPrint("error in getClientsTransferApprovals in repo => $e");
      return Left(e.toString());
    }
  }
}
