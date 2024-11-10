import 'dart:ui' as myui;

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../data/models/client_activity_model.dart';
import '../manager/care_activities_bloc.dart';

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
  late final CareActivitiesBloc _bloc;

  void initState() {
    super.initState();
    _bloc = context.read<CareActivitiesBloc>();
    _bloc.updateActivityVariables.clear();
    _bloc.updateActivityVariables.descriptionController.text = widget.activity.description??"";
    _bloc.updateActivityVariables.endDataController.text = widget.activity.endDate==null?"": DateFormat('yyyy-MM-dd HH:mm aa').format( widget.activity.endDate!);
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: "تعديل النشاط",
      children:[
      BlocBuilder<CareActivitiesBloc, CareActivitiesState>(
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
                    enabled: !(widget.activity.state == "completed" && widget.activity.type=="care call" && widget.activity.name=="ترحيب"),
                    isRequired: true,
                    maxLines: 3,
                  ),
                  10.height,
                  CustomDateTimePicker(
                    dateTimeType: DateTimeEnum.both,
                    hintText: 'تاريخ النهاية',
                    enabled: !(widget.activity.state == "completed" && widget.activity.type=="care call"  && widget.activity.name=="ترحيب"),
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
                    child: BlocBuilder<CareActivitiesBloc, CareActivitiesState>(
                      buildWhen: (previous, current) {
                        return current.updateClientActivityStatus !=
                            previous.updateClientActivityStatus;
                      },
                      builder: (context, state) {
                        return AppElevatedButton(
                          isLoading: state.updateClientActivityStatus.isLoading(),
                          text: "حفظ",
                          onPressed: (widget.activity.state == "completed" && widget.activity.type=="care call" && widget.activity.name=="ترحيب")?null:() async {
                            if (_bloc
                                .updateActivityVariables.globalKey.currentState!
                                .validate()) {
                              print(_bloc.updateActivityVariables.endDataController.text);
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
