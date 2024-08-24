import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../client_dashboard.dart';

class CardPendingInvoices extends StatelessWidget {
  const CardPendingInvoices({
    super.key,
    required this.invoice,
  });

  final InvoiceModel invoice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.push(ClientDashboard(
          typeInvoice: '',
          invoiceModel: invoice,
        ));
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
                    invoice.name_regoin_invoice.toString(),
                    fontSize: 18,
                    color: AppColors.primaryColor,
                  ),
                  AppText(
                    invoice.dateCreate.toString(),
                    fontSize: 18,
                    color: AppColors.primaryColor,
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
        ),
      ),
    );
  }
}
