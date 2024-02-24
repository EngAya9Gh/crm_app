import 'package:crm_smart/common/enums/enums.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../common/widgets/text_row.dart';
import '../../../../../model/agent_distributor_model.dart';

class AgentInfo extends StatelessWidget {
  const AgentInfo({
    Key? key,
    required this.agent,
  }) : super(key: key);

  final AgentDistributorModel agent;

  @override
  Widget build(BuildContext context) {
    final String type = ADType.values[int.tryParse(agent.typeAgent) ?? 0].name;
    return Column(children: [
      SizedBox(height: 15),
      TextRow(title: "الاسم", data: agent.nameAgent),
      TextRow(title: "البريد الالكتروني", data: agent.emailAgent),
      TextRow(title: "الهاتف", data: agent.mobileAgent),
      TextRow(title: "الوصف", data: agent.description),
      TextRow(title: "النوع", data: type),
      TextRow(title: "المدينة", data: agent.),
    ]);
  }
}
