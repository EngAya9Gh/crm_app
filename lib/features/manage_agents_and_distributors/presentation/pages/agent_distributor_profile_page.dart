import 'package:crm_smart/features/manage_agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';
import 'package:crm_smart/model/agent_distributor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../../core/di/di_container.dart';
import '../../domain/use_cases/get_agent_client_list_usecase.dart';
import 'profile_tabs/agent_client_list_page.dart';
import 'profile_tabs/agent_info.dart';

class AgentProfilePage extends StatelessWidget {
  const AgentProfilePage({
    Key? key,
    required this.agent,
  }) : super(key: key);
  final AgentDistributorModel agent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AgentsDistributorsProfileBloc>(),
      child: AgentProfilePageBody(agent: agent),
    );
  }
}

class AgentProfilePageBody extends StatefulWidget {
  final AgentDistributorModel agent;

  const AgentProfilePageBody({
    Key? key,
    required this.agent,
  }) : super(key: key);

  @override
  State<AgentProfilePageBody> createState() => _AgentProfilePageBodyState();
}

class _AgentProfilePageBodyState extends State<AgentProfilePageBody>
    with TickerProviderStateMixin {
  late TabController _tabController =
      TabController(length: _tabBarTabs.length, initialIndex: 0, vsync: this);

  List<Widget> _tabBarTabs = [
    Tab(text: 'البيانات'),
    Tab(text: 'العملاء'),
    Tab(text: 'الفواتير'),
    Tab(text: 'التعليقات'),
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
        ));
      //     _agentListBloc.add(GetAgentInvoiceListEvent(
      //         query: '',
      //         getAgentInvoiceListParams:
      //             GetAgentInvoiceListParams(idAgent: widget.agentId)));
      //     _agentListBloc.add(GetAgentCommentListEvent(
      //         getAgentCommentListParams:
      //             GetAgentCommentListParams(idAgent: widget.agentId)));
    });
    //   _tabController = TabController(
    //       length: TabEvent.values.length, vsync: this, initialIndex: 0);
    //   // _tabController.addListener(onChangeTab);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            // height: appBarSize.height,
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: TextScroll(
                    widget.agent.nameAgent,
                    mode: TextScrollMode.endless,
                    velocity: Velocity(pixelsPerSecond: Offset(60, 0)),
                    delayBefore: Duration(milliseconds: 2000),
                    pauseBetween: Duration(milliseconds: 1000),
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  )),
            ),
          );
        }),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          labelPadding: const EdgeInsets.symmetric(horizontal: 6),
          indicatorWeight: 4,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          physics: AlwaysScrollableScrollPhysics(),
          // onTap: (index) {
          //   context
          //       .read<AgentListBloc>()
          //       .add(SwitchProfileTabs(TabEvent.values[index]));
          // },
          tabs: _tabBarTabs,
        ),
      ),
      body: BlocBuilder<AgentsDistributorsProfileBloc,
          AgentsDistributorsProfileState>(
        builder: (context, state) {
          return TabBarView(
            controller: _tabController,
            children: [
              AgentInfo(agent: widget.agent),
              AgentClientListPage(agentId: widget.agent.idAgent),
              AgentInfo(agent: widget.agent),
              AgentInfo(agent: widget.agent),
              // AgentInvoiceListPage(
              //     agentId: state.currentPaticipate != null
              //         ? state.currentPaticipate!.id_agent!
              //         : ''),
              // AgentCommentListPage(
              //     agentId: state.currentPaticipate != null
              //         ? state.currentPaticipate!.id_agent!
              //         : ''),
            ],
          );
        },
      ),
    );
  }
}