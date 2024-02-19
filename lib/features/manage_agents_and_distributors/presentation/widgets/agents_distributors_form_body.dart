import 'package:flutter/material.dart';

import '../../../../core/di/di_container.dart';
import '../../../../model/agent_distributor_model.dart';
import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';
import 'agent_Image_widget.dart';
import 'agent_description_widget.dart';
import 'agent_email_widget.dart';
import 'agent_location_widget.dart';
import 'agent_mobile_widget.dart';
import 'agent_name_widget.dart';
import 'agent_types_widget.dart';
import 'agents_distributors_save_button.dart';
import 'logo_select_widget.dart';

class AgentsDistributorsFormBody extends StatelessWidget {
  const AgentsDistributorsFormBody({
    Key? key,
    required this.agentDistributorModel,
  }) : super(key: key);

  final AgentDistributorModel? agentDistributorModel;

  @override
  Widget build(BuildContext context) {
    final cubit = sl<AgentsDistributorsActionsCubit>();
    return Column(
      children: [
        SizedBox(height: 15),
        AgentNameWidget(),
        SizedBox(height: 15),
        AgentTypesWidget(),
        SizedBox(height: 15),
        AgentLocationWidget(),
        SizedBox(height: 15),
        AgentMobileWidget(),
        SizedBox(height: 15),
        AgentEmailWidget(),
        SizedBox(height: 15),
        AgentDescriptionWidget(),
        SizedBox(height: 5),
        AgentImageWidget(agentDistributorModel: agentDistributorModel),
        LogoSelectWidget(),
        SizedBox(height: 15),
        SaveButton(agentDistributorModel: agentDistributorModel),
      ],
    );
  }
}
