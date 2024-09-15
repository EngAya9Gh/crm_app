import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../data/models/agent_distributor_model.dart';
import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';
import '../widgets/agents_distributors_actions_page_body.dart';

class AgentDistributorsActionsPage extends StatefulWidget {
  const AgentDistributorsActionsPage({
    super.key,
    this.agent,
  });

  final AgentDistributorModel? agent;

  @override
  State<AgentDistributorsActionsPage> createState() =>
      _AgentDistributorsActionsPageState();
}

class _AgentDistributorsActionsPageState
    extends State<AgentDistributorsActionsPage> {
  @override
  void initState() {
    context.read<AgentsDistributorsActionsCubit>()
      ..resetAgentDistributorActionEntity()
      ..getAllCity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return AppScaffold(
        appBar: CustomAppBar(
            title: '${widget.agent != null ? 'تعديل' : 'إضافة'} وكيل/موزع'),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: AgentDistributorsActionsPageBody(
            agentDistributorModel: widget.agent,
          ),
        ),
      );
    });
  }
}
