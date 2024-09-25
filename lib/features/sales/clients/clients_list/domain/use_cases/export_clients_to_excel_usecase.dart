import 'package:injectable/injectable.dart';
import '../../data/data_sources/clients_list_datasource.dart';
import '../../data/datasources/clients_list_datasource.dart';
import 'get_clients_with_filter_usecase.dart';

@injectable
class ExportClientsToExcelUseCase {
  final ClientsListDatasource datasource;

  ExportClientsToExcelUseCase(this.datasource);

  Future<List<int>> call(GetClientsWithFilterParams params) {
    return datasource.exportClientsToExcel(params);
  }
  }
