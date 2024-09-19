import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../../../app/presentation/widgets/app_text.dart';
import '../../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentMobileWidget extends StatelessWidget {
  const AgentMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText('رقم الموبايل'),
        SizedBox(height: 15),
        AppTextField(
          controller: cubit.agentFormEntity.phoneNumberController,
          inputType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
          ],
          onSaved: (phone) {
            if (phone != null) {
              cubit.onSavePhoneNumber(phone);
            }
          },
        ),
      ],
    );
  }
}
