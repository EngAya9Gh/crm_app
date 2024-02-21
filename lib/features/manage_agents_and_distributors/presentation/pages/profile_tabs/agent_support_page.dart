import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di_container.dart';
import '../../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import '../../widgets/agent_support_page/add_date_floating_button.dart';

class AgentSupportPage extends StatelessWidget {
  const AgentSupportPage({Key? key, required this.agentId}) : super(key: key);

  final String agentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddDateFloatingButton(agentId: agentId),
      body: Column(
        children: [],
      ),
    );
  }
}
