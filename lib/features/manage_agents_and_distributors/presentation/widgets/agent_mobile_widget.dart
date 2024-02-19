import 'package:flutter/material.dart';

import '../../../../core/di/di_container.dart';
import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentMobileWidget extends StatelessWidget {
  const AgentMobileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = sl<AgentsDistributorsActionsCubit>();
    return Column(
      children: [
        Row(
          children: [
            Text('رقم الموبايل', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 15),
        TextFormField(
          controller: cubit.phoneNumberController,
          decoration: InputDecoration(hintText: ''),
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
