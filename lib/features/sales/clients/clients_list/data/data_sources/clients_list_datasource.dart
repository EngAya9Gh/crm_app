import 'dart:convert';
import 'dart:typed_data';

import 'package:crm_smart/api/api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../../core/common/helpers/api_helper.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/services/api/api_utils.dart';
import '../../../../../../core/services/di/di_container.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../../model/similar_client.dart';
import '../../domain/use_cases/crud_client_support_files_usecase.dart';
import '../../domain/use_cases/get_client_marketing_report_usecase.dart';
import '../../domain/use_cases/get_client_support_files_usecase.dart';
import '../../domain/use_cases/get_clients_with_filter_usecase.dart';
import '../../domain/use_cases/get_high_similar_cleints_usecase.dart';
import '../../domain/use_cases/receive_client_usecase.dart';
import '../../domain/use_cases/transfer_client_usecase.dart';
import '../models/client_support_file_model.dart';
import '../models/recommended_client.dart';

@injectable
class ClientsListDatasource {
  final ApiServices api;

  ClientsListDatasource(this.api);

  Future<Either<String, PaginationResponseWrapper>> exportClientsToExcel(
      GetClientsWithFilterParams body) async {
    try {
      final result = await Api().get(
        url:
            "${EndPoints.baseUrls.urlLaravel}${EndPoints.client.allClientsWithFilter}?${body.toMap()}&download=1&from=2024-06-02&to=2024-07-01",
        returnPureData: true,
      );

      Uint8List excelBytes = result.bodyBytes;

      // api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      // final response = await api.get(
      //   endPoint: EndPoints.client.allClientsWithFilter,
      //   queryParameters: {
      //     'from': '2024-06-02',
      //     'to': '2024-07-01',
      //     'download': '1',
      //     ...body.toMap(),
      //   },
      // );
      // print("response type is => ${response.runtimeType}");
      return Right(PaginationResponseWrapper(data: excelBytes));
      throw UnimplementedError();
    } on BaseAppException catch (e) {
      debugPrint("error in exportClientsToExcel in datasource => ${e.message}");
      throw e.message;
    } catch (e) {
      debugPrint("error in exportClientsToExcel in datasource => $e");
      return Left(e.toString());
    }

    // final response = await Dio().get(
    //   'https://test.smartcrm.ws/api/getAllClients',
    //   queryParameters: body.toMap(),
    //
    //
    //   //Received data with List<int>
    //   options: Options(
    //     responseType: ResponseType.bytes,
    //     followRedirects: false,
    //
    //   ),
    // );
    //   final decodedData = utf8.decode(response.data, allowMalformed: true);
    // final directory = await getExternalStorageDirectory();
    // final filePath = '${directory!.path}/clients_list.xlsx';
    // final file = File(filePath);
    // var raf = file.openSync(mode: FileMode.write);
    // final bytes = utf8.encode(decodedData);
    // raf.writeFromSync(bytes);
    // await raf.close();
    // ff.OpenFile.open(filePath);

    // return response.data;
    // if (response.statusCode == 200) {
    //   return response.bodyBytes;
    // } else {
    //   throw Exception('Failed to export clients to Excel');
    // }
  }

  Future<ResponseWrapper<List<SimilarClient>>> getSimilarClientsList(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
          endPoint: EndPoints.client.similarClientsList, data: body);

      api.changeBaseUrl(EndPoints.baseUrls.url);
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
      api.changeBaseUrl(EndPoints.baseUrls.url);
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
      api.changeBaseUrl(EndPoints.baseUrls.url);
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

  Future<PaginationResponseWrapper> getClientsWithFilter(
      GetClientsWithFilterParams body) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.client.allClientsWithFilter,
        queryParameters: body.toMap(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error in getClientsWithFilter in datasource => ${e.message}");
      throw e.message;
    }
  }

  Future<dynamic> getClientAll(Map<String, dynamic> body) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
          endPoint: EndPoints.client.allClientsWithFilter,
          queryParameters: body);

      return response;
    } on BaseAppException catch (e) {
      debugPrint("error in getClientsWithFilter in datasource => ${e.message}");
      throw e.message;
    }
  }

  Future<ResponseWrapper<List<RecommendedClient>>>
      getRecommendedClients() async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.url);
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
    Map<String, dynamic> body,
  ) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
        endPoint: EndPoints.client.addClient,
        data: body,
      );
      final client = ClientModel.fromJson(response['message']);
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ClientModel>> editClient1(
      Map<String, dynamic> body, Map<String, dynamic> params) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
        endPoint: EndPoints.client.updateClient + params['id_clients'],
        data: body,
        // queryParameters: params,
      );

      final client = ClientModel.fromJson(response['message']);
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ClientModel>> changeTypeClient(
      Map<String, dynamic> body, Map<String, dynamic> params, String id) async {
    fun() async {
      final dio = getIt<Dio>();
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
        endPoint: EndPoints.client.editClientByTypeClient(id),
        data: body,
      );

      api.changeBaseUrl(EndPoints.baseUrls.url);
      final client = ClientModel.fromJson(response['data']);
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ClientModel>> approveClient_Reject(
      Map<String, dynamic> body, Map<String, dynamic> params, String id) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
        endPoint: EndPoints.client.approveClientRejectAdmin + id,
        data: body,
        queryParameters: params,
      );

      api.changeBaseUrl(EndPoints.baseUrls.url);
      final client = ClientModel.fromJson(response['data']);
      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<Either<String, List<ClientSupportFileModel>>> getClientSupportFiles(
    GetClientSupportFilesParams params,
  ) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);

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
      debugPrint("error in getInvoiceAttachments => $e");
      return left(e.toString());
    }
  }

  Future<Either<String, List<ClientSupportFileModel>>> crudClientSupportFiles(
    CrudClientSupportFilesParams params,
  ) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);

      final response = await api.postRequestWithFile(
        endPoint: EndPoints.invoice.crudClientSupportFiles,
        data: params.toMap(),
        files: params.addedFiles,
        filesKey: 'file_attach_invoice',
        isFilesKeysIndexed: true,
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
      debugPrint("error in crudInvoiceAttachments => $e");
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
    List<XFile> files,
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

  Future<Either<String, ClientModel>> transferClient(
    TransferClientParams params,
  ) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
        endPoint: "${EndPoints.client.transferClient}${params.idClient}",
        data: params.toMap(),
      );
      final data = apiDataHandler(response);
      final client = ClientModel.fromJson(data);
      return right(client);
    } on BaseAppException catch (e) {
      debugPrint("error in transferClient => ${e.message}");
      return left(e.message);
    } catch (e) {
      debugPrint("error in transferClient in datasource => $e");
      return Left(e.toString());
    }
  }

  Future<dynamic> receiveClient(
    ReceiveClientParams params,
  ) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
        endPoint: EndPoints.client.receiveClient(idClient: params.idClient),
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("error in transferClient in datasource => ${e.message}");
      throw e.message;
    }
  }

  Future<dynamic> getClientMarketingReport(
      GetClientMarketingReportParams params) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.reports.getClientMarketingReport,
        queryParameters: params.toMap(),
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint(
          "error in getClientMarketingReport in datasource => ${e.message}");
      throw e.message;
    }
  }

  Future<PaginationResponseWrapper> getHighSimilarClients(
      GetHighSimilarClientsParams params) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
        endPoint: EndPoints.client.highSimilarClients,
        data: params.toBody(),
      );

      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint(
          "error in getHighSimilarClients in datasource => ${e.message}");
      throw e.message;
    }
  }

  Future<List<Map<String, dynamic>>> getLinkClients(String idClient) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.client.getLinkClients(idClient),
      );
      return List<Map<String, dynamic>>.from(apiDataHandler(response));
    } on BaseAppException catch (e) {
      debugPrint("error in getLinkClients in datasource => ${e.message}");
      throw e.message;
    }
  }

  Future<bool> linkClientTo(String idClient, List<String> ids) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      Map<String, dynamic> body = ApiHelper.prepareParamsList(
        key: "ids",
        values: ids.map((e) => e).toList(),
      );
      final response = await api.post(
        endPoint: EndPoints.client.linkClientTo(idClient),
        data: body,
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("error in linkClientTo in datasource => ${e.message}");
      throw e.message;
    }
  }
}
