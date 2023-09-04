import 'package:crm_smart/view_model/branch_race_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../helper/get_month_name.dart';
import '../../../../model/branch_race_model.dart';

class BranchCard extends StatelessWidget {
  const BranchCard({
    Key? key,
    required this.branchRaceModel,
  }) : super(key: key);

  final BranchRaceModel branchRaceModel;

  @override
  Widget build(BuildContext context) {
    return Selector<BranchRaceViewmodel, DateFilterType>(
        selector: (_, vm) => vm.selectedDateFilter,
        builder: (context, selectedDateFilter, _) {
          return
            branchRaceModel.y==null?
            Container(): Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5.0,
            shadowColor: Colors.grey.shade200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assest/images/default_branch.jpg"),
                      fit: BoxFit.fill
                    ),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedDateFilter == DateFilterType.yearly
                            ? branchRaceModel.yearTarget ?? ''
                            : selectedDateFilter == DateFilterType.quarterly
                                ? "${branchRaceModel.nameTarget}-${branchRaceModel.yearTarget}"
                                : "${getMonthName(int.parse(branchRaceModel.nameTarget ?? '0'))}-${branchRaceModel.yearTarget}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.blue.shade800, fontWeight: FontWeight.w500),
                      ),
                      Text(
                      branchRaceModel.x.toString(),
                        // "فرع الخبر",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        branchRaceModel.y==null?'':
                        (((double.parse(branchRaceModel.y.toString())) * 100) /
                                              double.parse(branchRaceModel.valueTarget.toString()))
                                          .toStringAsFixed(2)+' % ' ,
                        // "92.65%",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey.shade500, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

}
