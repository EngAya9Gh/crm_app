import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_services.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/common/helpers/api_data_handler.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/di/di_container.dart';
import '../../../../core/utils/end_points.dart';
import '../../../../model/similar_client.dart';
import '../../domain/use_cases/crud_client_support_files_usecase.dart';
import '../../domain/use_cases/get_client_support_files_usecase.dart';
import '../models/client_support_file_model.dart';
import '../models/clients_list_response.dart';
import '../models/recommended_client.dart';

@injectable
class ClientsListDatasource {
  final ApiServices api;

  ClientsListDatasource(this.api);

  Future<ResponseWrapper<List<ClientModel>>> getAllClientsList(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.phpUrl);
      final response = await api.get(
          endPoint: EndPoints.client.allClientsList, queryParameters: body);

      return ResponseWrapper<List<ClientModel>>.fromJson(
        response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<SimilarClient>>> getSimilarClientsList(
      Map<String, dynamic> body) async {
    fun() async {
      final dio = getIt<Dio>();
      api.changeBaseUrl(EndPoints.laravelUrl);
      final response = await api.post(
          endPoint: EndPoints.client.similarClientsList, data: body);

      api.changeBaseUrl(EndPoints.phpUrl);
      final client = response; //ClientModel.fromJson(response);
      List<SimilarClient> listres =
          List.from((client as List<dynamic>).map((e) {
        return SimilarClient.fromJson(e as Map<String, dynamic>);
      }));
      return ResponseWrapper<List<SimilarClient>>(message: null, data: listres);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ClientModel>>> getClientsByRegionList(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.phpUrl);
      final response = await api.get(
          endPoint: EndPoints.client.clientsByRegionList,
          queryParameters: body);

      return ResponseWrapper<List<ClientModel>>.fromJson(
        response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ClientModel>>> getClientsByUserList(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.phpUrl);
      final response = await api.get(
          endPoint: EndPoints.client.clientsByUserList, queryParameters: body);

      return ResponseWrapper<List<ClientModel>>.fromJson(
        response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ClientModel>>> getAllClientsWithFilterList(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.phpUrl);
      final response = await api.get(
          endPoint: EndPoints.client.allClientsWithFilter,
          queryParameters: body);

      return ResponseWrapper<List<ClientModel>>.fromJson(
        response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ClientModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<RecommendedClient>>>
      getRecommendedClients() async {
    fun() async {
      api.changeBaseUrl(EndPoints.phpUrl);
      final response = await api.get(
        endPoint: EndPoints.care.getRecommendedClients,
      );

      return ResponseWrapper<List<RecommendedClient>>.fromJson(
        jsonDecode(response),
        (json) => List.from((json as List<dynamic>)
            .map((e) => RecommendedClient.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ClientModel>> addClient(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.phpUrl);
      final response = await api.post(
        endPoint: EndPoints.client.addClient,
        data: body,
      );

      final client = ClientModel.fromJson(response['message'][0]);
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ClientModel>> editClient1(
      Map<String, dynamic> body, Map<String, dynamic> params) async {
    fun() async {
      api.changeBaseUrl(EndPoints.phpUrl);
      final response = await api.post(
        endPoint: EndPoints.client.editClient,
        data: body,
        queryParameters: params,
      );

      final client = ClientModel.fromJson(response['message'][0]);
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ClientModel>> changeTypeClient(
      Map<String, dynamic> body, Map<String, dynamic> params, String id) async {
    fun() async {
      final dio = getIt<Dio>();
      api.changeBaseUrl(EndPoints.laravelUrl);
      final response = await api.post(
        endPoint: EndPoints.client.changeTypeClient + id,
        data: body,
        queryParameters: params,
      );

      api.changeBaseUrl(EndPoints.phpUrl);
      final client = ClientModel.fromJson(response['data']);
      final client1 = response['success'];
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ClientModel>> approveClient_Reject(
      Map<String, dynamic> body, Map<String, dynamic> params, String id) async {
    fun() async {
      api.changeBaseUrl(EndPoints.laravelUrl);
      final response = await api.post(
        endPoint: EndPoints.client.approveClient_reject_admin + id,
        data: body,
        queryParameters: params,
      );

      api.changeBaseUrl(EndPoints.phpUrl);
      final client = ClientModel.fromJson(response['data']);
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<Either<String, List<ClientSupportFileModel>>> getClientSupportFiles(
    GetClientSupportFilesParams params,
  ) async {
    try {
      api.changeBaseUrl(EndPoints.laravelUrl);

      final response = await api.get(
          endPoint: EndPoints.invoice.getClientSupportFiles,
          queryParameters: {
            'fk_invoice': params.invoiceId,
          });
      final List data = apiDataHandler(response);
      final List<ClientSupportFileModel> attachments =
          data.map((e) => ClientSupportFileModel.fromJson(e)).toList();
      return right(attachments);
    } catch (e) {
      print("error in getInvoiceAttachments => $e");
      return left(e.toString());
    }
  }

  Future<Either<String, List<ClientSupportFileModel>>> crudClientSupportFiles(
    CrudClientSupportFilesParams params,
  ) async {
    try {
      api.changeBaseUrl(EndPoints.laravelUrl);
      FormData formData = await _prepareBody(params);
      final response = await api.post(
        endPoint: EndPoints.invoice.crudClientSupportFiles,
        data: formData,
      );
      final data = apiDataHandler(response);
      if (data is String) {
        return Right([]);
      }
      final List<ClientSupportFileModel> files = (data as List)
          .map((e) => ClientSupportFileModel.fromJson(e))
          .toList();
      return right(files);
    } catch (e) {
      print("error in crudInvoiceAttachments => $e");
      return left(e.toString());
    }
  }

  Future<FormData> _prepareBody(CrudClientSupportFilesParams params) async {
    final FormData formData = FormData.fromMap({
      'fk_invoice': params.invoiceId,
      'files_delete_ids': "[${params.deletedFiles.join(',')}]",
    });

    final files = await _prepareFiles(params.addedFiles);
    formData.files.addAll(files);
    return formData;
  }

  Future<List<MapEntry<String, MultipartFile>>> _prepareFiles(
    List<File> files,
  ) async {
    final List<MultipartFile> multipartFiles = await Future.wait(
      files.map(
        (e) async {
          return await MultipartFile.fromFile(
            e.path,
            filename: e.path.split('/').last,
          );
        },
      ),
    );
    return _formFiles(multipartFiles);
  }

  List<MapEntry<String, MultipartFile>> _formFiles(
      List<MultipartFile> multipartFiles) {
    final List<MapEntry<String, MultipartFile>> files = [];
    for (int i = 0; i < multipartFiles.length; i++) {
      files.add(MapEntry('file_attach_invoice[$i]', multipartFiles[i]));
    }
    return files;
  }
}
