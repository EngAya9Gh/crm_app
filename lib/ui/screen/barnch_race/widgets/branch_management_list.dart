import 'package:flutter/material.dart';

import 'branch_management_card.dart';

class BranchManagementList extends StatelessWidget {
  const BranchManagementList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 15,right: 15,bottom: 10,top: 0),
      separatorBuilder:(_,index) => SizedBox(height: 10),
      itemCount: 10,
      itemBuilder: (_, index) => BranchManagementCard(),
    );
  }
}
