import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../../../../../../model/invoiceModel.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class CancelDateInstallUsecase
    extends UseCase<Either<String, InvoiceModel>, CancelDateInstallParams> {
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
