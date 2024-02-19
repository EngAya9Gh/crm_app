import 'package:flutter/material.dart';

import '../../../../core/di/di_container.dart';
import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentDescriptionWidget extends StatelessWidget {
  const AgentDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = sl<AgentsDistributorsActionsCubit>();
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
