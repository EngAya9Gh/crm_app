import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../manager/waiting_agents/waiting_agents_cubit.dart';
import '../widgets/waiting_agents_page_body.dart';

class WaitingAgentsPage extends StatefulWidget {
  const WaitingAgentsPage({super.key});

  @override
  State<WaitingAgentsPage> createState() => _WaitingAgentsPageState();
}

class _WaitingAgentsPageState extends State<WaitingAgentsPage> {
  @override
  void initState() {
    context.read<WaitingAgentsCubit>().getWaitingAgents();
    super.initState();
  }

  @override
  void deactivate() {
    context.read<WaitingAgentsCubit>().changeFilter();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'وكلاء في انتظار التدريب'),
      body: WaitingAgentsPageBody(),
    );
  }
}
