import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentNameWidget extends StatelessWidget {
  const AgentNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
    return Column(
      children: [
        Row(
          children: [
            Text('الاسم', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('*', style: TextStyle(color: Colors.red)),
          ],
        ),
        SizedBox(height: 15),
        TextFormField(
          validator: (value) {
            if (value?.trim().isEmpty ?? true) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          },
          onChanged: (value) {
            print("value $value");
          },
          onSaved: (name) {
            if (name != null) {
              cubit.onSaveName(name);
            }
          },
          decoration: InputDecoration(hintText: ''),
          controller: cubit.nameController,
        ),
      ],
    );
  }
}
