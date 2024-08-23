import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../../ui/screen/client/profile_client.dart';
import '../../../../app/presentation/widgets/app_text.dart';

class CardDelayInstallReport extends StatelessWidget {
  const CardDelayInstallReport({
    super.key,
    required this.invoice,
  });

  final InvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.5),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: InkWell(
          onTap: () {
            AppNavigator.push(ProfileClient(idClient: invoice.fkIdClient));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    invoice.name_regoin.toString(),
                    style: context.textTheme.titleSmall?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  AppText(
                    invoice.hoursdelaytabel.toString() == '-1'
                        ? 'لم تتم الجدولة بعد'
                        : ' ساعة ' + invoice.hoursdelaytabel.toString(),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              Text(
                invoice.name_enterprise.toString(),
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
