import 'dart:async';

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_group_button.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../../view_model/employee_race_viewmodel.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../../view_model/vm.dart';
import 'dailyEmployeePage.dart';
import 'monthly_employee_page.dart';
import 'quarterly_employee_pgae.dart';
import 'yearly_employee_page.dart';

class EmployeeRacePage extends StatefulWidget {
  const EmployeeRacePage({super.key});

  @override
  State<EmployeeRacePage> createState() => _EmployeeRacePageState();
}

class _EmployeeRacePageState extends State<EmployeeRacePage>
    with StateViewModelMixin<EmployeeRacePage, EmployeeRaceViewmodel> {
  @override
  initState() {
    super.initState();
    scheduleMicrotask(() => viewmodel
      ..init()
      ..setFkCountry(context.read<UserProvider>().currentUser.fkCountry!)
      ..onChangeYear(DateTime.now().year));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: "الأكثر مبيعا موظفين"),
      body: Column(
        children: [
          10.height,
          AppCardContainer(
            child: Selector<EmployeeRaceViewmodel, DateFilterType>(
              selector: (_, vm) => vm.selectedDateFilterType,
              builder: (_, selectedDateFilter, __) {
                return AppGroupButton(
                  groupButtonController: GroupButtonController(
                      selectedIndex: selectedDateFilter.index),
                  buttons: ["شهري", "ربعي", 'سنوي', 'يومي'],
                  onSelected: (value, index, isselected) {
                    viewmodel.onChangeSelectedDateFilterType(index);
                  },
                );
              },
            ),
          ),
          10.height,
          SizedBox(height: 15),
          Consumer<EmployeeRaceViewmodel>(
            builder: (_, vm, __) {
              final selectedDateFilter = vm.selectedDateFilterType;
              if (selectedDateFilter == DateFilterType.yearly) {
                return Expanded(child: YearlyEmployeePage());
              } else if (selectedDateFilter == DateFilterType.quarterly) {
                return Expanded(child: QuarterlyEmployeePage());
              } else if (selectedDateFilter == DateFilterType.daily) {
                return Expanded(child: DailyEmployeePage());
              }
              return Expanded(child: MonthlyEmployeePage());
            },
          )
        ],
      ),
    );
  }
}
