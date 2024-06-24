import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentEnterpriseNameWidget extends StatelessWidget {
  const AgentEnterpriseNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('اسم الشركة', style: TextStyle(fontWeight: FontWeight.bold)),
        TextFormField(
          onChanged: (value) {
            debugPrint("value $value");
          },
          onSaved: (name) {
            if (name != null) {
              cubit.onSaveEnterpriseName(name);
            }
          },
          decoration: InputDecoration(hintText: ''),
          controller: cubit.nameAgentEnterpriseController,
        ),
      ],
    );
  }
}
