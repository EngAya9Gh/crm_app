import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../model/invoiceModel.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class CancelDateInstallUsecase
    extends BaseUsecase<Either<String, InvoiceModel>, CancelDateInstallParams> {
  CancelDateInstallUsecase(this._repository);

  final SupportTabRepo _repository;

  @override
  Future<Either<String, InvoiceModel>> call(
    CancelDateInstallParams params,
  ) async {
    return await _repository.cancelDateInstall(params);
  }
}

class CancelDateInstallParams {
  final String idInvoice;

  CancelDateInstallParams({
    required this.idInvoice,
  });
}
