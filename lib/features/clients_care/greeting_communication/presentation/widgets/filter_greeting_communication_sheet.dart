import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/communication/greeting_type_enum.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../view_model/typeclient.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/branches/presentation/pages/branch_searchable_drop_down.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/greeting_communication_cubit.dart';

class FilterGreetingCommunicationSheet extends StatefulWidget {
  const FilterGreetingCommunicationSheet({super.key});

  @override
  State<FilterGreetingCommunicationSheet> createState() =>
      _FilterGreetingCommunicationSheetState();
}

class _FilterGreetingCommunicationSheetState
    extends State<FilterGreetingCommunicationSheet> {
  late final GreetingCommunicationCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<GreetingCommunicationCubit>();

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
            StatefulBuilder(
              builder: (context, refresh) {
                return SwitchListTile(
                  value: _cubit.filterEntity.isMyClientsNotifier.value,
                  onChanged: (value) {
                    _cubit.filterEntity.isMyClientsNotifier.value = value;
                    refresh(() {});
                    if (value) {
                      _cubit.filterEntity.userIdNotifier.value =
                          AppConstants.currentUser.idUser;
                    } else {
                      _cubit.filterEntity.userIdNotifier.value = null;
                    }
                  },
                  title: AppText("عملائي"),
                );
              },
            ),
            10.height,
            BranchSearchableDropDown(
              hint: "الفرع",
              selectedBranchId:
                  _cubit.filterEntity.regionIdNotifier.value?.branchId,
              onSelected: (region) {
                _cubit.filterEntity.regionIdNotifier.value = region;
              },
            ),
            10.height,
            Consumer<ClientTypeProvider>(builder: (context, cart, child) {
              return CustomDropDown<GreetingTypeEnum>(
                hint: "الحالة",
                items: GreetingTypeEnum.values,
                itemAsString: (item) => item!.value,
                selectedItem: _cubit.filterEntity.statusNotifier.value,
                onChanged: (value) {
                  _cubit.filterEntity.statusNotifier.value = value;
                },
                height: 105.h,
              );
            }),
            10.height,
            Row(
              children: [
                Flexible(
                  child: CustomDateTimePicker(
                    hintText: 'من تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: _cubit.filterEntity.dateFromController,
                    style2: true,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: CustomDateTimePicker(
                    hintText: 'الي تاريخ',
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
    _cubit.getGreetingCommunication();
    AppNavigator.pop(result: true);
  }
}
