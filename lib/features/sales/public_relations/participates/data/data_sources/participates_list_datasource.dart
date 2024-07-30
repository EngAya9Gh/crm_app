import 'dart:convert';

import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../../core/common/models/participate_model.dart';
import '../../../../../../core/common/models/profile_invoice_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/widgets/profile_comments_model.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/services/api/api_utils.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../domain/use_cases/change_participate_status_usecase.dart';
import '../models/participate_client_model.dart';

abstract class ParticipatesListDatasource {
  Future<ResponseWrapper<List<ParticipateModel>>> getParticipateList(
    Map<String, dynamic> body,
  );

  Future<ResponseWrapper<ParticipateModel>> addParticipate(
      Map<String, dynamic> body);

  Future<ResponseWrapper<ParticipateModel>> editParticipate(
      Map<String, dynamic> body, Map<String, dynamic> params);

  Future<ResponseWrapper<List<ParticipateClientModel>>>
      getParticipateClientsList(String participateId);

  Future<ResponseWrapper<List<ProfileInvoiceModel>>> getParticipateInvoicesList(
      String participateId);

  Future<ResponseWrapper<InvoiceModel>> getInvoiceDataById(
      Map<String, dynamic> param);

  Future<ResponseWrapper<List<ProfileCommentModel>>> getParticipateCommentsList(
      String participateId);

  Future<ResponseWrapper<ProfileCommentModel>> addComment(
      {required Map<String, dynamic> body});

  Future<dynamic> changeParticipateStatus(ChangeParticipateParams params);
}

@LazySingleton(as: ParticipatesListDatasource)
class ParticipatesListDatasourceImpl implements ParticipatesListDatasource {
  final ApiServices _api;

  ParticipatesListDatasourceImpl(this._api);

  Future<ResponseWrapper<List<ParticipateModel>>> getParticipateList(
    Map<String, dynamic> body,
  ) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.participate.getParticipates,
        queryParameters: body,
      );

      final data = apiDataHandler(response);

      List<ParticipateModel> participateList = List.from(data.map(
        (e) => ParticipateModel.fromJson(e),
      ));

      final wrapper = ResponseWrapper<List<ParticipateModel>>(
        data: participateList,
        message: participateList,
        count: response['count'],
      );

      return wrapper;
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ParticipateModel>> addParticipate(
      Map<String, dynamic> body) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: EndPoints.participate.addParticipate,
        data: body,
      );

      final data = apiDataHandler(response);

      final participate = ParticipateModel.fromJson(data);

      return ResponseWrapper(message: participate, data: participate);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ParticipateModel>> editParticipate(
      Map<String, dynamic> body, Map<String, dynamic> params) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint:
            EndPoints.participate.updateParticipate(params['id_participate']),
        data: body,
      );

      final data = apiDataHandler(response);

      final participate = ParticipateModel.fromJson(data);

      return ResponseWrapper(message: participate, data: participate);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ParticipateClientModel>>>
      getParticipateClientsList(String participateId) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
          endPoint:
              "${EndPoints.participate.allParticipateClients}/$participateId");

      _api.changeBaseUrl(EndPoints.baseUrls.url);
      return ResponseWrapper<List<ParticipateClientModel>>(
        data: List.from((response['data'] as List<dynamic>).map(
            (e) => ParticipateClientModel.fromJson(e as Map<String, dynamic>))),
        message: [],
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ProfileInvoiceModel>>> getParticipateInvoicesList(
      String participateId) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
          endPoint:
              "${EndPoints.participate.allParticipateInvoices}/$participateId");

      _api.changeBaseUrl(EndPoints.baseUrls.url);
      return ResponseWrapper<List<ProfileInvoiceModel>>(
        data: List.from((response['data'] as List<dynamic>).map(
            (e) => ProfileInvoiceModel.fromJson(e as Map<String, dynamic>))),
        message: [],
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<InvoiceModel>> getInvoiceDataById(
      Map<String, dynamic> param) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.get(
          endPoint: EndPoints.participate.getInvoiceById,
          queryParameters: param);

      final invoice = InvoiceModel.fromJson(jsonDecode(response)['message'][0]);
      return ResponseWrapper(message: invoice, data: invoice);
      // return
      // ResponseWrapper<List<InvoiceModel>>.fromJson(
      //   response['message'],
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
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
          endPoint:
              "${EndPoints.participate.allParticipateComments}/$participateId");

      _api.changeBaseUrl(EndPoints.baseUrls.url);
      return ResponseWrapper<List<ProfileCommentModel>>(
        data: List.from((response['data'] as List<dynamic>).map(
            (e) => ProfileCommentModel.fromJson(e as Map<String, dynamic>))),
        message: [],
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ProfileCommentModel>> addComment(
      {required Map<String, dynamic> body}) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
          endPoint: EndPoints.participate.addParticipateComment, data: body);

      _api.changeBaseUrl(EndPoints.baseUrls.url);
      return ResponseWrapper<ProfileCommentModel>.fromJson(
        response,
        (json) => ProfileCommentModel.fromJson(response['data']),
      );
    }

    return throwAppException(fun);
  }

  @override
  Future changeParticipateStatus(ChangeParticipateParams params) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint:
            EndPoints.participate.changeParticipateStatus(params.idParticipate),
        data: params.toMap(),
      );
      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("Error in changeParticipateStatus => $e");
      throw e.message;
    }
  }
}
