import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_status_chip.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../../core/common/helpers/number_formatter.dart';
import '../../../../../../core/common/models/profile_invoice_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../app/presentation/widgets/app_text.dart';

enum StatusClient { subscriber, withdrawn, unsupported }

extension StatusClientExt on StatusClient {
  String get text {
    switch (this) {
      case StatusClient.subscriber:
        return "مشترك";
      case StatusClient.withdrawn:
        return "منسحب";
      case StatusClient.unsupported:
        return "غير معتمد بعد";
    }
  }

  Color get color {
    switch (this) {
      case StatusClient.subscriber:
        return Colors.lightGreen;
      case StatusClient.withdrawn:
        return Colors.redAccent;
      case StatusClient.unsupported:
        return Colors.orangeAccent;
    }
  }
}

class ParticipateInvoiceCard extends StatefulWidget {
  ParticipateInvoiceCard({
    required this.type,
    required this.invoice,
    required this.openInvoice,
    this.isFromWithdrawalsInvoicesList = false,
    Key? key,
  }) : super(key: key);
  final ProfileInvoiceModel invoice;
  final String type;
  final isFromWithdrawalsInvoicesList;
  final void Function(String id) openInvoice;

  @override
  _ParticipateInvoiceCardState createState() => _ParticipateInvoiceCardState();
}

class _ParticipateInvoiceCardState extends State<ParticipateInvoiceCard> {
  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () => widget.openInvoice(widget.invoice.idInvoice.toString()),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      widget.invoice.nameRegoin.toString(),
                      fontFamily: AppFonts.fontFamily1,
                      color: AppColors.primaryMain,
                      fontSize: 16,
                    ),
                    AppText(
                      widget.invoice.dateApprove != null
                          ? widget.invoice.dateApprove.toString()
                          : widget.invoice.dateCreate.toString(),
                      fontFamily: AppFonts.fontFamily1,
                      color: AppColors.primaryMain,
                      fontSize: 16,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget.invoice.idInvoice != null)
                      AppText(
                        "${widget.invoice.idInvoice}#  ",
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryMain,
                      ),
                    if (widget.invoice.addressInvoice != null)
                      Expanded(
                        child: AppText(
                          widget.invoice.addressInvoice.toString(),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    else
                      Spacer(),
                    if (widget.invoice.isApprove == '1' &&
                        widget.invoice.stateclient == 'مشترك')
                      AppStatusChip(
                        status: StatusClient.subscriber.text,
                        color: AppColors.green,
                      )
                    else if (widget.invoice.isApprove != '1' &&
                        widget.invoice.stateclient == 'مشترك')
                      AppStatusChip(
                        status: StatusClient.unsupported.text,
                        color: AppColors.green,
                      )
                    else if (widget.invoice.stateclient == 'منسحب')
                      AppStatusChip(
                        status: StatusClient.withdrawn.text,
                        color: AppColors.green,
                      )
                    else
                      SizedBox.shrink(),
                  ],
                ),
                SizedBox(height: 3),
                if (widget.invoice.nameClient != null)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "اسم المؤسسة: ",
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryMain,
                      ),
                      Expanded(
                        child: AppText(
                          "${widget.invoice.nameClient.toString()}",
                          maxLines: 3,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget.invoice.total != null)
                      Row(
                        children: [
                          AppText(
                            'الإجمالي',
                            color: AppColors.primaryMain,
                            fontSize: 6,
                          ),
                          SizedBox(width: 4),
                          AppText(
                            formatNumber(
                                num.tryParse(widget.invoice.total ?? '0') ?? 0),
                            color: AppColors.primaryMain,
                            fontSize: 16,
                          ),
                          AppText(
                            HelperFunctions.getCurrencyName(
                                widget.invoice.currencyName),
                            color: AppColors.primaryMain,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    if (widget.invoice.total != null &&
                        widget.invoice.amountPaid != null)
                      Row(
                        children: [
                          AppText(
                            'المتبقي',
                            color: AppColors.primaryMain,
                            fontSize: 16,
                          ),
                          SizedBox(width: 4),
                          if (widget.invoice.total != null &&
                              widget.invoice.amountPaid != null)
                            AppText(
                              formatNumber(((num.tryParse(
                                          widget.invoice.total?.toString() ??
                                              '0') ??
                                      0) -
                                  (num.tryParse(widget.invoice.amountPaid
                                              ?.toString() ??
                                          '0') ??
                                      0))),
                              color: AppColors.primaryMain,
                              fontSize: 16,
                            ),
                          AppText(
                            HelperFunctions.getCurrencyName(
                                widget.invoice.currencyName),
                            color: AppColors.primaryMain,
                            fontSize: 16,
                          ),
                        ],
                      ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget.invoice.amountPaid != null)
                      Row(
                        children: [
                          AppText(
                            'المدفوع',
                            color: AppColors.primaryMain,
                            fontSize: 16,
                          ),
                          SizedBox(width: 4),
                          AppText(
                            formatNumber(num.tryParse(
                                    widget.invoice.amountPaid ?? '0') ??
                                0),
                            color: AppColors.primaryMain,
                            fontSize: 16,
                          ),
                          AppText(
                            HelperFunctions.getCurrencyName(
                                widget.invoice.currencyName),
                            color: AppColors.primaryMain,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    if (widget.invoice.renewYear != null)
                      Row(
                        children: [
                          AppText(
                            'التجديد السنوي',
                            color: AppColors.primaryMain,
                            fontSize: 16,
                          ),
                          SizedBox(width: 4),
                          AppText(
                            formatNumber(
                                num.tryParse(widget.invoice.renewYear ?? '0') ??
                                    0),
                            color: AppColors.primaryMain,
                            fontSize: 16,
                          ),
                          AppText(
                            HelperFunctions.getCurrencyName(
                                widget.invoice.currencyName),
                            color: AppColors.primaryMain,
                            fontSize: 16,
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
