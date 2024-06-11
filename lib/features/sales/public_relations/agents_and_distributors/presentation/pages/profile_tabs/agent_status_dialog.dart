import 'package:crm_smart/core/common/enums/agent_status_enum.dart';
import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:crm_smart/model/agent_state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgentStatusDialog extends StatefulWidget {
  const AgentStatusDialog({
    super.key,
    this.agentStateModel,
  });

  final AgentStateModel? agentStateModel;

  @override
  _AgentStatusDialogState createState() => _AgentStatusDialogState();
}

class _AgentStatusDialogState extends State<AgentStatusDialog> {
  late final AgentsDistributorsCubit cubit;
  AgentStateEnum? selectedAgentState;
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  @override
  void initState() {
    cubit = context.read<AgentsDistributorsCubit>();
    selectedAgentState =
        AgentStateEnum.fromString(widget.agentStateModel?.state);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: Text('حالة الوكيل'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomDropDown(
              hint: 'حالة الوكيل',
              items: AgentStateEnum.values,
              selectedItem: selectedAgentState,
              itemAsString: (item) => item!.value,
              height: 105.h,
              onChanged: (value) {
                setState(() {
                  selectedAgentState = value;
                });
              },
            ),
            if (selectedAgentState == AgentStateEnum.contract) ...[
              SizedBox(height: 10),
              CustomDateTimePicker(
                dateTimeType: DateTimeEnum.date,
                dateTimeController: dateTimeController,
                style2: true,
              ),
            ],
            if (selectedAgentState == AgentStateEnum.excluded) ...[
              SizedBox(height: 10),
              TextFormField(
                controller: reasonController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'سبب الاستبعاد *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: InputValidator.requiredFiled,
              ),
            ],
            SizedBox(height: 15),
            BlocBuilder<AgentsDistributorsCubit, AgentsDistributorsState>(
              builder: (context, state) {
                return AppElevatedButton(
                  isLoading: state.changeStateAgent.isLoading(),
                  onPressed: () async {
                    await cubit.changeStateAgent(
                        changeStateAgentParams: ChangeStateAgentParams(
                      agentId: cubit.currentAgent!.idAgent,
                      state: selectedAgentState!.value,
                      reasonState: reasonController.text.isEmpty
                          ? null
                          : reasonController.text,
                      date: dateTimeController.text.isEmpty
                          ? null
                          : dateTimeController.text,
                    ));
                    AppNavigator.pop();
                  },
                  text: 'حفظ',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
