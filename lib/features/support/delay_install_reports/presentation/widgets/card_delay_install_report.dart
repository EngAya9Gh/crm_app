import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:flutter/material.dart';

import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../app/presentation/widgets/app_text.dart';

class CardDelayInstallReport extends StatelessWidget {
  const CardDelayInstallReport({
    super.key,
    required this.invoice,
  });

  final InvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () {
        AppNavigator.go(
          ClientProfile(idClient: invoice.fkIdClient),
          isNew: false,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                invoice.name_regoin,
                color: AppColors.primaryMain,
              ),
              AppText(
                invoice.hoursdelaytabel.toString() == '-1'
                    ? 'لم تتم الجدولة بعد'
                    : ' ساعة ' + invoice.hoursdelaytabel.toString(),
                color: AppColors.primaryMain,
                fontSize: 18,
              ),
            ],
          ),
          AppText(invoice.name_enterprise),
        ],
      ),
    );
  }
}
