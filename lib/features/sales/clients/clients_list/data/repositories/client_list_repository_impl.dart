import 'package:crm_smart/features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart';
import 'package:crm_smart/features/sales/clients/clients_list/domain/use_cases/get_users_sales_usecase.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/models/user_entity.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/services/api/api_utils.dart';
import '../../../../../../core/services/api/result.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../../model/similar_client.dart';
import '../../domain/repositories/clients_list_repository.dart';
import '../../domain/use_cases/crud_client_support_files_usecase.dart';
import '../../domain/use_cases/fetch_paginated_clients_usecase.dart';
import '../../domain/use_cases/get_client_marketing_report_usecase.dart';
import '../../domain/use_cases/get_client_support_files_usecase.dart';
import '../../domain/use_cases/get_clients_with_filter_usecase.dart';
import '../../domain/use_cases/receive_client_usecase.dart';
import '../../domain/use_cases/transfer_client_usecase.dart';
import '../data_sources/clients_list_datasource.dart';
import '../datasources/link_client_datasource.dart';
import '../models/client_marketing_meport_model.dart';
import '../models/client_support_file_model.dart';
import '../models/recommended_client.dart';

@Injectable(as: ClientsListRepository)
class ClientsListRepositoryImpl implements ClientsListRepository {
  final ClientsListDatasource datasource;

  ClientsListRepositoryImpl(this.datasource);

  @override
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsByRegion(Map<String, dynamic> body) {
    return toApiResult(() => datasource.getClientsByRegionList(body));
  }

  @override
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsByUser(Map<String, dynamic> body) {
    return toApiResult(() => datasource.getClientsByUserList(body));
  }

  @override
  Future<Either<String, PaginationResponseWrapper>> getClientsWithFilter(
    GetClientsWithFilterParams body,
  ) async {
    try {
      PaginationResponseWrapper result = await datasource.getClientsWithFilter(body);
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
  Future<Result<ResponseWrapper<List<RecommendedClient>>>> getRecommendedClients() {
    return toApiResult(datasource.getRecommendedClients);
  }

  @override
  Future<Result<ResponseWrapper<ClientModel>>> addClient(Map<String, dynamic> body) {
    return toApiResult(() => datasource.addClient(body));
  }

  @override
  Future<Result<ResponseWrapper<ClientModel>>> editClient(Map<String, dynamic> body, Map<String, dynamic> params) {
    return toApiResult(() => datasource.editClient1(body, params));
  }

  @override
  Future<Result<ResponseWrapper<ClientModel>>> changeTypeClient(Map<String, dynamic> body, Map<String, dynamic> params, String id) {
    // TODO: implement changeTypeClient
    return toApiResult(() => datasource.changeTypeClient(body, params, id));
  }

  @override
  Future<Result<ResponseWrapper<CommunicationDetailModel>>> storeClientCommunication(Map<String, dynamic> body, Map<String, dynamic> params) {
    // TODO: implement changeTypeClient
    return toApiResult(() => datasource.storeClientCommunication(body, params));
  }

  @override
  Future<Result<ResponseWrapper<CommunicationDetailModel>>> changeClientCommunication(
      Map<String, dynamic> body, Map<String, dynamic> params, String id) {
    // TODO: implement changeTypeClient
    return toApiResult(() => datasource.changeClientCommunication(body, params, id));
  }

  @override
  Future<Result<ResponseWrapper<List<SimilarClient>>>> getSimilarClients(Map<String, dynamic> body) {
    // TODO: implement getSimilarClients
    return toApiResult(() => datasource.getSimilarClientsList(body));
  }

  @override
  Future<Result<ResponseWrapper<ClientModel>>> approveClientRejectAdmin(Map<String, dynamic> body, Map<String, dynamic> params, String id) {
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
  Future<Either<String, List<ClientSupportFileModel>>> crudClientSupportFiles(CrudClientSupportFilesParams params) {
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
  Future<Either<String, List<clientMarketingReportModel>>> getClientMarketingReport(GetClientMarketingReportParams params) async {
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

  @override
  Future<Either<String, PaginationResponseWrapper>> getHighSimilarClients(GetHighSimilarClientsParams params) async {
    try {
      final data = await datasource.getHighSimilarClients(params);
      return Right(data.copyWith(data: List.from(data.data.map((e) {
        return SimilarClient.fromJson(e);
      }))));
    } catch (e) {
      debugPrint('Error in getHighSimilarClients in repo => $e');
      return Left(e.toString());
    }
  }

  @override
  Future<List<ClientModel>> getLinkClients(String idClient) async {
    try {
      final data = await datasource.getLinkClients(idClient);
      final clients = data.map((e) => ClientModel.fromJson(e)).toList();
      return clients;
    } catch (e) {
      debugPrint('Error in getLinkClients: $e');
      return [];
    }
  }

  @override
  Future<Either<String, bool>> linkClientTo(String idClient, List<String> ids) async {
    try {
      final result = await datasource.linkClientTo(idClient, ids);
      return Right(result);
    } catch (e) {
      debugPrint('Error in linkClientTo: $e');
      return Left(e.toString());
    }
  }

  @override
  Future<ResponseWrapper<List<ClientModel>>> fetchPaginatedClients(FetchPaginatedClientsParams params) async {
    try {
      final response = await datasource.getClientAll({
        'page': params.page,
        'fk_country': params.fkCountry,
        // Add any other necessary parameters
      });
      // if (response.statusCode == 200) {
      final List<ClientModel> clients = (response.data['message'] as List).map((json) => ClientModel.fromJson(json)).toList();

      return ResponseWrapper<List<ClientModel>>(
        data: clients,
        count: response.data['count'],
        // lastPage: response.data['last_page'],
        message: response.data['message'],
      );
      // } else {
      //   throw Exception('Failed to fetch paginated clients');
      // }
    } catch (e) {
      throw Exception('Error fetching paginated clients: $e');
    }
  }

  @override
  Future<Result<ResponseWrapper<List<UserEntity>>>> getUsersSales(GetUsersSalesParams params) async {
      return toApiResult(() => datasource.getUsersSales(params));}
}
