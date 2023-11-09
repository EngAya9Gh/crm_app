import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/communication_list/domain/repositories/communication_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/distinctive_client.dart';

@injectable
class GetCommunicationListUsecase
    extends UseCase<Result<ResponseWrapper<List<DistinctiveClient>>>, GetCommunicationListParams> {
  GetCommunicationListUsecase(this.repository);

  final CommunicationListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<DistinctiveClient>>>> call(GetCommunicationListParams params) {
    return repository.getCommunicationList(params.toMap());
  }
}

class GetCommunicationListParams {
  final String country;
  final String? citId;

  GetCommunicationListParams({required this.country, this.citId});

  Map<String, dynamic> toMap() => {
        'fk_country': this.country,
        if (citId != null) "fk_city": "$citId",
      };
}
