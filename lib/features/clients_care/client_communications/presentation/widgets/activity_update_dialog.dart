import 'dart:ui' as myui;

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../data/models/client_activity_model.dart';
import '../manager/clients_activities_bloc.dart';

class UpdateActivityDialog extends StatefulWidget {
  final ClientActivityModel activity;

  UpdateActivityDialog({
    super.key,
    required this.activity,
  });

  @override
  State<UpdateActivityDialog> createState() => _UpdateActivityDialogState();
}

class _UpdateActivityDialogState extends State<UpdateActivityDialog> {
  late final ClientsActivitiesBloc _bloc;

  void initState() {
    super.initState();
    _bloc = context.read<ClientsActivitiesBloc>();
    _bloc.updateActivityVariables.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: "تعديل النشاط",
      children:[
      BlocBuilder<ClientsActivitiesBloc, ClientsActivitiesState>(
        builder: (context, state) {
          return Directionality(
            textDirection: myui.TextDirection.rtl,
            child: Form(
              key: _bloc.updateActivityVariables.globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText('الوصف*'),
                  AppTextField(
                    hintText: "الوصف",
                    controller: _bloc.updateActivityVariables.descriptionController,
                    isRequired: true,
                    maxLines: 3,
                  ),
                  10.height,
                  CustomDateTimePicker(
                    dateTimeType: DateTimeEnum.both,
                    hintText: 'تاريخ النهاية',
                    dateTimeController: _bloc.updateActivityVariables.endDataController,
                    style2: true,
                  ),
                  // 10.height,
                  // CustomDropDown<ActivityStateEnum>(
                  //   hint: "الحالة",
                  //   items: ActivityStateEnum.values,
                  //   itemAsString: (item) => item!.name,
                  //   selectedItem: _bloc.updateActivityVariables.activityState.value==null?null:ActivityStateExtension.fromValue(_bloc.updateActivityVariables.activityState.value??""),
                  //   onChanged: (value) {
                  //     if (value == null) return;
                  //     _bloc.updateActivityVariables.activityState.value = value.enName;
                  //   },
                  //   validator: InputValidator.requiredFiled,
                  // ),
                  10.height,
                  Center(
                    child: BlocBuilder<ClientsActivitiesBloc, ClientsActivitiesState>(
                      buildWhen: (previous, current) {
                        return current.updateClientActivityStatus !=
                            previous.updateClientActivityStatus;
                      },
                      builder: (context, state) {
                        return AppElevatedButton(
                          isLoading: state.updateClientActivityStatus.isLoading(),
                          text: "حفظ",
                          onPressed: () async {
                            if (_bloc
                                .updateActivityVariables.globalKey.currentState!
                                .validate()) {
                              _bloc.add(UpdateActivityEvent(
                                  activityId: widget.activity.id,
                                  description:_bloc.updateActivityVariables.descriptionController.text ,
                                  endDate: _bloc.updateActivityVariables.endDataController.text,
                                  state: widget.activity.state,
                                onSuccess:()=> AppNavigator.pop()
                              ));
                              return;
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      ]
    );
  }

}
