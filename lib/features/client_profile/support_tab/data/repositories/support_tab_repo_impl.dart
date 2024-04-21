import 'package:crm_smart/features/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart';
import 'package:crm_smart/features/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/support_tab_repo.dart';
import '../../domain/use_cases/get_invoice_by_client_usecase.dart';
import '../data_sources/support_tab_datasource.dart';

@LazySingleton(as: SupportTabRepo)
class SupportTabRepoImpl implements SupportTabRepo {
  final SupportTabDataSource _supportTabDataSource;

  SupportTabRepoImpl(this._supportTabDataSource);

  @override
  Future<Either<String, List<InvoiceModel>>> getInvoiceByClient(
    GetInvoiceByClientParams params,
  ) {
    return _supportTabDataSource.getInvoiceByClient(params);
  }

  @override
  Future<Either<String, InvoiceModel>> setDateDone(SetDateDoneParams params) {
    return _supportTabDataSource.setDateDone(params);
  }

  @override
  Future<Either<String, InvoiceModel>> setReadyInstall(
      SetReadyInstallParams params) {
    return _supportTabDataSource.setReadyInstall(params);
  }
}
