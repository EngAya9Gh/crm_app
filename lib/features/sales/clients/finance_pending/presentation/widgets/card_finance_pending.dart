import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../client_dashboard.dart';

class CardFinancePending extends StatelessWidget {
  const CardFinancePending({
    super.key,
    required this.invoice,
  });

  final InvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () {
        AppNavigator.push(ClientDashboard(
          typeInvoice: 'f',
          invoiceModel: invoice,
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                invoice.name_regoin_invoice.toString(),
                color: AppColors.primaryColor,
                fontSize: 18,
              ),
              AppText(
                invoice.dateCreate.toString(),
                color: AppColors.primaryColor,
                fontSize: 18,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                invoice.name_enterprise.toString(),
                fontSize: 20,
              ),
              if (invoice.cancel_approvment?.toString() == '1')
                Icon(
                  Icons.access_time_filled_rounded,
                  color: Colors.amber,
                  size: (25.0).scaleIconsSize,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
