import 'package:crm_smart/core/utils/extensions/email_validation_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentEmailWidget extends StatelessWidget {
  const AgentEmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
    return Column(
      children: [
        Row(
          children: [
            Text('البريد الالكتروني',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 15),
        TextFormField(
          controller: cubit.emailController,
          decoration: InputDecoration(hintText: 'example@gmail.com'),
          validator: (value) {
            if ((value?.trim().isNotEmpty ?? false) && !value!.validateEmail) {
              return 'من فضلك أدخل بريد الكتروني صحيح.';
            }
            return null;
          },
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
