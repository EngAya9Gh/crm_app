import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/get_month_name.dart';
import '../../../../core/utils/end_points.dart';
import '../../../../features/app/presentation/widgets/app_text.dart';
import '../../../../model/branch_race_model.dart';
import '../../../../view_model/branch_race_viewmodel.dart';

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
        if (branchRaceModel.y == null) {
          return SizedBox.shrink();
        }

        return AppCardContainer(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // image
                  Container(
                    height: constraints.maxHeight * 0.6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(   "${EndPoints.baseUrls.laravelFilesUrl}${branchRaceModel.imgRegoin}",),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                        bottom: Radius.circular(3),
                      ),
                    ),
                  ),
                  Spacer(),
                  // details
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          selectedDateFilter == DateFilterType.yearly
                              ? branchRaceModel.yearTarget ?? ''
                              : selectedDateFilter == DateFilterType.quarterly
                                  ? "${branchRaceModel.nameTarget}-${branchRaceModel.yearTarget}"
                                  : "${getMonthName(int.parse(branchRaceModel.nameTarget ?? '0'))}-${branchRaceModel.yearTarget}",
                          color: Colors.blue.shade800,
                          fontWeight: FontWeight.w500,
                        ),
                        AppText(
                          branchRaceModel.x.toString(),
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        AppText(
                          branchRaceModel.y == null
                              ? ''
                              : (((double.parse(branchRaceModel.y.toString())) *
                                              100) /
                                          double.parse(branchRaceModel
                                              .valueTarget
                                              .toString()))
                                      .toStringAsFixed(2) +
                                  ' % ',
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
