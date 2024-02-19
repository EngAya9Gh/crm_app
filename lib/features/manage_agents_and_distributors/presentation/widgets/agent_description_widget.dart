import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentDescriptionWidget extends StatelessWidget {
  const AgentDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
    return Column(
      children: [
        Row(
          children: [
            Text('الوصف', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 15),
        TextFormField(
          controller: cubit.descriptionController,
          decoration: InputDecoration(hintText: '', hintMaxLines: 5),
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
