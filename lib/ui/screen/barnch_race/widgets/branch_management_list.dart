import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:flutter/material.dart';

import '../../../../model/branch_race_model.dart';
import 'branch_management_card.dart';

class BranchManagementList extends StatelessWidget {
  const BranchManagementList({Key? key, required this.targetList})
      : super(key: key);

  final List<BranchRaceModel> targetList;

  @override
  Widget build(BuildContext context) {
    return AppPaginatedList(
      items: targetList,
      separatorBuilder: (_, index) => SizedBox(height: 10),
      itemBuilder: (_, index) =>
          BranchManagementCard(branchRaceModel: targetList[index]),
    );
  }
}
