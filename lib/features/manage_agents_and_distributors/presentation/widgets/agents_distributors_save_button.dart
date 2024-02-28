import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../model/agent_distributor_model.dart';
import '../../../../ui/widgets/custom_widget/custombutton.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
    required this.agentDistributorModel,
  }) : super(key: key);

  final AgentDistributorModel? agentDistributorModel;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
    return CustomButton(
      width: double.infinity,
      text: 'حفظ',
      onTap: () async {
        final currentUser = context.read<UserProvider>().currentUser.idUser;

        cubit.formKey.currentState!.save();
        if (cubit.formKey.currentState!.validate()) {
          await cubit.actionAgentDistributor(
              agentId: agentDistributorModel?.idAgent, currenuser: currentUser);
          AppNavigator.pop();
        } else {
          if (cubit.agentDistributorActionModel.type == null &&
              cubit.agentDistributorActionModel.name != null) {
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
