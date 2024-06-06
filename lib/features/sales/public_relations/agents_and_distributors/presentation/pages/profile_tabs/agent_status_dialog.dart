import 'package:crm_smart/core/common/enums/agent_status_enum.dart';
import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgentStatusDialog extends StatefulWidget {
  const AgentStatusDialog({super.key});

  @override
  _AgentStatusDialogState createState() => _AgentStatusDialogState();
}

class _AgentStatusDialogState extends State<AgentStatusDialog> {
  AgentStatusEnum? agentStatus;
  TextEditingController dateTimeController = TextEditingController();

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
              items: AgentStatusEnum.values,
              selectedItem: agentStatus,
              itemAsString: (item) => item!.value,
              height: 105.h,
              onChanged: (value) {
                setState(() {
                  agentStatus = value;
                });
              },
            ),
            if (agentStatus == AgentStatusEnum.contract) ...[
              SizedBox(height: 10),
              CustomDateTimePicker(
                dateTimeType: DateTimeEnum.date,
                dateTimeController: dateTimeController,
                style2: true,
              ),
            ],
            if (agentStatus == AgentStatusEnum.excluded) ...[
              SizedBox(height: 10),
              TextFormField(
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
          ],
        ),
      ),
    );
  }
}
