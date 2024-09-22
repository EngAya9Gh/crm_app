import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:crm_smart/features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/services/api/result.dart';
import '../../../../../../model/similar_client.dart';
import '../../data/models/client_marketing_meport_model.dart';
import '../../data/models/client_support_file_model.dart';
import '../../data/models/recommended_client.dart';
import '../use_cases/crud_client_support_files_usecase.dart';
import '../use_cases/get_client_marketing_report_usecase.dart';
import '../use_cases/get_client_support_files_usecase.dart';
import '../use_cases/get_clients_with_filter_usecase.dart';
import '../use_cases/receive_client_usecase.dart';
import '../use_cases/transfer_client_usecase.dart';
import '../../domain/use_cases/fetch_paginated_clients_usecase.dart';

abstract class ClientsListRepository {
  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsByRegion(
      Map<String, dynamic> body);

  Future<Result<ResponseWrapper<List<ClientModel>>>> getClientsByUser(
      Map<String, dynamic> body);

  Future<Either<String, dynamic>> getClientsWithFilter(
      GetClientsWithFilterParams body);

  Future<Result<ResponseWrapper<ClientModel>>> addClient(
      Map<String, dynamic> body);

  Future<Result<ResponseWrapper<ClientModel>>> editClient(
      Map<String, dynamic> body, Map<String, dynamic> params);

  Future<Result<ResponseWrapper<ClientModel>>> changeTypeClient(
      Map<String, dynamic> body, Map<String, dynamic> params, String id);

  Future<Result<ResponseWrapper<ClientModel>>> approveClientRejectAdmin(
      Map<String, dynamic> body, Map<String, dynamic> params, String id);

  Future<Result<ResponseWrapper<List<RecommendedClient>>>>
      getRecommendedClients();

  Future<Result<ResponseWrapper<List<SimilarClient>>>> getSimilarClients(
      Map<String, dynamic> body);

  Future<Either<String, List<ClientSupportFileModel>>> getClientSupportFiles(
      GetClientSupportFilesParams params);

  Future<Either<String, List<ClientSupportFileModel>>> crudClientSupportFiles(
      CrudClientSupportFilesParams params);

  Future<Either<String, ClientModel>> transferClient(
    TransferClientParams params,
  );

  Future<Either<String, ClientModel>> receiveClient(
    ReceiveClientParams params,
  );

  Future<Either<String, List<clientMarketingReportModel>>>
      getClientMarketingReport(GetClientMarketingReportParams params);

  Future<Either<String, PaginationResponseWrapper>> getHighSimilarClients(
      GetHighSimilarClientsParams params);

  Future<List<ClientModel>> getLinkClients(String idClient);
  Future<Either<String, bool>> linkClientTo(String idClient, List<String> ids);

  Future<ResponseWrapper<List<ClientModel>>> fetchPaginatedClients(FetchPaginatedClientsParams params);
}
