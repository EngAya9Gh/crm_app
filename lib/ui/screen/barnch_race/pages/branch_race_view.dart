import 'dart:async';

import 'package:crm_smart/ui/screen/barnch_race/pages/quarter_page.dart';
import 'package:crm_smart/ui/screen/barnch_race/pages/yearly_page.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:crm_smart/view_model/vm.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import 'mothly_page.dart';

class BranchRaceView extends StatefulWidget {
  const BranchRaceView({Key? key}) : super(key: key);

  @override
  State<BranchRaceView> createState() => _BranchRaceViewState();
}

class _BranchRaceViewState extends State<BranchRaceView> with StateViewModelMixin<BranchRaceView, BranchRaceViewmodel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("سباق الفروع"),
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
            child: Selector<BranchRaceViewmodel, DateFilterType>(
              selector: (_, vm) => vm.selectedDateFilter,
              builder: (_, selectedDateFilter, __) {
                return GroupButton(
                  controller: GroupButtonController(selectedIndex: selectedDateFilter.index),
                  options: GroupButtonOptions(
                      selectedColor: kMainColor,
                      buttonWidth: (MediaQuery.of(context).size.width - 60) / 3,
                      borderRadius: BorderRadius.circular(10)),
                  buttons: ["شهري", "ربعي", 'سنوي'],
                  onSelected: (_, index, isselected) =>
                      viewmodel.onChangeSelectedFilterType(index),
                );
              },
            ),
          ),
          SizedBox(height: 15),
          Consumer<BranchRaceViewmodel>(
            builder: (_, vm, __) {
              final selectedDateFilter = vm.selectedDateFilter;
              final targetsState = vm.targetsState;

              if (targetsState.isLoading) {
                return Center(child: CircularProgressIndicator.adaptive());
              } else if (targetsState.isFailure) {
                return Center(
                  child: IconButton(
                      onPressed:() {},// viewmodel.getTargets,
                      icon: Icon(Icons.refresh)),
                );
              }

              final list = targetsState.data ?? [];

              if (selectedDateFilter == DateFilterType.yearly) {
                return Expanded(child: YearlyPage(targetList: list));
              } else if (selectedDateFilter == DateFilterType.quarterly) {
                return Expanded(child: QuarterPage(targetList: list));
              }
              return Expanded(child: MonthlyPage(targetList: list));
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
       viewmodel
        ..init()
        // ..
        ..getTargets();
       viewmodel.onChangeSelectedFilterType(2);
    });
  }
}
