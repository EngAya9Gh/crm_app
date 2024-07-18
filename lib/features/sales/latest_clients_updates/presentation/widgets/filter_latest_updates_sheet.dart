import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:crm_smart/features/sales/latest_clients_updates/presentation/widgets/markiting_users_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/enums/client/type_client_enum.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../ui/screen/report/is_marketing_chekbox.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/regions/presentation/pages/regions_searchable_drop_down.dart';
import '../../../public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/latest_clients_updates_cubit.dart';

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
                  _latestUpdatesCubit.filterLatestUpdatesEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _latestUpdatesCubit.filterLatestUpdatesEntity
                            .checkIfFilterIsNotEmpty()
                        ? () {
                            _latestUpdatesCubit.filterLatestUpdatesEntity
                                .clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            IsMarketingCheckbox(
              onChange: (value) {
                _latestUpdatesCubit.filterLatestUpdatesEntity
                    .isMarketingNotifier.value = value;
              },
            ),
            20.height,
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    hintText: "بداية عمر التفاوض",
                    controller: _latestUpdatesCubit
                        .filterLatestUpdatesEntity.ageFromController,
                  ),
                ),
                8.width,
                Expanded(
                  child: AppTextField(
                    hintText: "نهاية عمر التفاوض",
                    controller: _latestUpdatesCubit
                        .filterLatestUpdatesEntity.ageToController,
                  ),
                ),
              ],
            ),
            10.height,
            Row(
              children: [
                Flexible(
                  child: CustomDateTimePicker(
                    dateTimeController: _latestUpdatesCubit
                        .filterLatestUpdatesEntity.dateFromController,
                    dateTimeType: DateTimeEnum.time,
                    isStartFromNow: true,
                    hintText: 'وقت البداية',
                    style2: true,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: CustomDateTimePicker(
                    dateTimeController: _latestUpdatesCubit
                        .filterLatestUpdatesEntity.dateToController,
                    dateTimeType: DateTimeEnum.time,
                    isStartFromNow: true,
                    hintText: 'وقت النهاية',
                    style2: true,
                  ),
                ),
              ],
            ),
            10.height,
            CustomDropDown(
              hint: "التصنيف",
              items: TypeClientEnum.values,
              itemAsString: (item) => item!.value,
              selectedItem: _latestUpdatesCubit
                  .filterLatestUpdatesEntity.typeClientNotifier.value,
              onChanged: (type) {
                _latestUpdatesCubit
                    .filterLatestUpdatesEntity.typeClientNotifier.value = type;
              },
              height: 230.h,
            ),
            10.height,
            SearchableUsersList(
              selectedUser: _latestUpdatesCubit
                  .filterLatestUpdatesEntity.fkUserNotifier.value,
              onUserSelected: (user) {
                _latestUpdatesCubit
                    .filterLatestUpdatesEntity.fkUserNotifier.value = user;
              },
            ),
            10.height,
            RegionSearchableDropDown(
              hint: "الفرع",
              selectedRegionId: _latestUpdatesCubit
                  .filterLatestUpdatesEntity.fkRegionNotifier.value?.regionId,
              onSelected: (region) {
                return _latestUpdatesCubit
                    .filterLatestUpdatesEntity.fkRegionNotifier.value = region;
              },
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
