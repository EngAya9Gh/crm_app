import 'dart:async';

import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/custom_search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/widgets/app_icon.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../model/branch_race_model.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../../view_model/page_state.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../../view_model/vm.dart';
import '../widgets/branch_management_list.dart';
import 'add_target_page.dart';

class BranchRaceManagementView extends StatefulWidget {
  const BranchRaceManagementView({super.key});

  @override
  State<BranchRaceManagementView> createState() => _BranchRaceManagementViewState();
}

class _BranchRaceManagementViewState extends State<BranchRaceManagementView> with StateViewModelMixin<BranchRaceManagementView, BranchRaceViewmodel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: 'سباق الفروع'),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButton(
          child: AppIcon(Icons.add_outlined, size: 35, color: AppColors.white),
          backgroundColor: AppColors.primaryMain,
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => AddTargetPage(),
              ),
            );
          },
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.height,
            CustomSearchWidget(
              searchController: TextEditingController(),
              onChanged: (value) => viewmodel.onSearch(value),
            ),
            SizedBox(height: 15),
            AppCardContainer(
              child: Selector<BranchRaceViewmodel, DateFilterType>(
                selector: (_, vm) => vm.selectedDateFilter,
                builder: (_, selectedDateFilter, __) {
                  return Center(
                    child: GroupButton(
                      controller: GroupButtonController(selectedIndex: selectedDateFilter.index),
                      options: GroupButtonOptions(
                          selectedColor: AppColors.primaryMain,
                          buttonWidth: (MediaQuery.of(context).size.width - 60) / 4,
                          borderRadius: BorderRadius.circular(10)),
                      buttons: ["شهري", "ربعي", 'سنوي'],
                      onSelected: (_, index, isselected) => viewmodel.onChangeSelectedFilterType(index),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Selector<BranchRaceViewmodel, PageState<List<BranchRaceModel>>>(
              selector: (_, vm) => vm.targetsState,
              builder: (context, targetsState, _) {
                if (targetsState.isLoading) {
                  return AppLoader();
                } else if (targetsState.isFailure) {
                  return AppErrorWidget();
                }
                final list = targetsState.data ?? [];
                return Expanded(child: BranchManagementList(targetList: list));
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() => viewmodel
      ..init(context.read<UserProvider>().currentUser.fkCountry.toString())
      ..getTargets());
  }
}
