import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../../core/utils/app_constants.dart';
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
    return SizedBox(
      width: double.infinity,
      child: AppElevatedButton(
        text: 'حفظ',
        width: double.infinity,
        onPressed: () async {
          final String? currentUser = AppConstants.currentUser.idUser;

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
              AppSnackbar.showSnakeBar(
                "من فضلك اختر النوع",
                color: ToastColorsEnum.warning,
              );
            } else {
              AppSnackbar.showSnakeBar(
                "من فضلك املئ جميع الحقول المطلوبة",
                color: ToastColorsEnum.warning,
              );
            }
          }
        },
      ),
    );
  }
}
