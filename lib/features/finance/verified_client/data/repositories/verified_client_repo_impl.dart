import 'package:crm_smart/features/finance/verified_client/domain/use_cases/verified_client_usecase.dart';
import 'package:crm_smart/features/finance/verified_invoice/domain/use_cases/verified_invoice_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import '../../domain/repositories/verified_client_repo.dart';
import '../data_sources/verified_client_datasource.dart';
import '../models/verified_client_model.dart';

@Injectable(as: VerifiedClientRepository)
class VerifiedClientRepoImpl implements VerifiedClientRepository {
  final VerifiedClientsDatasource datasource;

  VerifiedClientRepoImpl(this.datasource);

  @override
  Future<Result<ResponseWrapper<List<VerifiedClientModel>>>> getVerifiedClient(GetInvoicesByPrivilegesParams params) async {
    return toApiResult(() async => await datasource.getVerifiedClient(params));
  }

  @override
  Future<Either<String, VerifiedClientModel>> verifiedClient(VerifiedClientParams params) async {
    try {
      final data = await datasource.verifiedStatus(params);
      return data;
    } catch (e) {
      debugPrint("error in verified invoice in repo => $e");
      return Left(e.toString());
    }
  }
}
