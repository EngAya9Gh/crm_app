import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:in_date_utils/in_date_utils.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../../core/common/enums/enums.dart';
import '../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../core/common/helpers/app_snackbar.dart';
import '../../../../features/app/presentation/widgets/app_text.dart';
import '../../../../view_model/employee_race_viewmodel.dart';
import '../../../../view_model/page_state.dart';
import '../../../../view_model/vm.dart';
import '../widgets/employee_list.dart';

class DailyEmployeePage extends StatefulWidget {
  DailyEmployeePage({super.key});

  @override
  State<DailyEmployeePage> createState() => _DailyEmployeePageState();
}

class _DailyEmployeePageState extends State<DailyEmployeePage>
    with StateViewModelMixin<DailyEmployeePage, EmployeeRaceViewmodel> {
  Future<void> _selectDateFrom(BuildContext context, DateTime currentDate,
      DateTime? _selectedDateFrom, DateTime? _selectedDateTo) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      currentDate: currentDate,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(3010),
    );
    if (pickedDate != null) {
      if (_selectedDateTo != null) {
        if (_selectedDateTo.isBefore(pickedDate) ||
            _selectedDateFrom!.isAtSameMomentAs(pickedDate)) {
          AppSnackbar.showSnakeBar(
            "اختر تاريخ قبل ${intl.DateFormat("yyyy dd MMM").format(_selectedDateTo)}",
            color: ToastColorsEnum.error,
          );

          return;
        }
      }
      _onChange(pickedDate, _selectedDateFrom, _selectedDateTo);
    }
  }

  void _onChange(
    DateTime pickedDate,
    DateTime? _selectedDateFrom,
    DateTime? _selectedDateTo,
  ) {
    viewmodel.onChangeFrom(pickedDate);
    setState(() {
      _selectedDateFrom = pickedDate;
    });

    var lastDay = DTU.lastDayOfMonth(_selectedDateFrom!);
    var firstDay = DTU.firstDayOfMonth(_selectedDateFrom!);

    if ((_selectedDateTo?.isAfter(lastDay) ?? false) ||
        (_selectedDateTo?.isBefore(firstDay) ?? false)) {
      viewmodel.onChangeTo(null);
    }
  }

  Future<void> _selectDateTo(BuildContext context, DateTime currentDate,
      DateTime firstDate, DateTime lastDate,
      {DateTime? selectedDateFrom}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      currentDate: currentDate,
      initialDate: currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (pickedDate != null) {
      if (selectedDateFrom!.isAfter(pickedDate) ||
          selectedDateFrom.isAtSameMomentAs(pickedDate)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: AppText(
            "اختر تاريخ بعد ${intl.DateFormat("yyyy dd MMM").format(selectedDateFrom)}",
            textDirection: TextDirection.rtl,
          ),
          backgroundColor: Colors.red,
        ));

        return;
      }

      viewmodel.onChangeTo(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeRaceViewmodel>(
      builder: (context, value, child) {
        final employeeDayReportState = value.employeeDailyReportState;
        final _selectedDateFrom = value.selectedDailyFrom;
        final _selectedDateTo = value.selectedDailyTo;
        final list = employeeDayReportState.data ?? [];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: CustomDateTimePicker(
                        hintText: 'from',
                        dateTimeType: DateTimeEnum.date,
                        dateTimeController: TextEditingController(),
                        onDateChange: (dateTime, formattedDate) => _onChange(
                          dateTime,
                          _selectedDateFrom,
                          _selectedDateTo,
                        ),
                        style2: true,
                      ),
                    ),
                  ),
                  5.width,
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: CustomDateTimePicker(
                        hintText: 'to',
                        dateTimeType: DateTimeEnum.date,
                        dateTimeController: TextEditingController(),
                        onDateChange: (dateTime, formattedDate) {
                          if (_selectedDateFrom == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("اخنر From أولاً.",
                                  textDirection: TextDirection.rtl),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }

                          var lastDay = DTU.lastDayOfMonth(_selectedDateFrom);
                          var firstDay = DTU.firstDayOfMonth(_selectedDateFrom);

                          _selectDateTo(
                              context,
                              (_selectedDateTo?.isAfter(lastDay) ?? false)
                                  ? lastDay
                                  : _selectedDateTo ?? lastDay,
                              firstDay,
                              lastDay,
                              selectedDateFrom: _selectedDateFrom);
                        },
                        style2: true,
                      ),
                    ),
                  ),
                ],
              ),
              5.height,
              AppElevatedButton(
                text: 'تحديث',
                onPressed: _selectedDateFrom == null || _selectedDateTo == null
                    ? null
                    : value.getEmployeeReport,
              ),
              10.height,
              if (employeeDayReportState.isInit)
                SizedBox.shrink()
              else if (employeeDayReportState.isLoading)
                AppLoader()
              else if (employeeDayReportState.isFailure)
                AppErrorWidget(
                    message: 'حدث خطأ أثناء تحميل البيانات',
                    onPressed: value.getEmployeeReport)
              else
                list.isEmpty
                    ? Expanded(
                        child: Center(
                            heightFactor: 20,
                            child: AppText("لايوجد بيانات لهذا التاريخ!")),
                      )
                    : Expanded(child: EmployeeList(list: list)),
            ],
          ),
        );
      },
    );
  }
}
