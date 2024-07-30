import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/common/widgets/management_users_searchable_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/delay_after_install_cubit.dart';

class FilterAfterDelayInstallSheet extends StatefulWidget {
  const FilterAfterDelayInstallSheet({super.key});

  @override
  State<FilterAfterDelayInstallSheet> createState() =>
      _FilterAfterDelayInstallSheetState();
}

class _FilterAfterDelayInstallSheetState
    extends State<FilterAfterDelayInstallSheet> {
  late final DelayAfterInstallCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<DelayAfterInstallCubit>();

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
            Row(
              children: [
                Flexible(
                  child: CustomDateTimePicker(
                    floatingLabelText: 'من تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: _cubit.filterEntity.dateFromController,
                    style2: true,
                    helperText: HelperFunctions.formatDate(DateTime.now()),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: CustomDateTimePicker(
                    floatingLabelText: 'إلى تاريخ',
                    dateTimeType: DateTimeEnum.date,
                    dateTimeController: _cubit.filterEntity.dateToController,
                    style2: true,
                    helperText: HelperFunctions.formatDate(DateTime.now()),
                  ),
                ),
              ],
            ),
            10.height,
            ManagementUsersSearchableDropdown(
              selectedUser: _cubit.filterEntity.employeeNotifier.value,
              onChanged: (user) {
                _cubit.filterEntity.employeeNotifier.value = user;
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
    _cubit.getDelayAfterInstall(
      fkCountry: AppConstants.currentCountry(context) ?? '',
    );
    AppNavigator.pop(result: true);
  }
}
