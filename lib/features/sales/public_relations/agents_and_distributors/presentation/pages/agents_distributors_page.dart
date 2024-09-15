import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import '../widgets/add_agent_button.dart';
import '../widgets/agents_and_distributors_page_body.dart';

class AgentsAndDistributorsPage extends StatefulWidget {
  const AgentsAndDistributorsPage({super.key});

  @override
  State<AgentsAndDistributorsPage> createState() =>
      _AgentsAndDistributorsPageState();
}

class _AgentsAndDistributorsPageState extends State<AgentsAndDistributorsPage> {
  late final AgentsDistributorsCubit cubit;

  @override
  void initState() {
    cubit = context.read<AgentsDistributorsCubit>();
    cubit
      ..clear(context)
      ..getAgentsAndDistributors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: AppStrings.labelAgentsAndDistributors),
      floatingActionButton: AddAgentButton(),
      body: AgentsAndDistributorsPageBody(),
    );
  }
}
