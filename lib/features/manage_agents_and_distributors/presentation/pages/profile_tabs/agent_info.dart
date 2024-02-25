import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/common/widgets/text_row.dart';
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
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
        left: 10,
        bottom: 10,
        top: 15,
      ),
      child: Column(children: [
        TextRow(title: "الاسم", data: agent.nameAgent),
        TextRow(title: "البريد الالكتروني", data: agent.emailAgent),
        TextRow(title: "الهاتف", data: agent.mobileAgent),
        TextRow(title: "الوصف", data: agent.description),
        TextRow(title: "النوع", data: type),
        TextRow(title: "المدينة", data: agent.nameCity),
        TextRow(title: "الموظف الذي أضاف", data: agent.nameUserAdd),
        TextRow(title: "تاريخ الاضافة", data: agent.updateDate),
        TextRow(title: "آخر من عدل", data: agent.nameUserUpdate),
        TextRow(title: "تاريخ التعديل", data: agent.updateDate),
      ]),
    );
  }
}
