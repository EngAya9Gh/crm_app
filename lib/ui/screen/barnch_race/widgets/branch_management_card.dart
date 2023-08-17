import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';
import '../../../../helper/get_month_name.dart';
import '../../../../model/branch_race_model.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../pages/branch_management_details_page.dart';

class BranchManagementCard extends StatelessWidget {
  const BranchManagementCard({Key? key, required this.branchRaceModel}) : super(key: key);

  final BranchRaceModel branchRaceModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => BranchManagementDetailsPage(branchRaceModel: branchRaceModel),
          ),
        );
      },
      child: Selector<BranchRaceViewmodel, DateFilterType>(
        selector: (p0, vm) => vm.selectedDateFilter,
        builder: (_, selectedDateFilter, __) {
          return Card(
            margin: EdgeInsets.zero,
            shadowColor: Colors.grey.shade200,
            elevation: 5.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      branchRaceModel.x!=null?
                      Text(
                        branchRaceModel.x.toString(),
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: kfontfamily),
                      ):Text(
                        branchRaceModel.name_regoin.toString(),
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: kfontfamily),
                      ),
                      Text(
                        selectedDateFilter == DateFilterType.yearly
                            ? branchRaceModel.yearTarget ?? ''
                            : selectedDateFilter == DateFilterType.quarterly
                                ? "${branchRaceModel.nameTarget}-${branchRaceModel.yearTarget}"
                                : "${getMonthName(int.parse(branchRaceModel.nameTarget ?? '0'))}-${branchRaceModel.yearTarget}",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: kfontfamily),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(branchRaceModel.valueTarget ?? ''),
                  // SizedBox(height: 5),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text("6.47%"),
                  //     Text("8415"),
                  //   ],
                  // )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
