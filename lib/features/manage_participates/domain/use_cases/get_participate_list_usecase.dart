import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import 'package:crm_smart/features/manage_participates/domain/repositories/participate_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/response_wrapper/response_wrapper.dart';


@injectable
class ParticipateListUsecase
    extends UseCase<Result<ResponseWrapper<List<ParticipateModel>>>, GetParticipateListParams> {
  ParticipateListUsecase(this.repository);

  final ParticipateListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<ParticipateModel>>>> call(GetParticipateListParams params) {
    return repository.getParticipateList(params.toMap());
  }
}

class GetParticipateListParams {
  // final String country;
  // final String? citId;

  GetParticipateListParams(
    // {required this.country, this.citId}
    );

  Map<String, dynamic> toMap() => {
        // 'fk_country': this.country,
        // if (citId != null) "fk_city": "$citId",
      };
}
