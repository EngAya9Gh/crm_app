import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../model/agent_distributor_model.dart';
import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';
import '../widgets/agents_distributors_actions_page_body.dart';

class AgentDistributorsActionsPage extends StatelessWidget {
  const AgentDistributorsActionsPage({Key? key, this.agentDistributorModel})
      : super(key: key);

  final AgentDistributorModel? agentDistributorModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AgentsDistributorsActionsCubit()
        ..getAllCity(fkCountry: AppConstants.currentCountry(context)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: AgentDistributorsActionsPageBody(
            agentDistributorModel: agentDistributorModel,
          ),
        ),
      ),
    );
  }
}
