import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/api_utils.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/sales/clients_list/data/models/client_marketing_meport_model.dart';
import 'package:crm_smart/features/sales/clients_list/data/models/clients_list_response.dart';
import 'package:crm_smart/features/sales/clients_list/data/models/recommended_client.dart';
import 'package:crm_smart/features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart';
import 'package:crm_smart/features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart';
import 'package:crm_smart/features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart';
import 'package:crm_smart/features/sales/clients_list/domain/use_cases/receive_client_usecase.dart';
import 'package:crm_smart/features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../model/similar_client.dart';
import '../../domain/repositories/clients_list_repository.dart';
import '../../domain/use_cases/get_client_support_files_usecase.dart';
import '../data_sources/clients_list_datasource.dart';
import '../models/client_support_file_model.dart';

@Injectable(as: ClientsListRepository)
class ClientsListRepositoryImpl implements ClientsListRepository {
  final ClientsListDatasource datasource;

  ClientsListRepositoryImpl(this.datasource);

  @override
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsByRegion(
      Map<String, dynamic> body) {
    return toApiResult(() => datasource.getClientsByRegionList(body));
  }

  @override
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsByUser(
      Map<String, dynamic> body) {
    return toApiResult(() => datasource.getClientsByUserList(body));
  }

  @override
  Future<Either<String, dynamic>> getClientsWithFilter(
    GetClientsWithFilterParams body,
  ) async {
    try {
      PaginationResponseWrapper result =
          await datasource.getClientsWithFilter(body);
      final List<ClientModel> list = List.from(result.data.map((e) {
        return ClientModel.fromJson(e);
      }));

      return Right(result.copyWith(data: list));
    } catch (e) {
      debugPrint('Error in getClientsWithFilter: $e');
      return Left(e.toString());
    }
  }

  @override
  Future<Result<ResponseWrapper<List<RecommendedClient>>>>
      getRecommendedClients() {
    return toApiResult(datasource.getRecommendedClients);
  }

  @override
  Future<Result<ResponseWrapper<ClientModel>>> addClient(
      Map<String, dynamic> body) {
    return toApiResult(() => datasource.addClient(body));
  }

  @override
  Future<Result<ResponseWrapper<ClientModel>>> editClient(
      Map<String, dynamic> body, Map<String, dynamic> params) {
    return toApiResult(() => datasource.editClient1(body, params));
  }

  @override
  Future<Result<ResponseWrapper<ClientModel>>> changeTypeClient(
      Map<String, dynamic> body, Map<String, dynamic> params, String id) {
    // TODO: implement changeTypeClient
    return toApiResult(() => datasource.changeTypeClient(body, params, id));
  }

  @override
  Future<Result<ResponseWrapper<List<SimilarClient>>>> getSimilarClients(
      Map<String, dynamic> body) {
    // TODO: implement getSimilarClients
    return toApiResult(() => datasource.getSimilarClientsList(body));
  }

  @override
  Future<Result<ResponseWrapper<ClientModel>>> approveClientRejectAdmin(
      Map<String, dynamic> body, Map<String, dynamic> params, String id) {
    // TODO: implement approveClientReject_admin
    return toApiResult(() => datasource.approveClient_Reject(body, params, id));
  }

  @override
  Future<Either<String, List<ClientSupportFileModel>>> getClientSupportFiles(
    GetClientSupportFilesParams params,
  ) {
    return datasource.getClientSupportFiles(params);
  }

  @override
  Future<Either<String, List<ClientSupportFileModel>>> crudClientSupportFiles(
      CrudClientSupportFilesParams params) {
    return datasource.crudClientSupportFiles(params);
  }

  @override
  Future<Either<String, ClientModel>> transferClient(
    TransferClientParams params,
  ) {
    return datasource.transferClient(params);
  }

  @override
  Future<Either<String, ClientModel>> receiveClient(
    ReceiveClientParams params,
  ) async {
    try {
      final data = await datasource.receiveClient(params);
      final client = ClientModel.fromJson(data);
      return Right(client);
    } catch (e) {
      debugPrint('Error in receiveClient: $e');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<clientMarketingReportModel>>>
      getClientMarketingReport(GetClientMarketingReportParams params) async {
    try {
      final data = await datasource.getClientMarketingReport(params);
      final list = List<clientMarketingReportModel>.from(data.map((e) {
        return clientMarketingReportModel.fromMap(e);
      }));
      return Right(list);
    } catch (e) {
      debugPrint('Error in getClientMarketingReport: $e');
      return Left(e.toString());
    }
  }
}
