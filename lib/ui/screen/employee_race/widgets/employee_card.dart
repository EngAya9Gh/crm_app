import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/helpers/get_month_name.dart';
import '../../../../core/common/widgets/app_cached_network_image.dart';
import '../../../../core/utils/app_colors.dart';
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
                  : "${getMonthName(vm.selectedDailyFrom!.month)}, من ${vm.selectedDailyFrom!.day} إلى ${vm.selectedDailyTo!.day}";

      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5.0,
        shadowColor: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                // Container(
                //   height: 150,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(image: AssetImage("assest/images/employee.png"), fit: BoxFit.scaleDown),
                //     borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                //   ),
                // ),
                CircleAvatar(
                  radius: 30,
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
                              size: 50,
                              color: Colors.lightBlueAccent,
                            )
                          : Text(employeeReportModel.name
                              .toString()
                              .substring(0, 1))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: AppCachedNetworkImage(
                            width: 500,
                            height: 500,
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
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text("%" + employeeReportModel.percentage!,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.blue.shade800,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    employeeReportModel.name ?? '',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
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
