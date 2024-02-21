import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../ui/widgets/custom_widget/RowWidget.dart';
import '../../../domain/use_cases/get_agent_dates_list_usecase.dart';
import '../../manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';
import '../../widgets/agent_support_page/add_date_floating_button.dart';

class AgentSupportPage extends StatefulWidget {
  const AgentSupportPage({Key? key, required this.agentId}) : super(key: key);

  final String agentId;

  @override
  State<AgentSupportPage> createState() => _AgentSupportPageState();
}

class _AgentSupportPageState extends State<AgentSupportPage> {
  @override
  void initState() {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    bloc.add(GetAgentDatesListEvent(
        getAgentDatesListParams:
            GetAgentDatesListParams(agentId: widget.agentId)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    return Scaffold(
      floatingActionButton: AddDateFloatingButton(agentId: widget.agentId),
      body: BlocBuilder<AgentsDistributorsProfileBloc,
          AgentsDistributorsProfileState>(
        buildWhen: (previous, current) {
          return previous.dateVisitStatus != current.dateVisitStatus;
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                cardRow(
                  title: 'عدد الزيارات التي تمت',
                  value: bloc.finishedVisits.length.toString(),
                ),
                cardRow(
                  title: 'عدد الزيارات المتبقية',
                  value: bloc.unfinishedVisits.length.toString(),
                ),
                cardRow(
                  title: 'عدد الزيارات الملغية',
                  value: bloc.canceledVisits.length.toString(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
