import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../../core/common/widgets/custom_tab_bar.dart';
import '../../data/models/agent_distributor_model.dart';
import '../../domain/use_cases/get_agent_client_list_usecase.dart';
import '../../domain/use_cases/get_agent_comments_list_usecase.dart';
import '../../domain/use_cases/get_agent_invoice_list_usecase.dart';
import '../manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';
import '../pages/profile_tabs/agent_client_list_page.dart';
import '../pages/profile_tabs/agent_comment_list_page.dart';
import '../pages/profile_tabs/agent_info.dart';
import '../pages/profile_tabs/agent_invoice_list_page.dart';
import '../pages/profile_tabs/agent_support_page.dart';

class AgentProfilePageBody extends StatefulWidget {
  final AgentDistributorModel agent;
  final int? index;

  const AgentProfilePageBody({
    super.key,
    required this.agent,
    this.index,
  });

  @override
  State<AgentProfilePageBody> createState() => _AgentProfilePageBodyState();
}

class _AgentProfilePageBodyState extends State<AgentProfilePageBody>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(
    length: _tabBarTabsText.length,
    initialIndex: 0,
    vsync: this,
  );

  List<String> _tabBarTabsText = [
    'البيانات',
    'العملاء',
    'الفواتير',
    'التعليقات',
    'الدعم',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
      bloc
        ..add(GetAgentClientListEvent(
          query: '',
          getAgentClientListParams:
              GetAgentClientListParams(agentId: widget.agent.idAgent),
        ))
        ..add(GetAgentInvoiceListEvent(
          query: '',
          getAgentInvoiceListParams:
              GetAgentInvoiceListParams(agentId: widget.agent.idAgent),
        ))
        ..add(GetAgentCommentListEvent(
            getAgentCommentListParams: GetAgentCommentListParams(
          agentId: widget.agent.idAgent,
        )));
    });
    _navigateToIndexIfExists();
  }

  void _navigateToIndexIfExists() {
    if (widget.index != null) {
      _tabController.animateTo(widget.index!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: widget.agent.nameAgent,
        bottom: CustomTabBar(
          tabController: _tabController,
          tabBarTabsText: _tabBarTabsText,
        ),
      ),resizeToAvoidBottomInset: false,
      body: BlocBuilder<AgentsDistributorsProfileBloc,
          AgentsDistributorsProfileState>(
        builder: (context, state) {
          return TabBarView(
            controller: _tabController,
            children: [
              AgentInfo(agent: widget.agent),
              AgentClientListPage(agentId: widget.agent.idAgent),
              AgentInvoiceListPage(participateId: widget.agent.idAgent),
              AgentCommentListPage(agentId: widget.agent.idAgent),
              AgentSupportPage(agent: widget.agent),
            ],
          );
        },
      ),
    );
  }
}
