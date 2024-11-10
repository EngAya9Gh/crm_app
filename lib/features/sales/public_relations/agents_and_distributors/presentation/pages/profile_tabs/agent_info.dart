import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../ui/widgets/custom_widget/card_row.dart';
import '../../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../data/models/agent_distributor_model.dart';
import '../../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import 'agent_status_dialog.dart';

class AgentInfo extends StatefulWidget {
  const AgentInfo({
    Key? key,
    required this.agent,
  }) : super(key: key);

  final AgentDistributorModel agent;

  @override
  State<AgentInfo> createState() => _AgentInfoState();
}

class _AgentInfoState extends State<AgentInfo> {
  late final AgentsDistributorsCubit cubit;

  @override
  void initState() {
    cubit = context.read<AgentsDistributorsCubit>();
    cubit.currentAgent = widget.agent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentsDistributorsCubit, AgentsDistributorsState>(
      builder: (context, state) {
        final String type = ADType
            .values[int.tryParse(cubit.currentAgent?.typeAgent ?? '') ?? 0]
            .name;
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
                  height: 35.scaleIconsSize,
                  width: 35.scaleIconsSize,
                  //color: AppColors.kMainColor,
                  decoration: BoxDecoration(
                      color: AppColors.primaryMain,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: IconButton(
                    onPressed: () async {
                      await FlutterPhoneDirectCaller.callNumber(
                          cubit.currentAgent!.mobileAgent.toString());
                    },
                    icon: AppIcon(
                      Icons.call,
                      size: 15,
                    ),
                    color: AppColors.white,
                  ),
                ),
                AppTextButton(
                  text: cubit.currentAgent!.mobileAgent,
                  onPressed: () async {
                    await FlutterPhoneDirectCaller.callNumber(
                        cubit.currentAgent!.mobileAgent.toString());
                  },
                ),
              ],
            ),
            10.verticalSpace,
            CardRow(title: "الاسم", value: cubit.currentAgent!.nameAgent),
            CardRow(
                title: "حالة العميل",
                value: cubit.currentAgent!.lastState?.state),
            CardRow(
                title: "البريد الالكتروني",
                value: cubit.currentAgent!.emailAgent),
            CardRow(title: "الوصف", value: cubit.currentAgent!.description),
            CardRow(title: "النوع", value: type),
            CardRow(title: "المدينة", value: cubit.currentAgent!.nameCity),
            CardRow(
              title: "الموظف الذي أضاف",
              value: cubit.currentAgent!.nameUserAdd,
            ),
            CardRow(
              title: "تاريخ الاضافة",
              value: cubit.currentAgent!.addDate,
            ),
            cubit.currentAgent!.nameUserUpdate != null
                ? CardRow(
                    title: "آخر من عدل",
                    value: cubit.currentAgent!.nameUserUpdate)
                : Container(),
            CardRow(
                title: "تاريخ التعديل", value: cubit.currentAgent!.updateDate),
            CardRow(title: "المصدر", value: cubit.currentAgent!.source),
            Spacer(),
            AppElevatedButton(
              text: 'حالة الوكيل',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AgentStatusDialog(agentStateModel: cubit.currentAgent!.lastState,),
                );
              },
            ),
          ]),
        );
      },
    );
  }
}
