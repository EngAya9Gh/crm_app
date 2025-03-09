import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/common/enums/users/user_type_enum.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/client_profile/support_tab/presentation/widgets/tech_support_users_dropdown.dart';
import '../../../../common/users_searchable_dropdown/presentation/pages/users_searchable_drop_down.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/care_activities_bloc.dart';

class FilterCareActivitiesSheet extends StatefulWidget {
  const FilterCareActivitiesSheet({
    Key? key,
  });

  @override
  State<FilterCareActivitiesSheet> createState() => _FilterCareActivitiesSheetState();
}

class _FilterCareActivitiesSheetState extends State<FilterCareActivitiesSheet> {
  late CareActivitiesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<CareActivitiesBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.symmetric(horizontal: 15.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child:  BlocBuilder<CareActivitiesBloc, CareActivitiesState>(
            buildWhen: (previous, current) =>
            previous.getAllCareActivitiesStatus != current.getAllCareActivitiesStatus,
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
                        _bloc.pageVariables.clear();
                        _bloc.add(const GetAllCareActivitiesEvent(page: 1));
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
                    compareFn:  (item, selectedItem) => item.index == selectedItem.index,
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
                    compareFn:  (item, selectedItem) => item.index == selectedItem.index,
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
                  UsersSearchableDropDown(
                    hint: "موظف العناية",
                    userType: UserTypeEnum.CareManagement,
                    selectedUserId: _bloc.pageVariables.fkUser.value,
                    onSelected: (user) {
                      _bloc.pageVariables.fkUser.value= user!.id;
                    },
                  ),
                  20.height,
                  SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      text: "فلترة",
                      onPressed: () {
                        _bloc.add( GetAllCareActivitiesEvent(page: 1,));
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
