import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/common/widgets/profile_comments_model.dart';
import '../../../../../../core/services/api/result.dart';
import '../repositories/participate_list_repository.dart';

@injectable
class ParticipateCommentListUsecase extends BaseUsecase<
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
