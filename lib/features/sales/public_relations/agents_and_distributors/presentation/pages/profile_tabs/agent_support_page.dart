import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/features/support/dates_table/presentation/pages/dates_table_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../model/agent_distributor_model.dart';
import '../../../../../../../ui/widgets/custom_widget/card_row.dart';
import '../../../domain/use_cases/get_agent_dates_list_usecase.dart';
import '../../manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';
import '../../widgets/agent_support_page/add_date_button.dart';
import '../../widgets/agent_support_page/agent_support_training.dart';

class AgentSupportPage extends StatefulWidget {
  const AgentSupportPage({
    super.key,
    required this.agent,
  });

  final AgentDistributorModel agent;

  @override
  State<AgentSupportPage> createState() => _AgentSupportPageState();
}

class _AgentSupportPageState extends State<AgentSupportPage> {
  late final AgentsDistributorsProfileBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
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
                  onTap: () => AppNavigator.push(SupportTable()),
                  child: Column(
                    children: [
                      CardRow(
                        title: 'عدد الزيارات الكلي',
                        value: bloc.allVisitsList.length,
                      ),
                      CardRow(
                        title: 'عدد الزيارات التي تمت',
                        value: bloc.finishedVisits.length,
                      ),
                      CardRow(
                        title: 'عدد الزيارات المتبقية',
                        value: bloc.unfinishedVisits.length,
                      ),
                      CardRow(
                        title: 'عدد الزيارات الملغية',
                        value: bloc.canceledVisits.length,
                      ),
                      // next visit date
                      CardRow(
                        title: 'موعد الزيارة القادمة',
                        value: _nextVisitDate(),
                      ),
                    ],
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

  String? _nextVisitDate() {
    if (bloc.allVisitsList.isEmpty) return null;
    if (bloc.allVisitsList.first.dateClientVisit == null) return null;
    return DateFormat('yyyy-MM-dd | H:mm').format(
      bloc.allVisitsList.first.dateClientVisit!,
    );
  }
}
