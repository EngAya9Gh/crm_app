import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_participates/data/models/participate_client_model.dart';
import 'package:crm_smart/features/manage_participates/domain/repositories/participate_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/models/response_wrapper/response_wrapper.dart';


@injectable
class ParticipateClientListUsecase
    extends UseCase<Result<ResponseWrapper<List<ParticipateClientModel>>>, GetParticipateClientListParams> {
  ParticipateClientListUsecase(this.repository);

  final ParticipateListRepository repository;
  

  @override
  Future<Result<ResponseWrapper<List<ParticipateClientModel>>>> call(GetParticipateClientListParams params) {
    
    return repository.getParticipateClientsList(params.idParticipate.toString());
  }
}

class GetParticipateClientListParams {
 final String? idParticipate;

  GetParticipateClientListParams(
    {this.idParticipate}
  );

 Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {
     
    
    }..removeWhere((key, value) => value == null);

    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }
   Map<String, dynamic> get toParams  => {'id_participate': idParticipate};
}
