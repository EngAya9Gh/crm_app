import 'package:crm_smart/core/services/api/api_services.dart';
import 'package:crm_smart/core/services/cache_services/cache_services.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    AgentsDistributorsProfileRepo,
    ApiServices,
    CacheServices,
  ],
  customMocks: [
    MockSpec<MockSpec<http.Client>>(as: #HttpClientMock),
  ],
)
void main() {}
