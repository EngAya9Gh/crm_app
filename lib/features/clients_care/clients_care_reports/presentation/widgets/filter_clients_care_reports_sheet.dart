import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/enums/reports/period_type_enum.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/enums/reports/care_report_type_enum.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/clients_care_reports_cubit.dart';

class FilterClientsCareReportsSheet extends StatefulWidget {
  const FilterClientsCareReportsSheet({super.key});

  @override
  State<FilterClientsCareReportsSheet> createState() =>
      _FilterClientsCareReportsSheetState();
}

class _FilterClientsCareReportsSheetState
    extends State<FilterClientsCareReportsSheet> {
  late final ClientsCareReportsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ClientsCareReportsCubit>();

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
            CustomDropDown<PeriodTypeEnum>(
              hint: 'الفترة',
              items: PeriodTypeEnum.values,
              itemAsString: (item) => item!.value,
              selectedItem: _cubit.filterEntity.periodTypeNotifier.value,
              onChanged: (value) {
                _cubit.filterEntity.setPeriodTypeNotifierValue = value!;
                _cubit.filterEntity.changeReportTypeAccordingToPeriod();
                _cubit.filterEntity.changeDateAccordingToPeriod();
              },
              height: (135.0).scaleHeight,
            ),
            ValueListenableBuilder(
              valueListenable: _cubit.filterEntity.periodTypeNotifier,
              builder: (context, value, child) {
                return Padding(
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
                      if (_cubit
                          .filterEntity.periodTypeNotifier.value.isDaily) ...[
                        10.width,
                        Flexible(
                          child: CustomDateTimePicker(
                            dateTimeController:
                                _cubit.filterEntity.dateToController,
                            dateTimeType: DateTimeEnum.date,
                            hintText: 'وقت النهاية',
                            style2: true,
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
            10.height,
            CustomDropDown<CareReportTypeEnum>(
              hint: 'النوع',
              items: CareReportTypeEnum.values,
              itemAsString: (item) => item!.value,
              selectedItem: _cubit.filterEntity.typeCareNotifier.value,
              onChanged: (value) {
                _cubit.filterEntity.setTypeCareNotifierValue = value!;
              },
              height: (135.0).scaleHeight,
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
    _cubit.getClientsCareReports();
    AppNavigator.pop(result: true);
  }
}
