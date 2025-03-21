import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/agent_distributor_model.dart';
import '../../domain/use_cases/get_agent_by_id_usecase.dart';
import '../manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';
import '../widgets/agent_profile_page_body.dart';

class AgentProfilePage extends StatefulWidget {
  const AgentProfilePage({
    super.key,
    this.agent,
    required this.idAgent,
    this.tabIndex,
  });

  final String idAgent;

  final AgentDistributorModel? agent;
  final int? tabIndex;

  @override
  State<AgentProfilePage> createState() => _AgentProfilePageState();
}

class _AgentProfilePageState extends State<AgentProfilePage> {
  late final AgentsDistributorsProfileBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<AgentsDistributorsProfileBloc>();

    if (widget.agent != null) {
      _bloc.storeCurrentAgent(widget.agent!);
    } else {
      _bloc.add(GetAgentByIdEvent(
        getAgentByIdParams: GetAgentByIdParams(agentId: widget.idAgent),
      ));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AgentsDistributorsProfileBloc, AgentsDistributorsProfileState>(
        buildWhen: (previous, current) {
          return current.getAgentByIdStatus != previous.getAgentByIdStatus;
        },
        builder: (context, state) {
          return state.getAgentByIdStatus.when(
            failure: (error, data) {
              return AppErrorWidget(message: error);
            },
            success: (data) {
              return AgentProfilePageBody(
                agent: state.getAgentByIdStatus.data,
                index: widget.tabIndex,
              );
            },
          );
        },
      ),
    );
  }
}
