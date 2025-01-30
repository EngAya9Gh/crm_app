import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/get_month_name.dart';
import '../../../../core/common/widgets/app_cached_network_image.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../features/app/presentation/widgets/app_text.dart';
import '../../../../model/employee_report_model.dart';
import '../../../../view_model/branch_race_viewmodel.dart';
import '../../../../view_model/employee_race_viewmodel.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    Key? key,
    required this.employeeReportModel,
  }) : super(key: key);

  final EmployeeReportModel employeeReportModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeRaceViewmodel>(builder: (context, vm, _) {
      final date = vm.selectedDateFilterType == DateFilterType.yearly
          ? vm.selectedYear.toString()
          : vm.selectedDateFilterType == DateFilterType.quarterly
              ? "${getQuarterName(vm.selectedQuarter!)}-${vm.selectedQuarterYear}"
              : vm.selectedDateFilterType == DateFilterType.monthly
                  ? "${getMonthName(vm.selectedMonth!)}-${vm.selectedMonthYear}"
                  : "${getMonthName(vm.selectedDailyFrom!.month)}, من ${vm.selectedDailyFrom?.day??''} إلى ${vm.selectedDailyTo?.day??''}";

      return AppCardContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 30.scaleIconsSize,
                  child: employeeReportModel.img_image
                              .toString()
                              .trim()
                              .length ==
                          0
                      // ||usermodell.img_thumbnail.toString().trim().isEmpty
                      ? employeeReportModel.name.toString().isEmpty ||
                              employeeReportModel.name == null
                          ? Icon(
                              Icons.person,
                              size: 50.scaleIconsSize,
                              color: Colors.lightBlueAccent,
                            )
                          : Text(employeeReportModel.name
                              .toString()
                              .substring(0, 1))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: AppCachedNetworkImage(
                            width: 500.scaleIconsSize,
                            height: 500.scaleIconsSize,
                            fit: BoxFit.fill,
                            imageUrl: employeeReportModel.img_image,
                          ),
                        ),
                ),
                if (employeeReportModel.percentage != null)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      decoration: BoxDecoration(
                          color: AppColors.primaryMain,
                          borderRadius: BorderRadius.circular(5)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: AppText(
                        "%" + employeeReportModel.percentage!,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                date,
                color: Colors.blue.shade800,
                fontWeight: FontWeight.w500,
              ),
            ),
            AppText(
              employeeReportModel.name ?? '',
              color: Colors.black,
              fontWeight: FontWeight.w600,
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      );
    });
  }
}
