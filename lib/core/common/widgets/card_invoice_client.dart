import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/mangement/manage_withdrawals/presentation/pages/withdrawn_details_page.dart';
import '../../../features/sales/deleted_invoices/presentation/pages/deleted_invoice_details_page.dart';
import '../../../features/sales/invoices_list/presentation/widgets/invoice_status_widget.dart';
import '../../../model/invoiceModel.dart';
import '../../../ui/screen/client/client_profile.dart';
import '../../../ui/screen/invoice/invoiceView.dart';
import '../../config/navigator/app_routes_names.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../enums/withdrawal_status_enum.dart';
import '../helpers/helper_functions.dart';
import '../helpers/number_formatter.dart';

enum StatusClient { subscriber, withdrawn, unsupported, restrictWithdrawn }

extension StatusClientExt on StatusClient {
  String get text {
    switch (this) {
      case StatusClient.subscriber:
        return "مشترك";
      case StatusClient.withdrawn:
        return "منسحب";
      case StatusClient.unsupported:
        return "غير معتمد بعد";
      case StatusClient.restrictWithdrawn:
        return "منسحب مقيد";
    }
  }

  Color get color {
    switch (this) {
      case StatusClient.subscriber:
        return Colors.green;
      case StatusClient.withdrawn:
        return Colors.redAccent;
      case StatusClient.unsupported:
        return Colors.orangeAccent;
      case StatusClient.restrictWithdrawn:
        return AppColors.secondaryMain;
    }
  }
}

class CardInvoiceClient extends StatefulWidget {
  final InvoiceModel invoice;
  final String type;
  final bool isFromWithdrawalsInvoicesList;
  final String routeName;
  final Widget? transferWidget;
  final Widget? commissionWidget;

  CardInvoiceClient({
    super.key,
    required this.type,
    required this.invoice,
    this.isFromWithdrawalsInvoicesList = false,
    this.routeName = '',
    this.transferWidget,
    this.commissionWidget,
  });

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
            if (widget.invoice.isDeleted!) {
              AppNavigator.push(
                DeletedInvoiceDetailsPage(invoice: widget.invoice),
                extra: {'invoice': widget.invoice},
                name: AppRoutesNames.invoices.deletedInvoiceDetailsPage,
              );
              return;
            }
            Widget _preparePage() {
              if (widget.invoice.stateclient == StatusClient.withdrawn.text) {
                return WithdrawnDetailsPage(invoice: widget.invoice);
              }
              if (widget.type == 'profile') {
                return ClientProfile(
                  tabIndex: 1,
                  idClient: widget.invoice.fkIdClient.toString(),
                );
              }
              if (widget.type == 'withdrawn') {
                return WithdrawnDetailsPage(invoice: widget.invoice);
              }

              return InvoiceView(
                invoice: widget.invoice,
                invoiceId: widget.invoice.idInvoice!,
              );
            }

            if (widget.routeName.isNotEmpty) {
              AppNavigator.go(
                _preparePage(),
                name: widget.routeName,
                pathParameters: {
                  'idClient': widget.invoice.fkIdClient.toString(),
                  'invoiceId': widget.invoice.idInvoice.toString(),
                },
                extra: {
                  'tabIndex': 1,
                  'invoice': widget.invoice,
                },
              );
              return;
            }

            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => _preparePage(),
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
                    borderRadius: widget.invoice.approveBackDone != null && widget.isFromWithdrawalsInvoicesList
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
                              color: AppColors.primaryMain,
                              fontSize: 16,
                            ),
                            AppText(
                              _prepareDate(),
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
                                fontFamily: AppFonts.fontFamily1,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryMain,
                              ),
                            widget.invoice.address_invoice == null
                                ? Spacer()
                                : Expanded(
                                    child: AppText(
                                      widget.invoice.address_invoice.toString(),
                                      fontSize: 16,
                                      fontFamily: AppFonts.fontFamily1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            prepareStatusWidget(
                              isDeleted: widget.invoice.isDeleted,
                              isApprove: widget.invoice.isApprove,
                              stateclient: widget.invoice.stateclient,
                              isApproveBackDone: (widget.invoice.approveBackDone != null) ? int.parse(widget.invoice.approveBackDone!) == 0 : null,
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "اسم المؤسسة: ",
                              fontSize: 16,
                              fontFamily: AppFonts.fontFamily1,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryMain,
                            ),
                            Expanded(
                              child: AppText(
                                "${widget.invoice.name_enterprise.toString()}",
                                maxLines: 3,
                                fontSize: 16,
                                fontFamily: AppFonts.fontFamily1,
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
                                  fontFamily: AppFonts.fontFamily1,
                                  color: AppColors.primaryMain,
                                ),
                                SizedBox(width: 4),
                                AppText(
                                  _handleNum(widget.invoice.total),
                                  fontSize: 14,
                                  fontFamily: AppFonts.fontFamily1,
                                  color: AppColors.primaryMain,
                                ),
                                AppText(
                                  HelperFunctions.getCurrencyName(widget.invoice.currency_name),
                                  fontFamily: AppFonts.fontFamily1,
                                  color: AppColors.primaryMain,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AppText(
                                  'المتبقي',
                                  fontFamily: AppFonts.fontFamily1,
                                  color: AppColors.primaryMain,
                                  fontSize: 14,
                                ),
                                SizedBox(width: 4),
                                if (widget.invoice.total != null && widget.invoice.amountPaid != null)
                                  AppText(
                                    _handleRemaining(),
                                    fontFamily: AppFonts.fontFamily1,
                                    color: AppColors.primaryMain,
                                    fontSize: 14,
                                  ),
                                AppText(
                                  HelperFunctions.getCurrencyName(widget.invoice.currency_name),
                                  fontFamily: AppFonts.fontFamily1,
                                  color: AppColors.primaryMain,
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
                                  fontFamily: AppFonts.fontFamily1,
                                  color: AppColors.primaryMain,
                                  fontSize: 14,
                                ),
                                SizedBox(width: 4),
                                AppText(
                                  formatNumber(num.tryParse(widget.invoice.amountPaid ?? '0') ?? 0),
                                  fontFamily: AppFonts.fontFamily1,
                                  color: AppColors.primaryMain,
                                  fontSize: 14,
                                ),
                                AppText(
                                  HelperFunctions.getCurrencyName(widget.invoice.currency_name),
                                  fontFamily: AppFonts.fontFamily1,
                                  color: AppColors.primaryMain,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppText(
                                  'التجديد السنوي',
                                  fontFamily: AppFonts.fontFamily1,
                                  color: AppColors.primaryMain,
                                  fontSize: 14,
                                ),
                                SizedBox(width: 4),
                                AppText(
                                  formatNumber(num.tryParse(widget.invoice.renewYear ?? '0') ?? 0),
                                  fontFamily: AppFonts.fontFamily1,
                                  color: AppColors.primaryMain,
                                  fontSize: 14,
                                ),
                                AppText(
                                  HelperFunctions.getCurrencyName(widget.invoice.currency_name),
                                  fontFamily: AppFonts.fontFamily1,
                                  color: AppColors.primaryMain,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (widget.transferWidget != null && (widget.invoice.dateLastOperation?.isNotEmpty ?? false)) ...{
                          5.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                'تاريخ العملية',
                                fontFamily: AppFonts.fontFamily1,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              SizedBox(width: 4),
                              AppText(
                                "(${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(widget.invoice.dateLastOperation!))})",
                                fontFamily: AppFonts.fontFamily1,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        },
                        if (widget.invoice.lastOperation != null && widget.invoice.userDidOperation != null) ...{
                          5.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: AppText(
                                  (widget.invoice.lastOperation!) + "  (${widget.invoice.userDidOperation})",
                                  fontFamily: AppFonts.fontFamily1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              widget.transferWidget ?? SizedBox.shrink(),
                            ],
                          ),
                        },
                        widget.commissionWidget ?? SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
                if (widget.invoice.approveBackDone != null && widget.isFromWithdrawalsInvoicesList)
                  Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      color: WithdrawalStatus.values[int.parse(widget.invoice.approveBackDone!)].color,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 8.0,
                          color: Colors.black87.withOpacity(0.2),
                        ),
                      ],
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                    ),
                    child: Center(
                        child: AppText(
                      WithdrawalStatus.values[int.parse(widget.invoice.approveBackDone!)].text,
                      color: Colors.white,
                      fontFamily: AppFonts.fontFamily1,
                      fontSize: 16,
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
    final num2 = num.tryParse(widget.invoice.amountPaid?.toString() ?? '0') ?? 0;
    final result = num1 - num2;
    return _handleNum(result.toString());
  }

  String _handleNum(String? value) {
    return formatNumber(num.tryParse(value ?? '0') ?? 0);
  }

  String _prepareDate() {
    return widget.invoice.date_approve != null ? widget.invoice.date_approve.toString() : widget.invoice.dateCreate.toString();
  }
}
//
// Widget prepareStatusWidget({
//   required bool isShowDeleted,
//   required bool? isDeleted,
//   required String? isApprove,
//   required String? stateclient,
// }) {
//   if (isShowDeleted && isDeleted == true) {
//     return AppStatusChip(
//       status: 'محذوف',
//       color: Colors.red,
//     );
//   }
//   if (isApprove == '1' && stateclient == StatusClient.subscriber.text) {
//     return AppStatusChip(
//       status: StatusClient.subscriber.text,
//       color: StatusClient.subscriber.color,
//     );
//   }
//   if (isApprove != '1' && stateclient == StatusClient.unsupported.text) {
//     return AppStatusChip(
//       status: StatusClient.unsupported.text,
//       color: StatusClient.unsupported.color,
//     );
//   }
//   if (stateclient == StatusClient.withdrawn.text) {
//     return AppStatusChip(
//       status: StatusClient.withdrawn.text,
//       color: StatusClient.withdrawn.color,
//     );
//   }
//   return SizedBox.shrink();
// }
