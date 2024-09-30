import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../data/data_sources/clients_list_datasource.dart';
import 'get_clients_with_filter_usecase.dart';

@injectable
class ExportClientsToExcelUseCase {
  final ClientsListDatasource datasource;

  ExportClientsToExcelUseCase(this.datasource);

  Future<Either<String, PaginationResponseWrapper>> call(
      GetClientsWithFilterParams params) {
    return datasource.exportClientsToExcel(params);
  }
}
