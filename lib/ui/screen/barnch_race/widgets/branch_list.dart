import 'package:flutter/material.dart';

import '../../../../model/branch_race_model.dart';
import 'branch_card.dart';

class BranchList extends StatelessWidget {
  const BranchList({
    Key? key,
    required this.targetList,
  }) : super(key: key);
  final List<BranchRaceModel> targetList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 1.3,
      ),
      itemCount: targetList.length,
      itemBuilder: (_, index) => BranchCard(branchRaceModel: targetList[index]),
    );
  }
}
