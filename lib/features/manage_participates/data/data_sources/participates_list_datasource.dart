import 'dart:convert';

import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_utils.dart';
import '../../../../core/api/client.dart';
import '../../../../core/api/client_config.dart';
import '../../../../core/common/models/profile_invoice_model.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/common/widgets/profile_comments_model.dart';
import '../../../../core/utils/end_points.dart';
import '../models/participate_client_model.dart';

@injectable
class ParticipatesListDatasource {
  final ClientApi _clientApi;

  ParticipatesListDatasource(this._clientApi);

  Future<ResponseWrapper<List<ParticipateModel>>> getParticipateList(
      Map<String, dynamic> body) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.participate.allParticipates,
          queryParameters: body,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<ParticipateModel>>.fromJson(
        response.data,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return ParticipateModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ParticipateModel>> addParticipate(
      Map<String, dynamic> body) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.participate.addParticipate,
          data: body,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );

      final client = ParticipateModel.fromJson(response.data['message'][0]);

      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ParticipateModel>> editParticipate(
      Map<String, dynamic> body, Map<String, dynamic> params) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.participate.updateParticipate,
          data: body,
          queryParameters: params,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );

      final client = ParticipateModel.fromJson(response.data['message'][0]);

      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ParticipateClientModel>>>
      getParticipateClientsList(String participateId) async {
    fun() async {
      final dio = GetIt.I<Dio>();
      dio.options.baseUrl = 'http://test.smartcrm.ws/api/';
      final response = await _clientApi.request(
        RequestConfig(
          endpoint:
              EndPoints.participate.allParticipateClients + '/' + participateId,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );
      dio.options.baseUrl = 'http://smartcrm.ws/test/api/';
      return ResponseWrapper<List<ParticipateClientModel>>(
        data: List.from((response.data['data'] as List<dynamic>).map(
            (e) => ParticipateClientModel.fromJson(e as Map<String, dynamic>))),
        message: [],
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ProfileInvoiceModel>>> getParticipateInvoicesList(
      String participateId) async {
    fun() async {
      final dio = GetIt.I<Dio>();
      dio.options.baseUrl = 'http://test.smartcrm.ws/api/';
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.participate.allParticipateInvoices +
              '/' +
              participateId,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );
      dio.options.baseUrl = 'http://smartcrm.ws/test/api/';
      return ResponseWrapper<List<ProfileInvoiceModel>>(
        data: List.from((response.data['data'] as List<dynamic>).map(
            (e) => ProfileInvoiceModel.fromJson(e as Map<String, dynamic>))),
        message: [],
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<InvoiceModel>> getInvoiceDataById(
      Map<String, dynamic> param) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.participate.IvoiceByID,
          queryParameters: param,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      final invoice =
          InvoiceModel.fromJson(jsonDecode(response.data)['message'][0]);
      return ResponseWrapper(message: invoice, data: invoice);
      // return
      // ResponseWrapper<List<InvoiceModel>>.fromJson(
      //   response.data['message'],
      //   (json) {
      //     return
      //     List.from((json as List<dynamic>).map((e) {
      //       return InvoiceModel.fromJson(json as Map<String, dynamic>);
      //     })
      //     );
      //   },
      // );
      //  return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ProfileCommentModel>>> getParticipateCommentsList(
      String participateId) async {
    fun() async {
      final dio = GetIt.I<Dio>();
      dio.options.baseUrl = 'http://test.smartcrm.ws/api/';
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.participate.allParticipateComments +
              '/' +
              participateId,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );
      dio.options.baseUrl = 'http://smartcrm.ws/test/api/';
      return ResponseWrapper<List<ProfileCommentModel>>(
        data: List.from((response.data['data'] as List<dynamic>).map(
            (e) => ProfileCommentModel.fromJson(e as Map<String, dynamic>))),
        message: [],
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ProfileCommentModel>> addComment(
      {required Map<String, dynamic> body}) async {
    final dio = GetIt.I<Dio>();
    dio.options.baseUrl = 'http://test.smartcrm.ws/api/';

    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.participate.addParticipateComment,
          data: body,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
        ),
      );
      dio.options.baseUrl = 'http://smartcrm.ws/test/api/';

      return ResponseWrapper<ProfileCommentModel>.fromJson(
        response.data,
        (json) => ProfileCommentModel.fromJson(response.data['data']),
      );
    }

    return throwAppException(fun);
  }
}
