import 'package:crm_smart/core/common/models/client_model.dart';
import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../model/invoiceModel.dart';
import '../../domain/use_cases/verified_client_usecase.dart';
import '../models/verified_client_model.dart';

@injectable
class VerifiedClientsDatasource {
  final ApiServices api;

  VerifiedClientsDatasource(this.api);

  Future<ResponseWrapper<List<VerifiedClientModel>>> getVerifiedClient() async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.finance.getVerifiedClient,
      );

      return ResponseWrapper<List<VerifiedClientModel>>.fromJson(
          response, (json) => List.from((json as List<dynamic>).map((e) => VerifiedClientModel.fromJson(e as Map<String, dynamic>))));
    } catch (e) {
      debugPrint("error in verified invoice in repo => $e");
      throw Exception("$e");
    }
  }

  Future<Either<String, VerifiedClientModel>> verifiedStatus(VerifiedClientParams params) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
        endPoint: EndPoints.finance.deportClient(params.verifiedClientModel.clientModel.idClients!),
      );

      return Right(params.verifiedClientModel.copyWith());
    } catch (e) {
      debugPrint("error in verified invoice in repo => $e");
      throw Exception("$e");
    }
  }
}
