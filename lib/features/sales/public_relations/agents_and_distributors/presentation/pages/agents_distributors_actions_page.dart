import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../model/agent_distributor_model.dart';
import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';
import '../widgets/agents_distributors_actions_page_body.dart';

class AgentDistributorsActionsPage extends StatefulWidget {
  const AgentDistributorsActionsPage({Key? key, this.agentDistributorModel})
      : super(key: key);

  final AgentDistributorModel? agentDistributorModel;

  @override
  State<AgentDistributorsActionsPage> createState() =>
      _AgentDistributorsActionsPageState();
}

class _AgentDistributorsActionsPageState
    extends State<AgentDistributorsActionsPage> {
  @override
  void initState() {
    context.read<AgentsDistributorsActionsCubit>()
      ..getAllCity(fkCountry: AppConstants.currentCountry(context) ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: AgentDistributorsActionsPageBody(
            agentDistributorModel: widget.agentDistributorModel,
          ),
        ),
      );
    });
  }
}
