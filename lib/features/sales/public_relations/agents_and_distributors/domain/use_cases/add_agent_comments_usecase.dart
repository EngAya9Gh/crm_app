import '../../../../../../core/common/widgets/profile_comments_model.dart';
import '../repositories/agents_distributors_profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';

@lazySingleton
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
}
