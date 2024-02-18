import 'dart:async';

import 'package:crm_smart/features/manage_agents_and_distributors/presentation/widgets/add_agent_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/di/di_container.dart';
import '../../../../view_model/agent_dsitributor_vm.dart';
import '../../../../view_model/vm.dart';
import '../manager/manage_agents_and_distributors_cubit/manage_agents_and_distributors_cubit.dart';
import '../widgets/agents_and_distributors_page_body.dart';

class AgentsAndDistributorsView extends StatefulWidget {
  const AgentsAndDistributorsView({Key? key}) : super(key: key);

  @override
  State<AgentsAndDistributorsView> createState() =>
      _AgentsAndDistributorsViewState();
}

class _AgentsAndDistributorsViewState extends State<AgentsAndDistributorsView>
    with
        StateViewModelMixin<AgentsAndDistributorsView,
            AgentDistributorViewModel> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      viewmodel.getAgentsAndDistributors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ManageAgentsAndDistributorsCubit>()..getAgentsAndDistributors(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'الوكلاء والموزعين',
            style: TextStyle(color: kWhiteColor),
          ),
          centerTitle: true,
        ),
        floatingActionButton: AddAgentButton(),
        body: AgentsAndDistributorsPageBody(),
      ),
    );
  }
}
