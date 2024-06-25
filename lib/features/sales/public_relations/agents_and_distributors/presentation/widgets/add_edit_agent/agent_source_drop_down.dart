import 'package:crm_smart/core/common/enums/agents/agent_source_enum.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';

class AgentSourceDropDown extends StatelessWidget {
  const AgentSourceDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('مصدر الوكيل', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        CustomDropDown<AgentSourceEnum>(
          hint: 'مصدر الوكيل',
          items: AgentSourceEnum.values,
          itemAsString: (item) => item!.value,
          selectedItem: cubit.selectedAgentSource,
          onChanged: (value) {
            cubit.onSaveAgentSource(value);
          },
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
      ],
    );
  }
}
