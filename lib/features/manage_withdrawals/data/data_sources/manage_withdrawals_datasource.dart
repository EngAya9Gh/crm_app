import 'dart:convert';

import 'package:crm_smart/core/api/api_services.dart';
import 'package:crm_smart/core/common/enums/invoice_status_enum.dart';
import 'package:crm_smart/features/manage_withdrawals/data/models/reject_reason.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/api/api_utils.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/utils/end_points.dart';
import '../../../../model/invoiceModel.dart';
import '../../domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart';
import '../models/invoice_withdrawal_series_model.dart';
import '../models/user_series.dart';
import '../models/withdrawn_details_model.dart';

@lazySingleton
class ManageWithdrawalsDatasource {
  ManageWithdrawalsDatasource(this.api);

  final ApiServices api;

  Future<ResponseWrapper<List<UserSeries>>> getAllUsersSeries(
      Map<String, dynamic> params) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await api.get(
          endPoint: EndPoints.series.getUsersSeries, queryParameters: params);

      return ResponseWrapper<List<UserSeries>>.fromJson(
        jsonDecode(response),
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
      api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await api.post(
          endPoint: EndPoints.series.updateUsersSeries, data: data);

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
      api.changeBaseUrl(EndPoints.baseUrls.url);
      final response =
          await api.get(endPoint: EndPoints.series.getWithdrawalsInvoices);

      return ResponseWrapper<List<InvoiceModel>>.fromJson(
        jsonDecode(response),
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
      api.changeBaseUrl(EndPoints.baseUrls.url_laravel);
      final response = await api.get(
        endPoint: EndPoints.series.getSeriesInvoiceAll,
        queryParameters: {
          "status": params.status.value,
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

  Future<ResponseWrapper<List<InvoiceWithdrawalSeries>>>
      getWithdrawalInvoiceDetails(Map<String, dynamic> params) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await api.get(
          endPoint: EndPoints.series.getWithdrawalInvoiceDetails,
          queryParameters: params);

      return ResponseWrapper<List<InvoiceWithdrawalSeries>>.fromJson(
        jsonDecode(response),
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
      api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await api.get(
          endPoint: EndPoints.series.getWithdrawnDetails,
          queryParameters: params);
      return ResponseWrapper<WithdrawnDetailsModel>.fromJson(
        jsonDecode(response),
        (json) =>
            WithdrawnDetailsModel.fromJson(json[0] as Map<String, dynamic>),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<bool>> setApproveSeries(
      Map<String, dynamic> params, Map<String, dynamic> data) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await api.post(
          endPoint: EndPoints.series.setApproveSeries,
          data: data,
          queryParameters: params);
      return ResponseWrapper<bool>.fromJson(
          jsonDecode(response), (json) => true);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<List<RejectReason>>> getRejectReasons() async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.url);
      final response =
          await api.get(endPoint: EndPoints.client.getRejectReasons);
      return ResponseWrapper<List<RejectReason>>.fromJson(
        response,
        (json) => List.from((json as List<dynamic>)
            .map((e) => RejectReason.fromJson(e as Map<String, dynamic>))),
      );
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<String>> addRejectReasons(
      Map<String, dynamic> params) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await api.post(
        endPoint: EndPoints.client.addRejectReasons,
        data: params,
      );
      return ResponseWrapper<String>.fromJson(response, (json) => json);
    }

    return throwAppException(fun);
  }

  Future<ResponseWrapper<String>> editRejectReasons(
      Map<String, dynamic> params, Map<String, dynamic> data) async {
    fun() async {
      api.changeBaseUrl(EndPoints.baseUrls.url);
      final response = await api.post(
        endPoint: EndPoints.client.editRejectReasons,
        data: data,
        queryParameters: params,
      );

      return ResponseWrapper<String>.fromJson(response, (json) => json);
    }

    return throwAppException(fun);
  }
}
