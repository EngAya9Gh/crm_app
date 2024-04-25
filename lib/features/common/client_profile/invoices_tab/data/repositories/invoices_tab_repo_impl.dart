import 'package:crm_smart/features/common/client_profile/invoices_tab/data/data_sources/incoives_tab_datasource.dart';
import 'package:crm_smart/features/common/client_profile/invoices_tab/domain/repositories/invoices_tab_repo.dart';
import 'package:crm_smart/features/common/client_profile/invoices_tab/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: InvoicesTabRepo)
class InvoicesTabRepoImpl implements InvoicesTabRepo {
  final InvoicesTabDataSource _dataSource;

  InvoicesTabRepoImpl(this._dataSource);

  @override
  Future<Either<String, List<InvoiceModel>>> getInvoiceByPrivileges(
    GetInvoicesByPrivilegesParams params,
  ) {
    return _dataSource.getInvoiceByPrivileges(params);
  }
}
