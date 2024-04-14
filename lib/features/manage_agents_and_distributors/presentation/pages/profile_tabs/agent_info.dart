import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../model/agent_distributor_model.dart';
import '../../../../../ui/widgets/custom_widget/card_row.dart';

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
        bottom: 15,
        top: 20,
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 30,
              width: 30,
              //color: kMainColor,
              decoration: BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber(
                      agent.mobileAgent.toString());
                },
                icon: Icon(Icons.call),
                iconSize: 15,
                color: kWhiteColor,
              ),
            ),
            TextButton(
              onPressed: () async {
                await FlutterPhoneDirectCaller.callNumber(
                    agent.mobileAgent.toString());
              },
              child: Text(
                agent.mobileAgent.toString(),
                style: TextStyle(fontFamily: kfontfamily2, color: kMainColor),
              ),
            ),
          ],
        ),
        10.verticalSpace,
        CardRow(title: "الاسم", value: agent.nameAgent),
        CardRow(title: "البريد الالكتروني", value: agent.emailAgent),
        CardRow(title: "الوصف", value: agent.description),
        CardRow(title: "النوع", value: type),
        agent.nameCity != null
            ? CardRow(title: "المدينة", value: agent.nameCity.toString())
            : Container(),
        agent.nameUserAdd != null
            ? CardRow(
                title: "الموظف الذي أضاف", value: agent.nameUserAdd.toString())
            : Container(),
        agent.addDate != null
            ? CardRow(title: "تاريخ الاضافة", value: agent.addDate.toString())
            : Container(),
        agent.nameUserUpdate != null
            ? CardRow(
                title: "آخر من عدل", value: agent.nameUserUpdate.toString())
            : Container(),
        agent.updateDate != null
            ? CardRow(
                title: "تاريخ التعديل", value: agent.updateDate.toString())
            : Container(),
      ]),
    );
  }
}
