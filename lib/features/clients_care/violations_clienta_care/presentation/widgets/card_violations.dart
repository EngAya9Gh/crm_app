import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/violations_model.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/presentation/widgets/violation_update_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/widgets/app_status_chip.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';

class CardViolations extends StatelessWidget {
  const CardViolations({
    super.key,
    required this.violation,
    required this.tabCareIndex,
  });

  final ViolationModel violation;
  final int tabCareIndex;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () async{
        if(context.read<PrivilegesCubit>().checkPrivilege("305")){
          await AppConstants.showAppDialog(child: UpdateViolationDialog(violation: violation,));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AppText(
                    violation.name,
                    color: AppColors.primaryMain,
                    fontSize: 15.sp,
                  ),
                ),
                5.width,
                AppText(
                  HelperFunctions.formatDate(
                    violation.updatedAt,
                  ),
                  fontWeight: FontWeight.w300,
                  fontSize: 14.sp,
                ),
              ],
            ),
            10.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AppText(
                    violation.user??"",
                    fontSize: 14.sp,
                  ),
                ),
                5.width,
                AppText(
                  violation.management??"",
                  fontWeight: FontWeight.w300,
                  fontSize: 14.sp,
                ),
              ],
            ),
            10.height,
            AppStatusChip(status: violation.acceptStatus!,color: ViolationStateEnumExtension.fromValue(violation.acceptStatus!).color,),
          ],
        ),
      ),
    );
  }
}
