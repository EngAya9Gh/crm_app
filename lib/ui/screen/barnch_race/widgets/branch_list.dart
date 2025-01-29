import 'package:crm_smart/core/common/widgets/app_paginated_grid.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';

import '../../../../model/branch_race_model.dart';
import 'branch_card.dart';

class BranchList extends StatelessWidget {
  const BranchList({
    Key? key,
    required this.targetList,
    this.onPressed,
  }) : super(key: key);
  final List<BranchRaceModel>? targetList;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if (targetList?.isEmpty ?? true) {
      return AppErrorWidget(
        onPressed: () {
          onPressed?.call();
        },
        message: 'لا يوجد بيانات',
      );
    }
    return AppPaginatedGridView(
      shrinkWrap: true,
      items: targetList!,
      itemBuilder: (_, index) => SizedBox(
          width: 300,
          height: 300,
          child: BranchCard(branchRaceModel: targetList![index])),
    );
  }
}
