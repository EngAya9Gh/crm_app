import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../model/agent_distributor_model.dart';
import '../../../../ui/widgets/custom_widget/custombutton.dart';
import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
    required this.agentDistributorModel,
  }) : super(key: key);

  final AgentDistributorModel? agentDistributorModel;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AgentsDistributorsActionsCubit>();
    return CustomButton(
      width: double.infinity,
      text: 'حفظ',
      onTap: () async {
        cubit.formKey.currentState!.save();
        if (cubit.formKey.currentState!.validate()) {
          cubit.actionAgentDistributor(
            agentId: agentDistributorModel?.idAgent,
            onSuccess: () => Navigator.pop(context),
          );
        } else {
          if (cubit.agentDistributorActionParams.type == null &&
              cubit.agentDistributorActionParams.name != null) {
            AppConstants.showSnakeBar(context, "من فضلك اختر النوع");
          } else {
            AppConstants.showSnakeBar(
                context, "من فضلك املئ جميع الحقول المطلوبة");
          }
        }
      },
    );
  }
}