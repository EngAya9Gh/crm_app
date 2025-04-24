import 'dart:convert';

import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/withdrawal_invoice_status_enum.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_services.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../../model/invoiceModel.dart';
import '../../domain/use_cases/cancel_withdrawal_usecase.dart';
import '../../domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart';
import '../models/invoice_withdrawal_series_model.dart';
import '../models/reject_reason.dart';
import '../models/user_series.dart';
import '../models/withdrawn_details_model.dart';

@lazySingleton
class ManageWithdrawalsDatasource {
  ManageWithdrawalsDatasource(this._api);

  final ApiServices _api;

  Future<ResponseWrapper<List<UserSeries>>> getAllUsersSeries(Map<String, dynamic> params) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(endPoint: EndPoints.series.getUsersSeries, queryParameters: params);

      return ResponseWrapper<List<UserSeries>>.fromJson(
        (response is String) ? jsonDecode(response) : response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return UserSeries.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<UserSeries>>> updateAllUsersSeries(Map<String, dynamic> data) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(endPoint: EndPoints.series.updateUsersSeries, data: data);

      return ResponseWrapper<List<UserSeries>>.fromJson(
        response,
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
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.get(endPoint: EndPoints.series.getWithdrawalsInvoices);

      return ResponseWrapper<List<InvoiceModel>>.fromJson(
        (response is String) ? jsonDecode(response) : response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return InvoiceModel.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<InvoiceModel>>> getFilteredWithdrawalsInvoice(
    GetFilteredWithdrawalsInvoicesParams params,
  ) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(
        endPoint: EndPoints.series.getSeriesInvoiceAll,
        queryParameters: {
          "status": params.status.toParam,
        },
      );
      return ResponseWrapper<List<InvoiceModel>>.fromJson(
        response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            final item = InvoiceModel.fromJson(e);
            return item;
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<InvoiceWithdrawalSeries>>> getWithdrawalInvoiceDetails(Map<String, dynamic> params) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await _api.get(endPoint: EndPoints.series.getWithdrawalInvoiceDetails, queryParameters: params);

      return ResponseWrapper<List<InvoiceWithdrawalSeries>>.fromJson(
        (response is String) ? jsonDecode(response) : response,
        (json) {
          return List.from((json as List<dynamic>).map((e) {
            return InvoiceWithdrawalSeries.fromJson(e as Map<String, dynamic>);
          }));
        },
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<WithdrawnDetailsModel>> getWithdrawnDetails(Map<String, dynamic> params) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(endPoint: EndPoints.series.getWithdrawnDetails(params['fk_invoice']));
      return ResponseWrapper<WithdrawnDetailsModel>.fromJson(
        response,
        (json) => WithdrawnDetailsModel.fromJson(json),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<bool>> setApproveSeries(Map<String, dynamic> params, Map<String, dynamic> data) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(endPoint: EndPoints.series.seriesApprove(params['idApprove_series']), data: data);
      return ResponseWrapper<bool>.fromJson((response is String) ? jsonDecode(response) : response, (json) => true);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<RejectReason>>> getRejectReasons() async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.get(endPoint: EndPoints.client.getRejectReasons);
      return ResponseWrapper<List<RejectReason>>.fromJson(
        response,
        (json) => List.from((json as List<dynamic>).map((e) => RejectReason.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<RejectReason>> addRejectReasons(Map<String, dynamic> params) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: EndPoints.client.addRejectReasons,
        data: params,
      );
      return ResponseWrapper.fromJson(response, (json) => RejectReason.fromJson(json));
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<RejectReason>> editRejectReasons(Map<String, dynamic> params, Map<String, dynamic> data) async {
    fun() async {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: EndPoints.client.editRejectReasons(int.parse(params['id_rejectClient'])),
        data: data,
        queryParameters: params,
      );

      return ResponseWrapper<RejectReason>.fromJson(response, (json) => RejectReason.fromJson(json));
    }

    return throwAppException(fun);
  }

  Future<PaginationResponseWrapper> cancelWithdrawal(
    CancelWithdrawalParams params,
  ) async {
    try {
      _api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _api.post(
        endPoint: EndPoints.series.cancelWithdrawal(params.idInvoice),
      );
      return PaginationResponseWrapper.fromJson(response);
    } on BaseAppException catch (e) {
      debugPrint("error cancelWithdrawal in datasource => ${e.message}");
      throw e.message;
    }
  }
}
