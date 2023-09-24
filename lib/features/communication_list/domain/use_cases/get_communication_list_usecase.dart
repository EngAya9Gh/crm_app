import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/communication_list/data/models/communication_list_response.dart';
import 'package:crm_smart/features/communication_list/domain/repositories/communication_list_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';

@injectable
class GetCommunicationListUsecase
    extends UseCase<Result<ResponseWrapper<List<Communication>>>, GetCommunicationListParams> {
  GetCommunicationListUsecase(this.repository);

  final CommunicationListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<Communication>>>> call(GetCommunicationListParams params) {
    return repository.getCommunicationList(params.toMap());
  }
}

class GetCommunicationListParams {
  final String country;
  final String? userId;

  GetCommunicationListParams({required this.country, this.userId});

  Map<String, dynamic> toMap() => {
        'fk_country': this.country,
        if (userId != null) "fk_user": "$userId",
      };
}
