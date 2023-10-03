import 'package:crm_smart/ui/widgets/widgetcalendar/utils.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_date_utils/in_date_utils.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../../constants.dart';
import '../../../../view_model/employee_race_viewmodel.dart';
import '../../../../view_model/vm.dart';
import '../widgets/employee_list.dart';

class DailyEmployeePage extends StatefulWidget {
  DailyEmployeePage({Key? key}) : super(key: key);

  @override
  State<DailyEmployeePage> createState() => _DailyEmployeePageState();
}

class _DailyEmployeePageState extends State<DailyEmployeePage>
    with StateViewModelMixin<DailyEmployeePage, EmployeeRaceViewmodel> {
  Future<void> _selectDateFrom(
      BuildContext context, DateTime currentDate, DateTime? _selectedDateFrom, DateTime? _selectedDateTo) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      currentDate: currentDate,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(3010),
    );
    if (pickedDate != null) {
      if (_selectedDateTo != null) {
        if (_selectedDateTo.isBefore(pickedDate) || _selectedDateFrom!.isAtSameMomentAs(pickedDate)) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "اختر تاريخ قبل ${intl.DateFormat("yyyy dd MMM").format(_selectedDateTo)}",
              textDirection: TextDirection.rtl,
            ),
            backgroundColor: Colors.red,
          ));
          return;
        }
      }
      viewmodel.onChangeFrom(pickedDate);
      setState(() {
        _selectedDateFrom = pickedDate;
      });

      var lastDay = DTU.lastDayOfMonth(_selectedDateFrom!);
      var firstDay = DTU.firstDayOfMonth(_selectedDateFrom!);

      if ((_selectedDateTo?.isAfter(lastDay) ?? false) || (_selectedDateTo?.isBefore(firstDay) ?? false)) {
        viewmodel.onChangeTo(null);
      }
    }
  }

  Future<void> _selectDateTo(BuildContext context, DateTime currentDate, DateTime firstDate, DateTime lastDate,
      {DateTime? selectedDateFrom}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      currentDate: currentDate,
      initialDate: currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (pickedDate != null) {
      if (selectedDateFrom!.isAfter(pickedDate) || selectedDateFrom.isAtSameMomentAs(pickedDate)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
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
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('From:'),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (value) {
                            if (_selectedDateFrom == null) {
                              return 'يرجى تعيين التاريخ ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: kMainColor,
                            ),
                            hintStyle:
                                const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                            hintText: _selectedDateFrom == null
                                ? 'from'
                                : intl.DateFormat('yyyy-MM-dd').format(_selectedDateFrom),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                          ),
                          readOnly: true,
                          onTap: () {
                            _selectDateFrom(
                                context, _selectedDateFrom ?? DateTime.now(), _selectedDateFrom, _selectedDateTo);
                          },
                        ),
                      ],
                    ),
                  ),
                  5.horizontalSpace,
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('To:'),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (value) {
                            if (_selectedDateTo == null) {
                              return 'يرجى تعيين التاريخ ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: kMainColor,
                            ),
                            hintStyle:
                                const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                            hintText:
                                _selectedDateTo == null ? 'to' : intl.DateFormat('yyyy-MM-dd').format(_selectedDateTo),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                          ),
                          readOnly: true,
                          onTap: () {
                            if (_selectedDateFrom == null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("اخنر From أولاً.", textDirection: TextDirection.rtl),
                                backgroundColor: Colors.red,
                              ));
                              return;
                            }

                            var lastDay = DTU.lastDayOfMonth(_selectedDateFrom);
                            var firstDay = DTU.firstDayOfMonth(_selectedDateFrom);

                            _selectDateTo(
                                context,
                                (_selectedDateTo?.isAfter(lastDay) ?? false) ? lastDay : _selectedDateTo ?? lastDay,
                                firstDay,
                                lastDay,
                                selectedDateFrom: _selectedDateFrom);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: value.employeeDailyReportState.isLoading
                        ? SizedBox(height: 25, width: 25)
                        : IconButton(
                            onPressed:
                                _selectedDateFrom == null || _selectedDateTo == null ? null : value.getEmployeeReport,
                            icon: Icon(Icons.filter_alt_rounded, color: kMainColor),
                          ),
                  ),
                ],
              ),
              if (employeeDayReportState.isInit)
                SizedBox.shrink()
              else if (employeeDayReportState.isLoading)
                Center(child: CircularProgressIndicator.adaptive())
              else if (employeeDayReportState.isFailure)
                Center(child: IconButton(onPressed: value.getEmployeeReport, icon: Icon(Icons.refresh)))
              else
                list.isEmpty
                    ? Center(heightFactor: 20, child: Text("لايوجد بيانات لهذا التاريخ!"))
                    : Expanded(child: EmployeeList(list: list)),
            ],
          ),
        );
      },
    );
  }
}
