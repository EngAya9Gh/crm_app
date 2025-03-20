import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FakeGetAgentsAndDistributorsParams extends Fake implements GetAgentsAndDistributorsParams {}

class GetAgentsAndDistributorsUseCaseMock extends Mock implements GetAgentsAndDistributorsUseCase {}

class ChangeStateAgentUseCaseMock extends Mock implements ChangeStateAgentUseCase {}

void main() {
  late GetAgentsAndDistributorsUseCaseMock getAgentsAndDistributorsUseCaseMock;
  late ChangeStateAgentUseCaseMock changeStateAgentUseCaseMock;
  late AgentsDistributorsCubit agentsDistributorsCubit;
  setUp(
    () async {},
  );
  setUpAll(() async {
    registerFallbackValue(FakeGetAgentsAndDistributorsParams());
    WidgetsFlutterBinding.ensureInitialized();
    getAgentsAndDistributorsUseCaseMock = GetAgentsAndDistributorsUseCaseMock();
    changeStateAgentUseCaseMock = ChangeStateAgentUseCaseMock();
    agentsDistributorsCubit = AgentsDistributorsCubit(getAgentsAndDistributorsUseCaseMock, changeStateAgentUseCaseMock);
  });

  group("Agents and Distributors", () {
    var listReturnedDate = [
      AgentDistributorModel(idAgent: '', nameAgent: '', typeAgent: '', emailAgent: '', mobileAgent: '', description: '', imageAgent: '')
    ];
    test("Success get agent distribution then expect to fill state with list of returned agent list", () async {
      // act
      when(() => getAgentsAndDistributorsUseCaseMock(any())).thenAnswer((invocation) async => Right(listReturnedDate));
      agentsDistributorsCubit.getAgentsAndDistributors();

      await Future.delayed(Duration.zero);
      // Assert
      expect(agentsDistributorsCubit.state, AgentsDistributorsState(status: StateStatus.success, agentsAndDistributorsList: listReturnedDate));
    });
    test("Failed get agent distribution then expect keep data filed in the state but change status to failed and catch error ", () async {
      // act
      when(() => getAgentsAndDistributorsUseCaseMock(any())).thenAnswer((invocation) async => Left('exception'));
      agentsDistributorsCubit.getAgentsAndDistributors();

      await Future.delayed(Duration.zero);
      // Assert
      expect(agentsDistributorsCubit.state,
          AgentsDistributorsState(agentsAndDistributorsList: listReturnedDate, status: StateStatus.failure, error: 'exception'));
    });
  });
}
