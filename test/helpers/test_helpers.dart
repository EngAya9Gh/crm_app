import 'package:crm_smart/features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    AgentsDistributorsProfileRepo,
  ],
  customMocks: [
    MockSpec<MockSpec<http.Client>>(as: #HttpClientMock),
  ],
)
void main() {}
