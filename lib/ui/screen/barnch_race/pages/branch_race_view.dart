import 'dart:async';

import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_group_button.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/extensions/num_extensions.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../../view_model/vm.dart';
import 'mothly_page.dart';
import 'quarter_page.dart';
import 'yearly_page.dart';

class BranchRaceView extends StatefulWidget {
  const BranchRaceView({super.key});

  @override
  State<BranchRaceView> createState() => _BranchRaceViewState();
}

class _BranchRaceViewState extends State<BranchRaceView>
    with StateViewModelMixin<BranchRaceView, BranchRaceViewmodel> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'سباق الفروع'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            15.height,
            Selector<BranchRaceViewmodel, DateFilterType>(
              selector: (_, vm) => vm.selectedDateFilter,
              builder: (_, selectedDateFilter, __) {
                return AppCardContainer(
                  child: AppGroupButton(
                    groupButtonController: GroupButtonController(
                        selectedIndex: selectedDateFilter.index),
                    buttons: ["شهري", "ربعي", 'سنوي'],
                    onSelected: (value, index, isselected) {
                      viewmodel.onChangeSelectedFilterType(index,
                          isFromBranchManage: false);
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 15),
            Consumer<BranchRaceViewmodel>(
              builder: (_, vm, __) {
                final selectedDateFilter = vm.selectedDateFilter;

                if (selectedDateFilter == DateFilterType.yearly) {
                  return Expanded(child: YearlyPage());
                } else if (selectedDateFilter == DateFilterType.quarterly) {
                  return Expanded(child: QuarterPage());
                }
                return Expanded(child: MonthlyPage());
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      viewmodel
        ..init(context.read<UserProvider>().currentUser.fkCountry.toString())
        // ..
        // ..getTargets()
        ..onChangeYear(DateTime.now().year.toString());
      // viewmodel.onChangeSelectedFilterType(2);
    });
  }
}
