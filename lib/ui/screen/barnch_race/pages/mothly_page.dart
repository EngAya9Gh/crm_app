import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:crm_smart/view_model/branch_race_viewmodel.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../helper/get_month_name.dart';
import '../../../widgets/custom_widget/row_edit.dart';
import '../widgets/branch_list.dart';

class MonthlyPage extends StatefulWidget {
  const MonthlyPage({Key? key}) : super(key: key);

  @override
  State<MonthlyPage> createState() => _MonthlyPageState();
}

class _MonthlyPageState extends State<MonthlyPage> {
  late String selectedYear = '2020';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            10.height,
            RowEdit(name: 'اختر السنة', des: '*'),
            10.height,
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
                final selectedMonthYearFilter = vm.selectedMonthYearFilter;

                return DropdownButtonFormField<String>(
                  isExpanded: true,
                  validator: (value) {
                    if (value == null) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                  icon: Icon(Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  hint: Text("حدد السنة"),
                  items: getYears().map((String str) {
                    return DropdownMenuItem<String>(
                      child: Text(str, textDirection: TextDirection.rtl),
                      value: str,
                    );
                  }).toList(),
                  value: selectedMonthYearFilter,
                  onChanged: (year) {
                    if (year == null) {
                      return;
                    }
                    vm.onChangeMonthYear(year);
                  },
                  onSaved: (country) {
                    if (country == null) {
                      return;
                    }
                  },
                );
              }),
            ),
            15.height,
            RowEdit(name: 'اختر الشهر', des: '*'),
            10.height,
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Consumer<BranchRaceViewmodel>(
                builder: (context, vm, _) {
                  final months = vm.monthsFilter;
                  final selectedMonth = vm.selectedMonthFilter;

                  return DropdownButtonFormField<String>(
                    isExpanded: true,
                    validator: (value) {
                      if (value == null) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                    icon: Icon(Icons.keyboard_arrow_down_rounded,
                        color: Colors.grey),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    hint: Text("حدد الشهر"),
                    items: months.map((String str) {
                      return DropdownMenuItem<String>(
                        child: Text(str, textDirection: TextDirection.rtl),
                        value: str,
                      );
                    }).toList(),
                    value: selectedMonth,
                    onChanged: (month) {
                      if (month == null) {
                        return;
                      }

                      vm.onChangeMonth(month);
                    },
                    onSaved: (country) {
                      if (country == null) {
                        return;
                      }
                    },
                  );
                },
              ),
            ),
            10.height,
            Consumer<BranchRaceViewmodel>(builder: (context, vm, _) {
              final monthlyState = vm.monthlyState;

              if (monthlyState.isLoading) {
                return Center(child: CircularProgressIndicator.adaptive());
              } else if (monthlyState.isFailure) {
                return Center(
                  child: IconButton(
                      onPressed: () {}, // viewmodel.getTargets,
                      icon: Icon(Icons.refresh)),
                );
              }

              final list = monthlyState.data ?? [];
              return Expanded(child: BranchList(targetList: list));
            }),
          ],
        ),
      ),
    );
  }
}
