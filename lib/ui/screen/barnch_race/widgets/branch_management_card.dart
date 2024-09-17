import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/get_month_name.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../features/app/presentation/widgets/app_text.dart';
import '../../../../model/branch_race_model.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../pages/branch_management_details_page.dart';

class BranchManagementCard extends StatelessWidget {
  const BranchManagementCard({Key? key, required this.branchRaceModel})
      : super(key: key);

  final BranchRaceModel branchRaceModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) =>
                BranchManagementDetailsPage(branchRaceModel: branchRaceModel),
          ),
        );
      },
      child: Selector<BranchRaceViewmodel, DateFilterType>(
        selector: (p0, vm) => vm.selectedDateFilter,
        builder: (_, selectedDateFilter, __) {
          return AppCardContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    branchRaceModel.x != null
                        ? AppText(
                            branchRaceModel.x.toString(),
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.fontFamily1,
                          )
                        : AppText(
                            branchRaceModel.name_regoin.toString(),
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.fontFamily1,
                          ),
                    AppText(
                      selectedDateFilter == DateFilterType.yearly
                          ? branchRaceModel.yearTarget ?? ''
                          : selectedDateFilter == DateFilterType.quarterly
                              ? "${branchRaceModel.nameTarget}-${branchRaceModel.yearTarget}"
                              : "${getMonthName(int.parse(branchRaceModel.nameTarget ?? '0'))}-${branchRaceModel.yearTarget}",
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.fontFamily1,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                AppText(branchRaceModel.valueTarget ?? ''),
              ],
            ),
          );
        },
      ),
    );
  }
}
