import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../../../app/presentation/widgets/app_text.dart';
import '../../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentEmailWidget extends StatelessWidget {
  const AgentEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText('البريد الالكتروني'),
        SizedBox(height: 15),
        AppTextField(
          controller: cubit.agentFormEntity.emailController,
          validator: InputValidator.validateEmail,
          onSaved: (email) {
            if (email != null) {
              cubit.onSaveEmail(email);
            }
          },
        ),
      ],
    );
  }
}
