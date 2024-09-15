import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentDescriptionWidget extends StatelessWidget {
  const AgentDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText('الوصف'),
        SizedBox(height: 15),
        AppTextField(
          controller: cubit.agentFormEntity.descriptionController,
          onSaved: (description) {
            if (description != null) {
              cubit.onSaveDescription(description);
            }
          },
        ),
      ],
    );
  }
}
