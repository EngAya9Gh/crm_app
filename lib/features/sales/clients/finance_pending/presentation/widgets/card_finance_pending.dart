import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../constants.dart';
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
    return InkWell(
      onTap: () {
        AppNavigator.push(ClientDashboard(
          typeInvoice: 'f',
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
                    style: context.textTheme.titleSmall?.copyWith(
                      color: kMainColor,
                    ),
                  ),
                  AppText(
                    invoice.dateCreate.toString(),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: kMainColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    invoice.name_enterprise.toString(),
                    style: context.textTheme.bodySmall,
                  ),
                  if (invoice.cancel_approvment?.toString() == '1')
                    Icon(
                      Icons.access_time_filled_rounded,
                      color: Colors.amber,
                      size: 17.sp,
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
