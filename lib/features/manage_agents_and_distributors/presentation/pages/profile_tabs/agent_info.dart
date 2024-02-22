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
    return Column(children: [
      SizedBox(height: 15),
      TextRow(title: "الاسم", data: agent.nameAgent),
      TextRow(title: "البريد الالكتروني", data: agent.emailAgent),
      TextRow(title: "الهاتف", data: agent.mobileAgent),
      TextRow(title: "الوصف", data: agent.description),
      TextRow(title: "النوع", data: agent.typeAgent),
    ]);
  }
}
