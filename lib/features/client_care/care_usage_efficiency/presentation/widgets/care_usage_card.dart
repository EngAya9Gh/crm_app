import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/ui/screen/client/client_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../view_model/communication_vm.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../../core/utils/app_colors.dart';
import '../manager/care_usage_cubit/care_usage_cubit.dart';

import '../../data/models/care_usage_model.dart';

class CareUsageCard extends StatelessWidget {
  final CareUsageModel careUsage;

  const CareUsageCard({
    Key? key,
    required this.careUsage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CareUsageCubit>();

    return BlocBuilder<CareUsageCubit, CareUsageState>(
      builder: (context, state) {
        // Find the updated model in the state list if it exists
        final updatedCareUsage = state.careUsageList.firstWhere(
          (item) => item.idCommunication == careUsage.idCommunication,
          orElse: () => careUsage,
        );

        final isLoading = state.doneCommunicationStatus.isLoading();

    return AppCardContainer(
      onTap: () {
        AppNavigator.go(
          ClientProfile(
            idClient: updatedCareUsage.idClients.toString(),
            tabIndex: 4,
            tabCareIndex: 3,
            idCommunication: updatedCareUsage.idCommunication.toString(),
          ),
          name: AppRoutesNames.clientProfile.inCareUsage,
              pathParameters: {
                'idClient': updatedCareUsage.idClients.toString()
              },
          extra: {
            'tabIndex': 4,
            'tabCareIndex': 3,
            'idCommunication': updatedCareUsage.idCommunication,
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
                        updatedCareUsage.nameEnterprise ?? '',
                    fontSize: 16.scaleFontSize,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryMain,
                  ),
                ),
                    if (updatedCareUsage.possibilityOfWithdraw != null)
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.r, vertical: 6.r),
                        decoration: BoxDecoration(
                          color: updatedCareUsage.possibilityOfWithdraw!.color
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: AppText(
                          updatedCareUsage.possibilityOfWithdraw!.value,
                          fontSize: 12.scaleFontSize,
                          color: updatedCareUsage.possibilityOfWithdraw!.color,
                        ),
                      ),
                    8.horizontalSpace,
                    if (updatedCareUsage.shouldCommunicate == 1)
                  Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.r, vertical: 6.r),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: AppText(
                      'يحتاج تواصل',
                      fontSize: 12.scaleFontSize,
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
                  child: Stack(
                    children: [
                      if (updatedCareUsage.tag ?? false) ...[
                        Positioned(
                          left: 100,
                          child: AppIcon(
                            CupertinoIcons.checkmark_seal_fill,
                            color: AppColors.secondaryMain,
                          ),
                        ),
                      ],
                      Column(
                children: [
                  _buildInfoRow(
                    'آخر نشاط:',
                            updatedCareUsage.lastActivity ?? 'غير متوفر',
                  ),
                  12.verticalSpace,
                  _buildInfoRow(
                    'عدد الأيام منذ آخر نشاط:',
                            updatedCareUsage.days_since_last_activity != null
                                ? updatedCareUsage.days_since_last_activity
                                    .toString()
                        : 'غير متوفر',
                  ),
                  12.verticalSpace,
                  _buildInfoRow(
                    'نهاية الاشتراك:',
                            updatedCareUsage.endSubscription != null
                                ? updatedCareUsage.endSubscription!
                                    .split(' ')[0]
                        : 'غير متوفر',
                  ),
                  12.verticalSpace,
                  _buildInfoRow(
                    'الباقة:',
                            updatedCareUsage.package ?? 'غير متوفر',
                  ),
                  12.verticalSpace,
                  _buildInfoRow(
                    'آخر موديول:',
                            updatedCareUsage.lastModuleActivity ?? 'غير متوفر',
                  ),
                  12.verticalSpace,
                  _buildInfoRow(
                    'آخر عملية:',
                            updatedCareUsage.lastOperationActivity ??
                                'غير متوفر',
                          ),
                        ],
                  ),
                ],
              ),
            ),
                if (updatedCareUsage.shouldCommunicate == 1) ...[
              16.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: AppElevatedButton(
                  text: 'تم التواصل',
                      onPressed: isLoading
                          ? null
                          : () {
                              cubit.doneCommunication(
                                updatedCareUsage.idCommunication!,
                              );
                            },
                  backgroundColor: AppColors.primaryMain,
                      child: isLoading&&(state.doneCommunicationStatus.data==careUsage.idCommunication)
                          ? const AppLoader(color: Colors.white)
                          : null,
                ),
              ),
            ],
          ],
        ),
      ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          label,
          fontWeight: FontWeight.w600,
          fontSize: 14.scaleFontSize,
          color: Colors.grey[700],
        ),
        8.horizontalSpace,
        Expanded(
          child: AppText(
            value,
            fontSize: 14.scaleFontSize,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
