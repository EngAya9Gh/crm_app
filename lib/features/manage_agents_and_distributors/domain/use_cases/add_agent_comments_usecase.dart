import 'package:crm_smart/common/widgets/profile_comments_model.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/use_case/use_case.dart';

@injectable
class AddAgentCommentUsecase extends UseCase<
    Either<String, ProfileCommentModel>, AddAgentCommentParams> {
  AddAgentCommentUsecase(this.repository);

  final AgentsDistributorsProfileRepo repository;

  @override
  Future<Either<String, ProfileCommentModel>> call(
    AddAgentCommentParams params,
  ) {
    return repository.addAgentComment(
      agentId: params.agentId,
      content: params.content,
    );
  }
}

class AddAgentCommentParams {
  final String agentId;
  final String content;

  AddAgentCommentParams({
    required this.agentId,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {}
      ..removeWhere((key, value) => value == null);
    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }

  Map<String, dynamic> get toParams => {'id_agent': agentId};
}
