import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../common/enums/enums.dart';
import '../../../../core/di/di_container.dart';
import '../../../../model/agent_distributor_model.dart';
import '../../../../view_model/maincity_vm.dart';
import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';
import 'agents_distributors_form_body.dart';

class AgentDistributorsActionsPageBody extends StatefulWidget {
  const AgentDistributorsActionsPageBody({
    Key? key,
    this.agentDistributorModel,
  }) : super(key: key);

  final AgentDistributorModel? agentDistributorModel;

  @override
  State<AgentDistributorsActionsPageBody> createState() =>
      _AgentDistributorsActionsPageBodyState();
}

class _AgentDistributorsActionsPageBodyState
    extends State<AgentDistributorsActionsPageBody> {
  AgentDistributorModel? get agentDistributorModel =>
      widget.agentDistributorModel;

  late final MainCityProvider regionProvider;

  @override
  void initState() {
    super.initState();
    final cubit = sl<AgentsDistributorsActionsCubit>();
    _loadCurrentAgentData();
    _loadLocation();

    if (agentDistributorModel != null) {
      cubit.onSelectADType(ADType.values.firstWhere((element) =>
          element.index == int.parse(agentDistributorModel!.typeAgent)));
    }
  }

  void _loadCurrentAgentData() {
    final cubit = sl<AgentsDistributorsActionsCubit>();
    if (agentDistributorModel == null) {
      cubit.resetAgentDistributorActionEntity();
    } else {
      cubit.nameController.text = agentDistributorModel!.nameAgent;
      cubit.emailController.text = agentDistributorModel!.emailAgent;
      cubit.phoneNumberController.text = agentDistributorModel!.mobileAgent;
      cubit.descriptionController.text = agentDistributorModel!.description;
      cubit.descriptionController.text = agentDistributorModel!.description;
    }
  }

  void _loadLocation() {
    regionProvider = context.read<MainCityProvider>();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = sl<AgentsDistributorsActionsCubit>();

    return BlocBuilder<AgentsDistributorsActionsCubit,
        AgentsDistributorsActionsState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AgentsDistributorsActionsLoading,
          child: Form(
            key: cubit.formKey,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 75, right: 15, left: 15, bottom: 25),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(),
                child: Scrollbar(
                  interactive: true,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: AgentsDistributorsFormBody(
                      agentDistributorModel: agentDistributorModel,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
