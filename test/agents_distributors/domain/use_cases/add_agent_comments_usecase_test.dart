import 'package:crm_smart/core/common/widgets/profile_comments_model.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late AddAgentCommentUsecase addAgentCommentUsecase;
  late AgentsDistributorsProfileRepo agentsDistributorsProfileRepo;

  setUp(() {
    agentsDistributorsProfileRepo = MockAgentsDistributorsProfileRepo();
    addAgentCommentUsecase =
        AddAgentCommentUsecase(agentsDistributorsProfileRepo);
  });

  final params = AddAgentCommentParams(
    agentId: "1",
    content: "content",
  );

  final profileCommentModel = ProfileCommentModel(
    id: 1,
    userId: 1,
    participateId: 1,
    content: "content",
    addDate: DateTime.now().toString(),
    dateComment: DateTime.now().toString(),
    imgImage: '',
    nameUser: '',
    updateDate: DateTime.now().toString(),
  );

  test('Add agent comment usecase', () async {
    // Arrange
    when(agentsDistributorsProfileRepo.addAgentComment(
      agentId: params.agentId,
      content: params.content,
    )).thenAnswer((_) async => Right(profileCommentModel));

    // Act
    final result = await addAgentCommentUsecase(params);

    // Assert
    expect(result, Right(profileCommentModel));
  });
}
