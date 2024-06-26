import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        centerTitle: true,
        title: Text(
          'وكلاء في انتظار التدريب',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: WaitingAgentsPageBody(),
    );
  }
}
