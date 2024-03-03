import 'dart:convert';

import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_services.dart';
import '../../../../core/api/api_utils.dart';
import '../../../../core/common/models/profile_invoice_model.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/common/widgets/profile_comments_model.dart';
import '../../../../core/utils/end_points.dart';
import '../models/participate_client_model.dart';

@injectable
class ParticipatesListDatasource {
  final ApiServices api;

  ParticipatesListDatasource(this.api);

  Future<ResponseWrapper<List<ParticipateModel>>> getParticipateList(
      Map<String, dynamic> body) async {
    fun() async {
      api.changeBaseUrl(EndPoints.phpUrl);
      final response = await api.get(
          endPoint: EndPoints.participate.allParticipates,
          queryParameters: body);

      return ResponseWrapper<List<ParticipateModel>>.fromJson(
        response,
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
      api.changeBaseUrl(EndPoints.phpUrl);
      final response = await api.post(
        endPoint: EndPoints.participate.addParticipate,
        data: body,
      );

      final client = ParticipateModel.fromJson(response['message'][0]);

      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<ParticipateModel>> editParticipate(
      Map<String, dynamic> body, Map<String, dynamic> params) async {
    fun() async {
      api.changeBaseUrl(EndPoints.phpUrl);
      final response = await api.post(
        endPoint: EndPoints.participate.updateParticipate,
        data: body,
        queryParameters: params,
      );

      final client = ParticipateModel.fromJson(response['message'][0]);

      return ResponseWrapper(message: client, data: client);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<ParticipateClientModel>>>
      getParticipateClientsList(String participateId) async {
    fun() async {
      api.changeBaseUrl(EndPoints.laravelUrl);
      final response = await api.get(
          endPoint:
              "${EndPoints.participate.allParticipateClients}/$participateId");

      api.changeBaseUrl(EndPoints.phpUrl);
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
      api.changeBaseUrl(EndPoints.laravelUrl);
      final response = await api.get(
          endPoint:
              "${EndPoints.participate.allParticipateInvoices}/$participateId");

      api.changeBaseUrl(EndPoints.phpUrl);
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
      api.changeBaseUrl(EndPoints.phpUrl);
      final response = await api.get(
          endPoint: EndPoints.participate.IvoiceByID, queryParameters: param);

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
      api.changeBaseUrl(EndPoints.laravelUrl);
      final response = await api.get(
          endPoint:
              "${EndPoints.participate.allParticipateComments}/$participateId");

      api.changeBaseUrl(EndPoints.phpUrl);
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
      api.changeBaseUrl(EndPoints.laravelUrl);
      final response = await api.post(
          endPoint: EndPoints.participate.addParticipateComment, data: body);

      api.changeBaseUrl(EndPoints.phpUrl);
      return ResponseWrapper<ProfileCommentModel>.fromJson(
        response,
        (json) => ProfileCommentModel.fromJson(response['data']),
      );
    }

    return throwAppException(fun);
  }
}
