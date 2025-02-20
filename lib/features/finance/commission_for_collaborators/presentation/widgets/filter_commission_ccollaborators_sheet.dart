import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/selected_sections_handler.dart';
import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/common/enums/users/user_type_enum.dart';
import '../../../../../core/common/models/participate_model.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/users_searchable_dropdown/presentation/pages/users_searchable_drop_down.dart';
import '../../../../sales/clients/clients_list/presentation/manager/clients_list_bloc.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../../domain/use_cases/get_commission_collaborators_usecase.dart';
import '../management/commission_collaborators_bloc.dart';
import 'package:collection/collection.dart';

class FilterCommissionCollaboratorsSheet extends StatefulWidget {
  const FilterCommissionCollaboratorsSheet({
    Key? key,
    required this.params,
    required this.bloc,
    required this.userBloc,
  });

  final CommissionCollaboratorsParams params;
  final CommissionCollaboratorsBloc bloc;
  final ClientsListBloc userBloc;

  @override
  State<FilterCommissionCollaboratorsSheet> createState() => _FilterCommissionCollaboratorsSheetState();
}

class _FilterCommissionCollaboratorsSheetState extends State<FilterCommissionCollaboratorsSheet> {
  // late CareActivitiesBloc _bloc;
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final ValueNotifier<String?> selectedParticipateId = ValueNotifier(null);
  final ValueNotifier<String?> selectedUserId = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    selectedUserId.value = widget.params.fk_idUser;
    selectedParticipateId.value = widget.params.participate_fk;
    fromDateController.text = widget.params.from ?? '';
    fromDateController.text = widget.params.to ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.symmetric(horizontal: 15.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.height,
            Align(
              alignment: Alignment.centerLeft,
              child: AppTextButton(
                onPressed: () {
                  var params = CommissionCollaboratorsParams(
                    page: 1,
                    filter: widget.params.filter,
                  );
                  widget.bloc.add(GetCommissionCollaboratorsEvent(params: params));
                  AppNavigator.pop(result: params);

                },
                text: "إعادة الافتراضي",
                appButtonStyle: AppButtonStyle.secondary,
              ),
            ),
            10.height,
            BlocBuilder<CommissionCollaboratorsBloc, CommissionCollaboratorsState>(
              builder: (context, state) {
                return state.listParticipate.when(
                  success: (data) => CustomDropDown<ParticipateModel>(
                    hint: "المتعاونين",
                    items: List.of(data ?? []),
                    itemAsString: (item) => item!.name_participate,
                    selectedItem: state.listParticipate.data?.firstWhereOrNull((e) => e.id_participate == selectedParticipateId.value),
                    onChanged: (value) {
                      if (value == null) return;
                      selectedParticipateId.value = value.id_participate;
                    },
                    // filterFn: (participate, filter) => participate.name_participate == filter,
                  ),
                  failure: (error, data) => SizedBox.shrink(),
                );
              },
            ),
            10.height,
            BlocBuilder<ClientsListBloc, ClientsListState>(
              builder: (context, state) {
                return state.usersSales.when(
                  success: (data) => CustomDropDown<UserModel>(
                    hint: "الموظفين",
                    items: data ?? [],
                    itemAsString: (item) => item!.nameUser!,
                    selectedItem: (state.usersSales.data as List<UserModel>?)?.firstWhereOrNull((e) => e.id == selectedUserId.value),
                    onChanged: (value) {
                      if (value == null) return;
                      selectedUserId.value = value.id;
                    },
                    // filterFn: (user, filter) => user.nameUser == filter,
                    // compareFn: (item, selectedItem) => item.id == selectedItem.id,
                  ),
                  failure: (error, data) => SizedBox.shrink(),
                );
              },
            ),
            10.height,
            Row(
              children: [
                Flexible(
                  child: CustomDateTimePicker(
                    dateTimeType: DateTimeEnum.date,
                    hintText: 'تاريخ البداية',
                    dateTimeController: fromDateController,
                    style2: true,
                  ),
                ),
                10.width,
                Flexible(
                  child: CustomDateTimePicker(
                    dateTimeType: DateTimeEnum.date,
                    hintText: 'تاريخ النهاية',
                    dateTimeController: toDateController,
                    style2: true,
                  ),
                ),
              ],
            ),
            20.height,
            SizedBox(
              width: double.infinity,
              child: AppElevatedButton(
                text: "فلترة",
                onPressed: () {
                  var params = CommissionCollaboratorsParams(
                    page: 1,
                    filter: widget.params.filter,
                    from: fromDateController.text,
                    to: toDateController.text,
                    fk_idUser: selectedUserId.value,
                    participate_fk: selectedParticipateId.value,
                  );
                  widget.bloc.add(GetCommissionCollaboratorsEvent(params: params));
                  AppNavigator.pop(result: params);
                },
              ),
            ),
            20.height,
          ],
        ),
      ),
    );
  }
}
