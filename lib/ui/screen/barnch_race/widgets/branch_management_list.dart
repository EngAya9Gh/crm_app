import 'package:flutter/material.dart';
import '../../../../model/branch_race_model.dart';
import 'branch_management_card.dart';

class BranchManagementList extends StatelessWidget {
  const BranchManagementList({Key? key, required this.targetList}) : super(key: key);

  final List<BranchRaceModel> targetList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 100, top: 0),
      separatorBuilder: (_, index) => SizedBox(height: 10),
      itemCount: targetList.length,
      itemBuilder: (_, index) => BranchManagementCard(branchRaceModel: targetList[index]),
    );
  }
}
