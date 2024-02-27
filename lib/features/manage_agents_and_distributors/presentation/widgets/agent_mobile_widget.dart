import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentMobileWidget extends StatelessWidget {
  const AgentMobileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
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
          keyboardType: TextInputType.number,
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
