import 'dart:convert';
import 'package:crm_smart/core/api/client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../common/constants/route.dart';
import '../../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/api/api_utils.dart';
import '../../../../../../core/api/client_config.dart';
import '../../../../model/invoiceModel.dart';
import '../models/user_series.dart';

@injectable
class ManageWithdrawalsDatasource {
  ManageWithdrawalsDatasource(this._clientApi);
  final ClientApi _clientApi;

  Future<ResponseWrapper<List<UserSeries>>> getAllUsersSeries(Map<String,dynamic> params) async {
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

  Future<ResponseWrapper<List<UserSeries>>> updateAllUsersSeries(Map<String,dynamic> data) async {
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
}
