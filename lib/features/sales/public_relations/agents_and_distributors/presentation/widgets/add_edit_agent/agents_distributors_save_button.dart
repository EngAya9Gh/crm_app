import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../../../core/utils/app_navigator.dart';
import '../../../../../../../ui/widgets/custom_widget/custombutton.dart';
import '../../../data/models/agent_distributor_model.dart';
import '../../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';
import '../../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';

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
        final String? currentUser = AppConstants.currentUser(context)?.idUser;

        cubit.formKey.currentState!.save();
        if (cubit.formKey.currentState!.validate()) {
          final addedAgent = await cubit.actionAgentDistributor(
            agentId: agentDistributorModel?.idAgent,
            currentUser: currentUser,
          );
          if (addedAgent != null) {
            context.read<AgentsDistributorsCubit>().editAgent(addedAgent);
          }
          AppNavigator.pop();
        } else {
          if (cubit.agentDistributorActionModel.type == null &&
              cubit.agentDistributorActionModel.name != null) {
            AppConstants.showSnakeBar("من فضلك اختر النوع");
          } else {
            AppConstants.showSnakeBar("من فضلك املئ جميع الحقول المطلوبة");
          }
        }
      },
    );
  }
}
