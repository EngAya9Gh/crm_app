import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/sales/clients_list/data/models/client_marketing_meport_model.dart';
import 'package:crm_smart/features/sales/clients_list/domain/repositories/clients_list_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetClientMarketingReportUsecase
    extends UseCaseNoParam<Either<String, List<clientMarketingReportModel>>> {
  GetClientMarketingReportUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Either<String, List<clientMarketingReportModel>>> call() {
    return repository.getClientMarketingReport();
  }
}
