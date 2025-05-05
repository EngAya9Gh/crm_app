import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/ui/screen/client/client_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../view_model/communication_vm.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../../core/utils/app_colors.dart';

import '../../data/models/care_usage_model.dart';

class CareUsageCard extends StatelessWidget {
  final CareUsageModel careUsage;

  const CareUsageCard({
    Key? key,
    required this.careUsage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () {
        AppNavigator.go(
          ClientProfile(
            idClient: careUsage.idClients.toString(),
            tabIndex: 4,
            tabCareIndex: 3,
            idCommunication: careUsage.idCommunication.toString(),
          ),
          name: AppRoutesNames.clientProfile.inCarePeriodicCommunication,
          pathParameters: {'idClient': careUsage.idClients.toString()},
          extra: {
            'tabIndex': 4,
            'tabCareIndex': 3,
            'idCommunication': careUsage.idCommunication,
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppText(
                    careUsage.nameEnterprise ?? '',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryMain,
                  ),
                ),
                if (  careUsage.shouldCommunicate==1)
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.r, vertical: 6.r),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: AppText(
                      'يحتاج تواصل',
                      fontSize: 12.sp,
                      color: Colors.orange,
                    ),
                  ),
              ],
            ),
            20.verticalSpace,
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  _buildInfoRow(
                    'آخر نشاط:',
                    careUsage.lastActivity != null
                        ? careUsage.lastActivity!
                        : 'غير متوفر',
                  ),
                  12.verticalSpace,
                  _buildInfoRow(
                    'نهاية الاشتراك:',
                    careUsage.endSubscription != null
                        ? careUsage.endSubscription!.split(' ')[0]
                        : 'غير متوفر',
                  ),
                  12.verticalSpace,
                  _buildInfoRow(
                    'الباقة:',
                    careUsage.package ?? 'غير متوفر',
                  ),
                  12.verticalSpace,
                  _buildInfoRow(
                    'آخر موديول:',
                    careUsage.lastModuleActivity ?? 'غير متوفر',
                  ),
                  12.verticalSpace,
                  _buildInfoRow(
                    'آخر عملية:',
                    careUsage.lastOperationActivity ?? 'غير متوفر',
                  ),
                ],
              ),
            ),
            if ( careUsage.shouldCommunicate==1 ) ...[
              16.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: AppElevatedButton(
                  text: 'تم التواصل',
                  onPressed: () => {},
                  backgroundColor: AppColors.primaryMain,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          label,
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: Colors.grey[700],
        ),
        8.horizontalSpace,
        Expanded(
          child: AppText(
            value,
            fontSize: 14.sp,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
