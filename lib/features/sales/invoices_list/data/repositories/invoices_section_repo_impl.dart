import '../data_sources/incoives_section_datasource.dart';
import '../../domain/repositories/invoices_section_repo.dart';
import '../../domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: InvoicesTabRepo)
class InvoicesTabRepoImpl implements InvoicesTabRepo {
  final InvoicesTabDataSource _dataSource;

  InvoicesTabRepoImpl(this._dataSource);

  @override
  Future<Either<String, dynamic>> getInvoiceByPrivileges(
    GetInvoicesByPrivilegesParams params,
  ) {
    return _dataSource.getInvoiceByPrivileges(params);
  }
}
