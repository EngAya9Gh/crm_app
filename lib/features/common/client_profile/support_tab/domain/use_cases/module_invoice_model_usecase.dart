import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../data/module_invioce_model.dart';
import '../repositories/support_tab_repo.dart';
import 'cancel_date_usecase.dart';

@lazySingleton
class GetModuleInvoiceModelUsecase extends BaseUsecase<Either<String, List<ModuleInvoiceModel>>, CancelDateInstallParams> {
  GetModuleInvoiceModelUsecase(this._repository);

  final SupportTabRepo _repository;

  @override
  Future<Either<String, List<ModuleInvoiceModel>>> call(
    CancelDateInstallParams params,
  ) async {
    return await _repository.getModulesByInvoice(params);
  }
}
