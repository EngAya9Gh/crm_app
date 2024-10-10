import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/enums/reports/invoice_type_enum.dart';
import '../../../../../../core/common/enums/reports/period_type_enum.dart';
import '../../../../../../core/common/enums/reports/product_type_enum.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../ui/screen/client/IsmarketCheck_last.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/employees_sales_reports_cubit.dart';

class FilterEmployeesSalesReportsSheet extends StatefulWidget {
  const FilterEmployeesSalesReportsSheet({super.key});

  @override
  State<FilterEmployeesSalesReportsSheet> createState() =>
      _FilterEmployeesSalesReportsSheetState();
}

class _FilterEmployeesSalesReportsSheetState
    extends State<FilterEmployeesSalesReportsSheet> {
  late final EmployeesSalesReportsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<EmployeesSalesReportsCubit>();

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
            IsMarketingCheckbox_last(
              isMarketingNotifier: _cubit.filterEntity.isMarketingNotifier,
              onChange: (value) {
                _cubit.filterEntity.setIsMarketingNotifierValue = value;
              },
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
              height: 105.h,
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
            CustomDropDown<ProductTypeEnum>(
              hint: 'نوع المنتج',
              items: ProductTypeEnum.values,
              itemAsString: (item) => item!.value,
              selectedItem: _cubit.filterEntity.productTypeNotifier.value,
              onChanged: (value) {
                _cubit.filterEntity.setProductTypeNotifierValue = value!;
              },
              height: 75.h,
            ),10.height,
            CustomDropDown<InvoiceTypeEnum>(
              hint: 'نوع الفاتورة',
              items: InvoiceTypeEnum.values,
              itemAsString: (item) => item!.value,
              selectedItem: _cubit.filterEntity.invoiceTypeNotifier.value,
              onChanged: (value) {
                _cubit.filterEntity.setInvoiceTypeNotifierValue = value!;
              },
              height: 75.h,
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
    _cubit.getEmployeesSalesReports();
    AppNavigator.pop(result: true);
  }
}
