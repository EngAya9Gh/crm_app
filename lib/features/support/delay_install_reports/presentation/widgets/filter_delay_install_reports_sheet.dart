import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/common/widgets/management_users_searchable_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../manager/delay_install_reports_cubit.dart';

class FilterDelayInstallReportsSheet extends StatefulWidget {
  const FilterDelayInstallReportsSheet({super.key});

  @override
  State<FilterDelayInstallReportsSheet> createState() =>
      _FilterDelayInstallReportsSheetState();
}

class _FilterDelayInstallReportsSheetState
    extends State<FilterDelayInstallReportsSheet> {
  late final DelayInstallReportsCubit _delayInstallCubit;

  @override
  void initState() {
    _delayInstallCubit = context.read<DelayInstallReportsCubit>();

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
                  _delayInstallCubit.filterEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _delayInstallCubit.filterEntity
                            .checkIfFilterIsNotEmpty()
                        ? () {
                            _delayInstallCubit.filterEntity.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            ManagementUsersSearchableDropdown(
              selectedUser:
                  _delayInstallCubit.filterEntity.employeeNotifier.value,
              onChanged: (user) {
                _delayInstallCubit.filterEntity.employeeNotifier.value = user;
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
    _delayInstallCubit.getDelayInstallReports(
      fkCountry: AppConstants.currentCountry(context) ?? '',
    );
    AppNavigator.pop(result: true);
  }
}
