import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/common/widgets/text_row.dart';
import '../../../../../model/agent_distributor_model.dart';
import '../../../../../ui/widgets/custom_widget/RowWidget.dart';

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
        cardRow(title: "الاسم", value: agent.nameAgent),
        cardRow(title: "البريد الالكتروني", value: agent.emailAgent),
        cardRow(title: "الهاتف", value: agent.mobileAgent),
        cardRow(title: "الوصف", value: agent.description),
        cardRow(title: "النوع", value: type),
        agent.nameCity!=null?cardRow(title: "المدينة", value: agent.nameCity.toString()):Container(),
        agent.nameUserAdd!=null? cardRow(title: "الموظف الذي أضاف", value: agent.nameUserAdd.toString()):Container(),
        agent.updateDate!=null?cardRow(title: "تاريخ الاضافة", value: agent.updateDate.toString()):Container(),
        agent.nameUserUpdate!=null?cardRow(title: "آخر من عدل", value: agent.nameUserUpdate.toString()):Container(),
        agent.updateDate!=null?cardRow(title: "تاريخ التعديل", value: agent.updateDate.toString()):Container(),
      ]),
    );
  }
}
