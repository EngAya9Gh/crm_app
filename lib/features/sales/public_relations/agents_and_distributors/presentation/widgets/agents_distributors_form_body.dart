import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/enums/agents/agent_source_enum.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/models/file_model.dart';
import '../../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/utils/app_file_handler.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/agent_distributor_model.dart';
import '../manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';
import 'add_edit_agent/agent_Image_widget.dart';
import 'add_edit_agent/agent_description_widget.dart';
import 'add_edit_agent/agent_email_widget.dart';
import 'add_edit_agent/agent_location_widget.dart';
import 'add_edit_agent/agent_mobile_widget.dart';
import 'add_edit_agent/agent_types_widget.dart';
import 'add_edit_agent/agents_distributors_save_button.dart';

class AgentsDistributorsFormBody extends StatefulWidget {
  const AgentsDistributorsFormBody({
    super.key,
    required this.agentDistributorModel,
  });

  final AgentDistributorModel? agentDistributorModel;

  @override
  State<AgentsDistributorsFormBody> createState() =>
      _AgentsDistributorsFormBodyState();
}

class _AgentsDistributorsFormBodyState
    extends State<AgentsDistributorsFormBody> {
  late final AgentsDistributorsActionsCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<AgentsDistributorsActionsCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText('الاسم*'),
        AppTextField(
          hintText: 'الاسم',
          controller: _cubit.agentFormEntity.nameController,
          validator: InputValidator.requiredFiled,
          onSaved: (name) {
            if (name != null) {
              _cubit.onSaveName(name);
            }
          },
        ),
        10.height,
        AppText('اسم الشركة*'),
        AppTextField(
          hintText: 'اسم الشركة',
          controller: _cubit.agentFormEntity.nameAgentEnterpriseController,
          validator: InputValidator.requiredFiled,
          onSaved: (name) {
            if (name != null) {
              _cubit.onSaveEnterpriseName(name);
            }
          },
        ),
        10.height,
        AppText('مصدر الوكيل'),
        CustomDropDown<AgentSourceEnum>(
          hint: 'مصدر الوكيل',
          items: AgentSourceEnum.values,
          itemAsString: (item) => item!.value,
          compareFn:  (item, selectedItem) => item.index == selectedItem.index,
          selectedItem:
              _cubit.agentFormEntity.selectedAgentSourceNotifier.value,
          onChanged: (value) {
            _cubit.onSaveAgentSource(value);
          },
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        10.height,
        AgentTypesWidget(),
        SizedBox(height: 15),
        AgentLocationWidget(cityId: widget.agentDistributorModel?.cityId),
        SizedBox(height: 15),
        AgentMobileWidget(),
        SizedBox(height: 15),
        AgentEmailWidget(),
        SizedBox(height: 15),
        AgentDescriptionWidget(),
        SizedBox(height: 5),
        AgentImageWidget(agentDistributorModel: widget.agentDistributorModel),
        AppTextField(
          controller: _cubit.agentFormEntity.logoController,
          onTap: () async {
            final FileModel? pickedImage = await AppFileHandler.pickSingle(
              type: FileType.image,
            );
            _cubit.logoFile = pickedImage?.file;
            _cubit.agentFormEntity.logoController.text =
                pickedImage?.path ?? "";
            _cubit.onSaveImageFile();
          },
          readOnly: true,
        ),
        SizedBox(height: 15),
        SaveButton(agentDistributorModel: widget.agentDistributorModel),
      ],
    );
  }
}
