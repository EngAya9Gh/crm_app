import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../core/common/enums/notifications/notification_type_enum.dart';
import '../../../../core/config/navigator/app_navigator.dart';
import '../../../app/presentation/widgets/app_text_button.dart';
import '../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/notifications_cubit.dart';

class FilterNotificationsSheet extends StatefulWidget {
  const FilterNotificationsSheet({super.key});

  @override
  State<FilterNotificationsSheet> createState() =>
      _FilterNotificationsSheetState();
}

class _FilterNotificationsSheetState extends State<FilterNotificationsSheet> {
  late final NotificationsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<NotificationsCubit>();

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
                  _cubit.filterEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _cubit.filterEntity.checkIfFilterIsNotEmpty()
                        ? () {
                            _cubit.filterEntity.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            10.height,
            CustomSearchableDropDown<NotificationTypeEnum>(
              hint: 'نوع الإشعار',
              items: NotificationTypeEnum.values,
              itemAsString: (item) => item!.value,
              onChanged: (value) {
                _cubit.filterEntity.notificationTypeNotifier.value = value;
              },
              selectedItem: _cubit.filterEntity.notificationTypeNotifier.value,
              compareFn:  (item, selectedItem) => item.index == selectedItem.index,
              filterFn: (NotificationTypeEnum, String) {
                return NotificationTypeEnum.value.contains(String);
              },
            ),
            10.height,
            Row(
              children: [
                Flexible(
                  child: CustomDateTimePicker(
                    floatingLabelText: 'من تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: _cubit.filterEntity.dateFromController,
                    style2: true,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: CustomDateTimePicker(
                    floatingLabelText: 'إلى تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: _cubit.filterEntity.dateToController,
                    style2: true,
                  ),
                ),
              ],
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
    _cubit.getNotifications();
    AppNavigator.pop(result: true);
  }
}
