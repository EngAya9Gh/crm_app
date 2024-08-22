import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import '../widgets/add_agent_button.dart';
import '../widgets/agents_and_distributors_page_body.dart';

class AgentsAndDistributorsPage extends StatefulWidget {
  const AgentsAndDistributorsPage({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.labelAgentsAndDistributors,
          style: TextStyle(
            color: AppColors.kWhiteColor,
          ),
        ),
      ),
      floatingActionButton: AddAgentButton(),
      body: AgentsAndDistributorsPageBody(),
    );
  }
}
