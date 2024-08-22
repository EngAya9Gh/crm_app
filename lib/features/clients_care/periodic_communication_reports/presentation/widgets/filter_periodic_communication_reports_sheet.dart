import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/periodic_communication_reports_cubit.dart';

class FilterPeriodicCommunicationReportsSheet extends StatefulWidget {
  const FilterPeriodicCommunicationReportsSheet({super.key});

  @override
  State<FilterPeriodicCommunicationReportsSheet> createState() =>
      _FilterPeriodicCommunicationReportsSheetState();
}

class _FilterPeriodicCommunicationReportsSheetState
    extends State<FilterPeriodicCommunicationReportsSheet> {
  late final PeriodicCommunicationReportsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<PeriodicCommunicationReportsCubit>();

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
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Flexible(
                    child: CustomDateTimePicker(
                      dateTimeController:
                          _cubit.filterEntity.dateFromController,
                      dateTimeType: DateTimeEnum.date,
                      hintText: 'وقت البداية',
                      style2: true,
                    ),
                  ),
                  10.width,
                  Flexible(
                    child: CustomDateTimePicker(
                      dateTimeController: _cubit.filterEntity.dateToController,
                      dateTimeType: DateTimeEnum.date,
                      hintText: 'وقت النهاية',
                      style2: true,
                    ),
                  ),
                ],
              ),
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
    _cubit.getPeriodicCommunicationReports();
    AppNavigator.pop(result: true);
  }
}
