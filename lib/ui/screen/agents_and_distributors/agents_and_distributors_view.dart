import 'dart:async';
import 'package:crm_smart/model/agent_distributor_model.dart';
import 'package:crm_smart/ui/screen/agents_and_distributors/agents_and_ditributors_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../core/config/theme/theme.dart';
import '../../../view_model/agent_dsitributor_vm.dart';
import '../../../view_model/page_state.dart';
import '../../../view_model/vm.dart';

class AgentsAndDistributorsView extends StatefulWidget {
  const AgentsAndDistributorsView({Key? key}) : super(key: key);

  @override
  State<AgentsAndDistributorsView> createState() =>
      _AgentsAndDistributorsViewState();
}

class _AgentsAndDistributorsViewState extends State<AgentsAndDistributorsView>
    with
        StateViewModelMixin<AgentsAndDistributorsView,
            AgentDistributorViewModel> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      getAgents();
    });
  }

  void getAgents() {
    viewmodel.getAgentsAndDistributors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الوكلاء والموزعين',
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: AppColors.white),
        onPressed: goToAgentsActionPage,
        backgroundColor: kMainColor,
      ),
      body: Selector<AgentDistributorViewModel,
          PageState<List<AgentDistributorModel>>>(
        selector: (_, vm) => vm.agentDistributorsState,
        builder: (_, agentDistributorsState, child) {
          if (agentDistributorsState.isLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (agentDistributorsState.isFailure) {
            return Center(
              child: IconButton(
                onPressed: getAgents,
                icon: Icon(Icons.refresh),
              ),
            );
          }

          final agentList = agentDistributorsState.data ?? [];

          return RefreshIndicator(
            onRefresh: () async => getAgents(),
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: agentList.length,
              itemBuilder: (BuildContext context, int index) => Builder(
                builder: (context) => agentCard(agentList[index]),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget agentCard(AgentDistributorModel agentModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: InkWell(
          onTap: () => goToAgentsActionPage(agentDistributorModel: agentModel),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 8.0,
                  color: Colors.black87.withOpacity(0.2),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Center(
                    child: Text(
                      agentModel.nameAgent,
                      style: TextStyle(fontSize: 14, fontFamily: kfontfamily2),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<T?> goToAgentsActionPage<T>(
      {AgentDistributorModel? agentDistributorModel}) {
    return Navigator.of(context).push<T>(CupertinoPageRoute(
      builder: (context) => AgentAndDistributorsAction(
          agentDistributorModel: agentDistributorModel),
    ));
  }
}


