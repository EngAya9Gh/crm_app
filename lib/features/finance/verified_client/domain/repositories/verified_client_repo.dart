import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../model/invoiceModel.dart';
import '../../data/models/verified_client_model.dart';
import '../use_cases/verified_client_usecase.dart';

abstract class VerifiedClientRepository {
  Future<Result<ResponseWrapper<List<VerifiedClientModel>>>> getVerifiedClient();
  Future<Either<String, VerifiedClientModel>> verifiedClient(VerifiedClientParams params);
}
