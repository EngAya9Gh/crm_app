import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../../core/utils/app_colors.dart';
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
        AppNavigator.push(
          ClientDashboard(
            typeInvoice: '',
            invoiceModel: invoice,
          ),
          name: AppRoutesNames.clientDashboard.inPendingInvoices,
          extra: {
            'invoiceModel': invoice,
            'typeInvoice': '',
          },
        );
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
                  Flexible(
                    child: AppText(
                      invoice.name_regoin_invoice,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  AppText(
                    invoice.dateCreate.toString(),
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AppText(
                      invoice.name_enterprise,
                    ),
                  ),
                  if (invoice.cancel_approvment?.toString() == '1')
                    AppIcon(
                      Icons.access_time_filled_rounded,
                      color: AppColors.secondaryColor,
                      size: 25,
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
