import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../model/agent_distributor_model.dart';
import '../../../../../ui/screen/support/support_table.dart';
import '../../../../../ui/widgets/custom_widget/RowWidget.dart';
import '../../../domain/use_cases/get_agent_dates_list_usecase.dart';
import '../../manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';
import '../../widgets/agent_support_page/add_date_button.dart';
import '../../widgets/agent_support_page/agent_support_training.dart';

class AgentSupportPage extends StatefulWidget {
  const AgentSupportPage({
    Key? key,
    required this.agent,
  }) : super(key: key);

  final AgentDistributorModel agent;

  @override
  State<AgentSupportPage> createState() => _AgentSupportPageState();
}

class _AgentSupportPageState extends State<AgentSupportPage> {
  @override
  void initState() {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    bloc.add(GetAgentDatesListEvent(
        getAgentDatesListParams:
            GetAgentDatesListParams(agentId: widget.agent.idAgent)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    return Scaffold(
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
                SizedBox(height: 10),
                AddDateButton(agentId: widget.agent.idAgent),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => support_table()));
                  },
                  child: cardRow(
                    title: 'عدد الزيارات التي تمت',
                    value: bloc.finishedVisits.length.toString(),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => support_table()));
                  },
                  child: cardRow(
                    title: 'عدد الزيارات المتبقية',
                    value: bloc.unfinishedVisits.length.toString(),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => support_table()));
                  },
                  child: cardRow(
                    title: 'عدد الزيارات الملغية',
                    value: bloc.canceledVisits.length.toString(),
                  ),
                ),
                AgentSupportTraining(agent: widget.agent),
              ],
            ),
          );
        },
      ),
    );
  }
}
