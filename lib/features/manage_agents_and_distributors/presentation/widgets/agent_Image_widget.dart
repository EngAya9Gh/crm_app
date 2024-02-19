import 'package:flutter/material.dart';

import '../../../../model/agent_distributor_model.dart';

class AgentImageWidget extends StatelessWidget {
  const AgentImageWidget({
    Key? key,
    this.agentDistributorModel,
  }) : super(key: key);

  final AgentDistributorModel? agentDistributorModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('صورة ', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        if (agentDistributorModel?.imageAgent != null &&
            agentDistributorModel!.imageAgent.toString().isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 40,
              width: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(agentDistributorModel!.imageAgent.toString()),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
