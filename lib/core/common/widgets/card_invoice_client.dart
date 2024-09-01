import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/mangement/manage_withdrawals/presentation/pages/withdrawn_details_page.dart';
import '../../../model/invoiceModel.dart';
import '../../../ui/screen/client/client_profile.dart';
import '../../../ui/screen/invoice/invoiceView.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../enums/withdrawal_status_enum.dart';
import '../helpers/helper_functions.dart';
import '../helpers/number_formatter.dart';
import 'app_status_chip.dart';

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
        return AppColors.secondaryColor;
      case StatusClient.withdrawn:
        return Colors.redAccent;
      case StatusClient.unsupported:
        return Colors.orangeAccent;
    }
  }
}

class CardInvoiceClient extends StatefulWidget {
  const CardInvoiceClient({
    super.key,
    required this.type,
    required this.invoice,
    this.isFromWithdrawalsInvoicesList = false,
  });

  final InvoiceModel invoice;
  final String type;
  final bool isFromWithdrawalsInvoicesList;

  @override
  State<CardInvoiceClient> createState() => _CardInvoiceClientState();
}

class _CardInvoiceClientState extends State<CardInvoiceClient> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) {
                  if (widget.invoice.stateclient ==
                      StatusClient.withdrawn.text) {
                    return WithdrawnDetailsPage(invoice: widget.invoice);
                  }
                  return widget.type == 'profile'
                      ? ClientProfile(
                          tabIndex: 1,
                          idClient: widget.invoice.fkIdClient.toString())
                      : widget.type == 'withdrawn'
                          ? WithdrawnDetailsPage(invoice: widget.invoice)
                          : InvoiceView(invoice: widget.invoice);
                },
              ),
            );
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 8.0,
                        color: Colors.black87.withOpacity(0.2),
                      ),
                    ],
                    borderRadius: widget.invoice.approveBackDone != null &&
                            widget.isFromWithdrawalsInvoicesList
                        ? BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )
                        : BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              widget.invoice.name_regoin_invoice.toString(),
                              color: AppColors.primaryColor,
                              fontSize: 16,
                            ),
                            AppText(
                              _prepareDate(),
                              color: AppColors.primaryColor,
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
                                fontFamily: AppFonts.fontFamily2,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryColor,
                              ),
                            widget.invoice.address_invoice == null
                                ? Spacer()
                                : Expanded(
                                    child: AppText(
                                      widget.invoice.address_invoice.toString(),
                                      fontSize: 18,
                                      fontFamily: AppFonts.fontFamily2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            _prepareStatusWidget(StatusClient.subscriber),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "اسم المؤسسة: ",
                              fontSize: 18,
                              fontFamily: AppFonts.fontFamily2,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                            Expanded(
                              child: AppText(
                                "${widget.invoice.name_enterprise.toString()}",
                                maxLines: 3,
                                fontSize: 18,
                                fontFamily: AppFonts.fontFamily2,
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
                            Row(
                              children: [
                                AppText(
                                  'الإجمالي',
                                  fontSize: 14,
                                  fontFamily: AppFonts.fontFamily2,
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(width: 4),
                                AppText(
                                  _handleNum(widget.invoice.total),
                                  fontSize: 14,
                                  fontFamily: AppFonts.fontFamily2,
                                  color: AppColors.primaryColor,
                                ),
                                AppText(
                                  HelperFunctions.getCurrencyName(
                                      widget.invoice.currency_name),
                                  fontFamily: AppFonts.fontFamily2,
                                  color: AppColors.primaryColor,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AppText(
                                  'المتبقي',
                                  fontFamily: AppFonts.fontFamily2,
                                  color: AppColors.primaryColor,
                                  fontSize: 14,
                                ),
                                SizedBox(width: 4),
                                if (widget.invoice.total != null &&
                                    widget.invoice.amountPaid != null)
                                  AppText(
                                    _handleRemaining(),
                                    fontFamily: AppFonts.fontFamily2,
                                    color: AppColors.primaryColor,
                                    fontSize: 14,
                                  ),
                                AppText(
                                  HelperFunctions.getCurrencyName(
                                      widget.invoice.currency_name),
                                  fontFamily: AppFonts.fontFamily2,
                                  color: AppColors.primaryColor,
                                  fontSize: 14,
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
                                  formatNumber(num.tryParse(
                                          widget.invoice.amountPaid ?? '0') ??
                                      0),
                                  fontFamily: AppFonts.fontFamily2,
                                  color: AppColors.primaryColor,
                                  fontSize: 14,
                                ),
                                AppText(
                                  HelperFunctions.getCurrencyName(
                                      widget.invoice.currency_name),
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
                                  formatNumber(num.tryParse(
                                          widget.invoice.renewYear ?? '0') ??
                                      0),
                                  fontFamily: AppFonts.fontFamily2,
                                  color: AppColors.primaryColor,
                                  fontSize: 14,
                                ),
                                AppText(
                                  HelperFunctions.getCurrencyName(
                                      widget.invoice.currency_name),
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
                if (widget.invoice.approveBackDone != null &&
                    widget.isFromWithdrawalsInvoicesList)
                  Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      color: WithdrawalStatus
                          .values[int.parse(widget.invoice.approveBackDone!)]
                          .color,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 8.0,
                          color: Colors.black87.withOpacity(0.2),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Center(
                        child: AppText(
                      WithdrawalStatus
                          .values[int.parse(widget.invoice.approveBackDone!)]
                          .text,
                      color: Colors.white,
                      fontFamily: AppFonts.fontFamily2,
                      fontSize: 18,
                    )),
                  ),
              ],
            ),
          ),
        ),
        //  ),
      ),
    );
  }

  String _handleRemaining() {
    final num1 = num.tryParse(widget.invoice.total?.toString() ?? '0') ?? 0;
    final num2 =
        num.tryParse(widget.invoice.amountPaid?.toString() ?? '0') ?? 0;
    final result = num1 - num2;
    return _handleNum(result.toString());
  }

  String _handleNum(String? value) {
    return formatNumber(num.tryParse(value ?? '0') ?? 0);
  }

  String _prepareDate() {
    return widget.invoice.date_approve != null
        ? widget.invoice.date_approve.toString()
        : widget.invoice.dateCreate.toString();
  }

  Widget _prepareStatusWidget(StatusClient statusClient) {
    if (widget.invoice.isApprove == '1' &&
        widget.invoice.stateclient == StatusClient.subscriber.text) {
      return AppStatusChip(
        status: StatusClient.subscriber.text,
        color: StatusClient.subscriber.color,
      );
    }
    if (widget.invoice.isApprove != '1' &&
        widget.invoice.stateclient == StatusClient.unsupported.text) {
      return AppStatusChip(
        status: StatusClient.unsupported.text,
        color: StatusClient.unsupported.color,
      );
    }
    if (widget.invoice.stateclient == StatusClient.withdrawn.text) {
      return AppStatusChip(
        status: StatusClient.withdrawn.text,
        color: StatusClient.withdrawn.color,
      );
    }
    return SizedBox.shrink();
  }
}
