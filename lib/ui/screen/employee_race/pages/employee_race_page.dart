import 'dart:async';

import 'package:crm_smart/ui/screen/employee_race/pages/quarterly_employee_pgae.dart';
import 'package:crm_smart/ui/screen/employee_race/pages/yearly_employee_page.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:crm_smart/view_model/vm.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../../view_model/employee_race_viewmodel.dart';
import 'dailyEmployeePage.dart';
import 'monthly_employee_page.dart';

class EmployeeRacePage extends StatefulWidget {
  const EmployeeRacePage({Key? key}) : super(key: key);

  @override
  State<EmployeeRacePage> createState() => _EmployeeRacePageState();
}

class _EmployeeRacePageState extends State<EmployeeRacePage>
    with StateViewModelMixin<EmployeeRacePage, EmployeeRaceViewmodel> {
  @override
  initState() {
    super.initState();
    scheduleMicrotask(() => viewmodel..init()..setFkCountry(context.read<user_vm_provider>().currentUser.fkCountry!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الأكثر مبيعا موظفين"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 8.0,
                  color: Colors.black87.withOpacity(0.2),
                ),
              ],
              color: Colors.white,
            ),
            child: Selector<EmployeeRaceViewmodel, DateFilterType>(
              selector: (_, vm) => vm.selectedDateFilterType,
              builder: (_, selectedDateFilter, __) {
                return GroupButton(
                  controller: GroupButtonController(selectedIndex: selectedDateFilter.index),
                  options: GroupButtonOptions(
                      selectedColor: kMainColor,
                      buttonWidth: (MediaQuery.of(context).size.width - 60) / 3,
                      borderRadius: BorderRadius.circular(10)),
                  buttons: ["شهري", "ربعي", 'سنوي','يومي'],
                  onSelected: (_, index, isselected) => viewmodel.onChangeSelectedDateFilterType(index),
                );
              },
            ),
          ),
          SizedBox(height: 15),
          Consumer<EmployeeRaceViewmodel>(
            builder: (_, vm, __) {
              final selectedDateFilter = vm.selectedDateFilterType;
              if (selectedDateFilter == DateFilterType.yearly) {
                return Expanded(child: YearlyEmployeePage());

              } else if (selectedDateFilter == DateFilterType.quarterly) {
                return Expanded(child: QuarterlyEmployeePage());
              }
              else if (selectedDateFilter == DateFilterType.daily) {
                return Expanded(child: dailyEmployeePage());
              }
                return Expanded(child: MonthlyEmployeePage());
            },
          )
        ],
      ),
    );
  }
}
