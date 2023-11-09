import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/clients_list/domain/repositories/clients_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/clients_list_response.dart';

@injectable
class GetAllClientsListUseCase extends UseCase<Result<ResponseWrapper<List<ClientModel>>>, GetAllClientsListParams> {
  GetAllClientsListUseCase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<ClientModel>>>> call(GetAllClientsListParams params) {
    return repository.getAllClients(params.toMap());
  }
}

class GetAllClientsListParams {
  final String country;
  final int page;
  final int perPage;

  GetAllClientsListParams({
    required this.country,
    required this.page,
    required this.perPage,
  });

  Map<String, dynamic> toMap() => {
        'fk_country': this.country,
        'page': this.page.toString(),
        'row_in_page': this.perPage.toString(),
      };
}
