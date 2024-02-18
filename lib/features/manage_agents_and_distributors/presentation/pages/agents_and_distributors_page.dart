import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app_strings.dart';
import '../../../../constants.dart';
import '../../../../core/di/di_container.dart';
import '../manager/manage_agents_and_distributors_cubit/manage_agents_and_distributors_cubit.dart';
import '../widgets/add_agent_button.dart';
import '../widgets/agents_and_distributors_page_body.dart';

class AgentsAndDistributorsView extends StatelessWidget {
  const AgentsAndDistributorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ManageAgentsAndDistributorsCubit>()..getAgentsAndDistributors(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.labelAgentsAndDistributors,
            style: TextStyle(
              color: kWhiteColor,
            ),
          ),
        ),
        floatingActionButton: AddAgentButton(),
        body: AgentsAndDistributorsPageBody(),
      ),
    );
  }
}
