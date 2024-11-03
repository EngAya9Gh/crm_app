import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/client_profile/support_tab/presentation/widgets/tech_support_users_dropdown.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/clients_activities_bloc.dart';

class FilterClientsActivitiesSheet extends StatefulWidget {
  const FilterClientsActivitiesSheet({
    Key? key,
  });

  @override
  State<FilterClientsActivitiesSheet> createState() => _FilterClientsActivitiesSheetState();
}

class _FilterClientsActivitiesSheetState extends State<FilterClientsActivitiesSheet> {
  late ClientsActivitiesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ClientsActivitiesBloc>();
    _bloc.pageVariables.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.symmetric(horizontal: 15.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child:  BlocBuilder<ClientsActivitiesBloc, ClientsActivitiesState>(
            buildWhen: (previous, current) =>
            previous.getAllClientsActivitiesStatus != current.getAllClientsActivitiesStatus,
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.height,
                  Align(
                    alignment: Alignment.centerLeft,
                    child:  AppTextButton(
                      onPressed:  () {
                        _bloc.add(const GetAllClientsActivitiesEvent(page: 1));
                        AppNavigator.pop();

                      },
                      text: "إعادة الافتراضي",
                      appButtonStyle: AppButtonStyle.secondary,
                    ),
                  ),
                  10.height,
                  CustomDropDown<ActivityStateEnum>(
                    hint: "الحالة",
                    items: ActivityStateEnum.values,
                    itemAsString: (item) => item!.name,
                    selectedItem: _bloc.pageVariables.activityState.value==null?null:ActivityStateExtension.fromValue(_bloc.pageVariables.activityState.value??""),
                    onChanged: (value) {
                      if (value == null) return;
                      _bloc.pageVariables.activityState.value = value.enName;
                    },
                    validator: InputValidator.requiredFiled,
                  ),
                  10.height,
                  CustomDropDown<ActivityPriorityEnum>(
                    hint: "الاولوية",
                    items: ActivityPriorityEnum.values,
                    itemAsString: (item) => item!.name,
                    selectedItem:_bloc.pageVariables.priority.value==null?null: ActivityPriorityExtension.fromValue(_bloc.pageVariables.priority.value??""),
                    onChanged: (value) {
                      if (value == null) return;
                      _bloc.pageVariables.priority.value = value.enName;
                    },
                    validator: InputValidator.requiredFiled,
                  ),
                  10.height,
                  Row(
                    children: [
                      Flexible(
                        child: CustomDateTimePicker(
                          dateTimeType: DateTimeEnum.date,
                          hintText: 'تاريخ البداية',
                          dateTimeController: _bloc
                              .pageVariables.startDataController,
                          style2: true,
                        ),
                      ),
                      10.width,
                      Flexible(
                        child: CustomDateTimePicker(
                          dateTimeType: DateTimeEnum.date,
                          hintText: 'تاريخ النهاية',
                          dateTimeController: _bloc
                              .pageVariables.endDataController,
                          style2: true,
                        ),
                      ),
                    ],
                  ),
                  10.height,
                  AppText('اسناد الي*'),
                  5.height,
                  TechSupportUsersDropDown(
                    onSelectUser: (user) {
                      _bloc.pageVariables.fkUser.value= user.id;
                    },
                  ),
                  20.height,
                  SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      text: "فلترة",
                      onPressed: () {
                        _bloc.add( GetAllClientsActivitiesEvent(page: 1,));
                        AppNavigator.pop();

                      },
                    ),
                  ),
                  20.height,
                ],
              );
            }),
      ),
    );
  }

}
