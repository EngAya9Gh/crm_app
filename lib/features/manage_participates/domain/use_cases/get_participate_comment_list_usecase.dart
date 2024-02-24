import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_participates/domain/repositories/participate_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/common/widgets/profile_comments_model.dart';

@injectable
class ParticipateCommentListUsecase extends UseCase<
    Result<ResponseWrapper<List<ProfileCommentModel>>>,
    GetParticipateCommentListParams> {
  ParticipateCommentListUsecase(this.repository);

  final ParticipateListRepository repository;

  @override
  Future<Result<ResponseWrapper<List<ProfileCommentModel>>>> call(
      GetParticipateCommentListParams params) {
    return repository.getParticipateCommentsList(params.agentId.toString());
  }
}

class GetParticipateCommentListParams {
  final String? agentId;

  GetParticipateCommentListParams({this.agentId});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {}
      ..removeWhere((key, value) => value == null);
    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }

  Map<String, dynamic> get toParams => {'id_participate': agentId};
}
