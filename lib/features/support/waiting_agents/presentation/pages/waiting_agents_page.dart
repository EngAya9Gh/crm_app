import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/presentation/widgets/app_text.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          'وكلاء في انتظار التدريب',
          style: context.textTheme.titleMedium,
        ),
      ),
      body: WaitingAgentsPageBody(),
    );
  }
}
