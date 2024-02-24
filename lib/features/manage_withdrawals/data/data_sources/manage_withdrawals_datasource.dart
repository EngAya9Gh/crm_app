import 'dart:convert';

import 'package:crm_smart/core/api/client.dart';
import 'package:crm_smart/features/manage_withdrawals/data/models/reject_reason.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api/api_utils.dart';
import '../../../../../../core/api/client_config.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/utils/end_points.dart';
import '../../../../model/invoiceModel.dart';
import '../models/invoice_withdrawal_series_model.dart';
import '../models/user_series.dart';
import '../models/withdrawn_details_model.dart';

@injectable
class ManageWithdrawalsDatasource {
  ManageWithdrawalsDatasource(this._clientApi);

  final ClientApi _clientApi;

  Future<ResponseWrapper<List<UserSeries>>> getAllUsersSeries(
      Map<String, dynamic> params) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.series.getUsersSeries,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
          queryParameters: params,
        ),
      );

      return ResponseWrapper<List<UserSeries>>.fromJson(
        jsonDecode(response.data),
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return UserSeries.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<UserSeries>>> updateAllUsersSeries(
      Map<String, dynamic> data) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.series.updateUsersSeries,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
          data: data,
        ),
      );

      return ResponseWrapper<List<UserSeries>>.fromJson(
        response.data,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return UserSeries.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<InvoiceModel>>> getWithdrawalsInvoice() async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.series.getWithdrawalsInvoices,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<InvoiceModel>>.fromJson(
        jsonDecode(response.data),
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return InvoiceModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<InvoiceWithdrawalSeries>>>
      getWithdrawalInvoiceDetails(Map<String, dynamic> params) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.series.getWithdrawalInvoiceDetails,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
          queryParameters: params,
        ),
      );

      return ResponseWrapper<List<InvoiceWithdrawalSeries>>.fromJson(
        jsonDecode(response.data),
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return InvoiceWithdrawalSeries.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<WithdrawnDetailsModel>> getWithdrawnDetails(
      Map<String, dynamic> params) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.series.getWithdrawnDetails,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
          queryParameters: params,
        ),
      );

      return ResponseWrapper<WithdrawnDetailsModel>.fromJson(
        jsonDecode(response.data),
        (json) =>
            WithdrawnDetailsModel.fromJson(json[0] as Map<String, dynamic>),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<bool>> setApproveSeries(
      Map<String, dynamic> params, Map<String, dynamic> data) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.series.setApproveSeries,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
          queryParameters: params,
          data: data,
        ),
      );

      return ResponseWrapper<bool>.fromJson(
          jsonDecode(response.data), (json) => true);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<RejectReason>>> getRejectReasons() async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.client.getRejectReasons,
          clientMethod: ClientMethod.get,
          responseType: ResponseType.json,
        ),
      );

      return ResponseWrapper<List<RejectReason>>.fromJson(
        response.data,
        (json) => List.from((json as List<dynamic>)
            .map((e) => RejectReason.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<String>> addRejectReasons(
      Map<String, dynamic> params) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.client.addRejectReasons,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
          data: params,
        ),
      );

      return ResponseWrapper<String>.fromJson(response.data, (json) => json);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<String>> editRejectReasons(
      Map<String, dynamic> params, Map<String, dynamic> data) async {
    fun() async {
      final response = await _clientApi.request(
        RequestConfig(
          endpoint: EndPoints.client.editRejectReasons,
          clientMethod: ClientMethod.post,
          responseType: ResponseType.json,
          data: data,
          queryParameters: params,
        ),
      );

      return ResponseWrapper<String>.fromJson(response.data, (json) => json);
    }

    return throwAppException(fun);
  }
}
