import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_status_chip.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/widgets/Card_invoice_client.dart';
import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../pages/deleted_invoice_details_page.dart';

class CardDeletedInvoice extends StatelessWidget {
  const CardDeletedInvoice({
    super.key,
    required this.card,
    this.colorCodes = const [400, 400, 75],
  });

  final InvoiceModel card;
  final List<int> colorCodes;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppCardContainer(
        onTap: () => AppNavigator.push(
          DeletedInvoiceDetailsPage(invoice: card),
          extra: {'invoice': card},
          name: AppRoutesNames.invoices.deletedInvoiceDetailsPage,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    Icons.delete,
                    color: Colors.grey.shade400,
                    size: 20,
                  ),
                  Expanded(
                    child: AppText(
                      "محذوفة",
                      fontFamily: AppFonts.fontFamily2,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  AppText(
                    card.date_approve != null
                        ? card.date_approve.toString()
                        : card.dateCreate.toString(),
                    fontFamily: AppFonts.fontFamily2,
                    color: AppColors.primaryColor,
                    fontSize: 16,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (card.idInvoice != null)
                    AppText(
                      "${card.idInvoice}#  ",
                      fontFamily: AppFonts.fontFamily2,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor,
                    ),
                  if (card.address_invoice != null) ...[
                    Expanded(
                      child: card.address_invoice == null
                          ? SizedBox()
                          : AppText(
                              card.address_invoice,
                              fontFamily: AppFonts.fontFamily2,
                              fontWeight: FontWeight.bold,
                            ),
                    ),
                  ],
                  prepareStatus(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'الإجمالي',
                        style: TextStyle(
                            fontFamily: AppFonts.fontFamily2,
                            color: AppColors.primaryColor,
                            fontSize: 12),
                      ),
                      SizedBox(width: 4),
                      AppText(
                        card.total,
                        fontFamily: AppFonts.fontFamily2,
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                      AppText(
                        HelperFunctions.getCurrencyName(card.currency_name),
                        fontFamily: AppFonts.fontFamily2,
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AppText(
                        'المتبقي',
                        fontFamily: AppFonts.fontFamily2,
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                      SizedBox(width: 4),
                      if (card.total != null && card.amountPaid != null)
                        AppText(
                          ((num.tryParse(card.total?.toString() ?? '0') ?? 0) -
                                  (num.tryParse(
                                          card.amountPaid?.toString() ?? '0') ??
                                      0))
                              .toStringAsFixed(2),
                          fontFamily: AppFonts.fontFamily2,
                          color: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                      AppText(
                        HelperFunctions.getCurrencyName(card.currency_name),
                        fontFamily: AppFonts.fontFamily2,
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppText(
                        'المدفوع',
                        fontFamily: AppFonts.fontFamily2,
                        color: AppColors.primaryColor,
                        fontSize: 14,
                      ),
                      SizedBox(width: 4),
                      AppText(
                        (card.amountPaid.toString()),
                        fontFamily: AppFonts.fontFamily2,
                        color: AppColors.primaryColor,
                        fontSize: 14,
                      ),
                      AppText(
                        HelperFunctions.getCurrencyName(card.currency_name),
                        fontFamily: AppFonts.fontFamily2,
                        color: AppColors.primaryColor,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(
                        'التجديد السنوي',
                        fontFamily: AppFonts.fontFamily2,
                        color: AppColors.primaryColor,
                        fontSize: 14,
                      ),
                      SizedBox(width: 4),
                      AppText(
                        card.renewYear.toString(),
                        fontFamily: AppFonts.fontFamily2,
                        color: AppColors.primaryColor,
                        fontSize: 14,
                      ),
                      AppText(
                        HelperFunctions.getCurrencyName(card.currency_name),
                        fontFamily: AppFonts.fontFamily2,
                        color: AppColors.primaryColor,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget prepareStatus() {
    if (card.isApprove == '1' && card.stateclient == 'مشترك') {
      return AppStatusChip(
        status: StatusClient.subscriber.text,
        color: StatusClient.subscriber.color,
      );
    }
    if (card.isApprove != '1' && card.stateclient == 'مشترك') {
      return AppStatusChip(
        status: StatusClient.unsupported.text,
        color: StatusClient.unsupported.color,
      );
    }
    if (card.stateclient == 'منسحب') {
      return AppStatusChip(
        status: StatusClient.withdrawn.text,
        color: StatusClient.withdrawn.color,
      );
    }
    return SizedBox.shrink();
  }
}
