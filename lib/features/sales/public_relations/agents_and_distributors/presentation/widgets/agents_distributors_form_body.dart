import 'package:flutter/material.dart';

import '../../../../../../model/agent_distributor_model.dart';
import 'add_edit_agent/agent_Image_widget.dart';
import 'add_edit_agent/agent_description_widget.dart';
import 'add_edit_agent/agent_email_widget.dart';
import 'add_edit_agent/agent_enteprise_name_widget.dart';
import 'add_edit_agent/agent_location_widget.dart';
import 'add_edit_agent/agent_mobile_widget.dart';
import 'add_edit_agent/agent_name_widget.dart';
import 'add_edit_agent/agent_source_drop_down.dart';
import 'add_edit_agent/agent_types_widget.dart';
import 'add_edit_agent/agents_distributors_save_button.dart';
import 'add_edit_agent/logo_select_widget.dart';

class AgentsDistributorsFormBody extends StatelessWidget {
  const AgentsDistributorsFormBody({
    Key? key,
    required this.agentDistributorModel,
  }) : super(key: key);

  final AgentDistributorModel? agentDistributorModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        AgentNameWidget(),
        SizedBox(height: 20),
        AgentEnterpriseNameWidget(),
        SizedBox(height: 15),
        AgentSourceDropDown(),
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
