import 'package:flutter/material.dart';

import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../app/presentation/widgets/app_text.dart';

class CardDelayAfterInstall extends StatelessWidget {
  const CardDelayAfterInstall({
    super.key,
    required this.invoice,
  });

  final InvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.go(ClientProfile(idClient: invoice.fkIdClient));
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.5),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    invoice.name_regoin.toString(),
                    color: AppColors.primaryMain,
                  ),
                  AppText(
                    invoice.hoursdelayinstall.toString() == '-1'
                        ? 'لم تتم الجدولة بعد'
                        : ' ساعة ' + invoice.hoursdelayinstall.toString(),
                    color: AppColors.primaryMain,
                    fontSize: 18,
                  ),
                ],
              ),
              AppText(
                invoice.name_enterprise.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
