import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/invoice_type_enum.dart';
import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/location/branch_model.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../model/usermodel.dart';
import '../repositories/clients_debts_reports_repo.dart';

@lazySingleton
class GetClientsDebtsReportsUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetClientsDebtsReportsParams> {
  GetClientsDebtsReportsUsecase(this._repository);

  final ClientsDebtsReportsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetClientsDebtsReportsParams params,
  ) async {
    return await _repository.getClientsDebtsReports(params);
  }
}

class GetClientsDebtsReportsParams {
  final ReportTypeEnum type;
  final BranchModel? region;
  final UserModel? user;
  final bool? isMarketing;
  final InvoiceTypeEnum? invoiceType;

  const GetClientsDebtsReportsParams({
    required this.type,
    this.region,
    this.user,
    this.isMarketing,
    this.invoiceType,

  });

  Map<String, dynamic> toParams() {
    return {
      'id_regoin': region?.branchId,
      'id_user': user?.id,
      'without_withdrawn': invoiceType?.value==InvoiceTypeEnum.withdrawnInvoices.value?1:null,
      'ismarketing': isMarketing == true ? 1 : null,
    }..removeWhere((key, value) => value == null || value == '');
  }

  Map<String, dynamic> toBody() {
    return {
      'type': type.toParam,
    };
  }
}
