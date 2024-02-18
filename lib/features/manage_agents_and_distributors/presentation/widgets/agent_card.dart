import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../model/agent_distributor_model.dart';
import '../../../../ui/screen/agents_and_distributors/agents_and_distributors_action.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({
    Key? key,
    required this.agentModel,
  }) : super(key: key);

  final AgentDistributorModel agentModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: InkWell(
          onTap: () => AppNavigator.push(
            AgentAndDistributorsAction(agentDistributorModel: agentModel),
          ),
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
}
