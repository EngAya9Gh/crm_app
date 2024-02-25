import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/widgets/profile_comments_model.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/agents_distributors_profile_repo.dart';

@lazySingleton
class GetAgentCommentsListUsecase extends UseCase<
    Either<String, List<ProfileCommentModel>>, GetAgentCommentListParams> {
  GetAgentCommentsListUsecase(this.repository);

  final AgentsDistributorsProfileRepo repository;

  @override
  Future<Either<String, List<ProfileCommentModel>>> call(
    GetAgentCommentListParams params,
  ) {
    return repository.getParticipateCommentsList(agentId: params.agentId!);
  }
}

class GetAgentCommentListParams {
  final String? agentId;

  GetAgentCommentListParams({this.agentId});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {}
      ..removeWhere((key, value) => value == null);
    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }

  Map<String, dynamic> get toParams => {'id_agent': agentId};
}
