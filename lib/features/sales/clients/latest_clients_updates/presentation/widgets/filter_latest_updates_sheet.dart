import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/enums/client/type_client_enum.dart';
import '../../../../../../core/common/enums/comments/no_comments_enum.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../ui/screen/report/is_marketing_chekbox.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../../common/branches/presentation/pages/branch_searchable_drop_down.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../../public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/latest_clients_updates_cubit.dart';
import 'markiting_users_list.dart';

class FilterLatestUpdatesSheet extends StatefulWidget {
  const FilterLatestUpdatesSheet({super.key});

  @override
  State<FilterLatestUpdatesSheet> createState() =>
      _FilterLatestUpdatesSheetState();
}

class _FilterLatestUpdatesSheetState extends State<FilterLatestUpdatesSheet> {
  late final LatestClientsUpdatesCubit _latestUpdatesCubit;

  @override
  void initState() {
    _latestUpdatesCubit = context.read<LatestClientsUpdatesCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ListenableBuilder(
                listenable: Listenable.merge(
                  _latestUpdatesCubit.filterEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _latestUpdatesCubit.filterEntity
                            .checkIfFilterIsNotEmpty()
                        ? () {
                            _latestUpdatesCubit.filterEntity.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            IsMarketingCheckbox(
              isMarketingNotifier:
                  _latestUpdatesCubit.filterEntity.isMarketingNotifier,
              onChange: (value) {
                _latestUpdatesCubit.filterEntity.isMarketingNotifier.value =
                    value;
              },
            ),
            20.height,
            Align(
              alignment: Alignment.centerRight,
              child: AppText("عمر التفاوض"),
            ),
            2.height,
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    hintText: "من",
                    controller:
                        _latestUpdatesCubit.filterEntity.ageFromController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                8.width,
                Expanded(
                  child: AppTextField(
                    hintText: "إلى",
                    controller:
                        _latestUpdatesCubit.filterEntity.ageToController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
            10.height,
            Row(
              children: [
                Flexible(
                  child: CustomDateTimePicker(
                    dateTimeController:
                        _latestUpdatesCubit.filterEntity.dateFromController,
                    dateTimeType: DateTimeEnum.date,
                    hintText: 'وقت البداية',
                    style2: true,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: CustomDateTimePicker(
                    dateTimeController:
                        _latestUpdatesCubit.filterEntity.dateToController,
                    dateTimeType: DateTimeEnum.date,
                    hintText: 'وقت النهاية',
                    style2: true,
                  ),
                ),
              ],
            ),
            10.height,
            CustomDropDown(
              hint: "الحالة",
              items: TypeClientEnum.values,
              itemAsString: (item) => item!.value,
              selectedItem:
                  _latestUpdatesCubit.filterEntity.typeClientNotifier.value,
              onChanged: (type) {
                _latestUpdatesCubit.filterEntity.typeClientNotifier.value =
                    type;
              },
              height: 230.h,
            ),
            if (context.read<PrivilegesCubit>().checkPrivilege('139')) ...[
              10.height,
              SearchableUsersList(
                selectedUser:
                    _latestUpdatesCubit.filterEntity.fkUserNotifier.value,
                onUserSelected: (user) {
                  _latestUpdatesCubit.filterEntity.fkUserNotifier.value = user;
                },
              ),
            ],
            if (context.read<PrivilegesCubit>().checkPrivilege('138')) ...[
              10.height,
              BranchSearchableDropDown(
                hint: "الفرع",
                selectedBranchId: _latestUpdatesCubit
                    .filterEntity.fkRegionNotifier.value?.branchId,
                onSelected: (region) {
                  return _latestUpdatesCubit
                      .filterEntity.fkRegionNotifier.value = region;
                },
              ),
            ],
            10.height,
            CustomDropDown(
              hint: "التعليقات",
              items: NoCommentsEnum.values,
              itemAsString: (item) => item!.value,
              selectedItem:
                  _latestUpdatesCubit.filterEntity.commentsNotifier.value,
              onChanged: (comment) {
                _latestUpdatesCubit.filterEntity.commentsNotifier.value =
                    comment;
              },
              height: 105.h,
            ),
            20.height,
            AppElevatedButton(
              text: "فلترة",
              onPressed: () => _filterAndCloseDialog(),
            ),
            20.height,
          ],
        ),
      ),
    );
  }

  void _filterAndCloseDialog() {
    _latestUpdatesCubit.getLatestClients();
    AppNavigator.pop(result: true);
  }
}
