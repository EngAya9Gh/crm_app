import 'package:crm_smart/api/dio_services.dart';
import 'package:crm_smart/core/common/widgets/profile_comments_model.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final AgentsDistributorsProfileDataSourceImpl
      agentsDistributorsProfileDataSourceImpl =
      AgentsDistributorsProfileDataSourceImpl(DioServices());

  group("Agents and Distributors Profile DataSource", () {
    test("Add comment", () async {
      // Arrange
      final agentId = "1";
      final content = "content";

      // Act
      final result =
          await agentsDistributorsProfileDataSourceImpl.addAgentComment(
        agentId: agentId,
        content: content,
      );

      // Assert
      expect(result, isA<Either<String, ProfileCommentModel>>());
    });
  });
}
