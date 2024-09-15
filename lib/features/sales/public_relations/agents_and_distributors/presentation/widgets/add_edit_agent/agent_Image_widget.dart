import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../../app/presentation/widgets/app_text.dart';
import '../../../data/models/agent_distributor_model.dart';

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
        AppText('صورة '),
        if (agentDistributorModel?.imageAgent != null &&
            agentDistributorModel!.imageAgent.toString().isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 40.scaleIconsSize,
              width: 50.scaleIconsSize,
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
