import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/manage_withdrawals/presentation/utils/withdrawal_status.dart';
import 'package:crm_smart/helper/number_formatter.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/invoice/invoiceView.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../features/manage_withdrawals/presentation/pages/withdrawn_details_page.dart';

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

class CardInvoiceClient extends StatefulWidget {
  CardInvoiceClient({
    required this.type,
    required this.invoice,
    this.isFromWithdrawalsInvoicesList = false,
    Key? key,
  }) : super(key: key);
  final InvoiceModel invoice;
  final String type;
  final isFromWithdrawalsInvoicesList;

  @override
  _CardInvoiceClientState createState() => _CardInvoiceClientState();
}

class _CardInvoiceClientState extends State<CardInvoiceClient> {
  late UserModel _currentUser;

  @override
  Widget build(BuildContext context) {
    _currentUser = Provider.of<UserProvider>(context, listen: true).currentUser;
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
                      ? ProfileClient(
                          tabIndex: 1,
                          idClient: widget.invoice.fkIdClient.toString(),
                        )
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
                            Text(
                              widget.invoice.name_regoin_invoice.toString(),
                              style: TextStyle(
                                  fontFamily: kfontfamily,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                            Text(
                              widget.invoice.date_approve != null
                                  ? widget.invoice.date_approve.toString()
                                  : widget.invoice.dateCreate.toString(),
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (widget.invoice.idInvoice != null)
                              Text(
                                "${widget.invoice.idInvoice}#  ",
                                style: TextStyle(
                                    fontFamily: kfontfamily2,
                                    fontWeight: FontWeight.bold,
                                    color: Ktoast),
                              ),
                            if (widget.invoice.address_invoice != null)
                              Expanded(
                                child: Text(
                                  widget.invoice.address_invoice.toString(),
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            else
                              Spacer(),
                            if (widget.invoice.isApprove == '1' &&
                                widget.invoice.stateclient ==
                                    StatusClient.subscriber.text)
                              statusClientChip(StatusClient.subscriber)
                            else if (widget.invoice.isApprove != '1' &&
                                widget.invoice.stateclient ==
                                    StatusClient.unsupported.text)
                              statusClientChip(StatusClient.unsupported)
                            else if (widget.invoice.stateclient ==
                                StatusClient.withdrawn.text)
                              statusClientChip(StatusClient.withdrawn)
                            else
                              SizedBox.shrink(),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "اسم المؤسسة: ",
                              style: TextStyle(
                                  fontFamily: kfontfamily2,
                                  fontWeight: FontWeight.bold,
                                  color: kMainColor),
                            ),
                            Expanded(
                              child: Text(
                                "${widget.invoice.name_enterprise.toString()}",
                                maxLines: 3,
                                style: TextStyle(
                                    fontFamily: kfontfamily2,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
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
                                Text(
                                  'الإجمالي',
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      color: kMainColor,
                                      fontSize: 12),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  formatNumber(num.tryParse(
                                          widget.invoice.total ?? '0') ??
                                      0),
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      color: kMainColor,
                                      fontSize: 12),
                                ),
                                Text(
                                  widget.invoice.currency_name == null
                                      ? 'ريال'
                                      : int.parse(widget.invoice.currency_name
                                                  .toString()) ==
                                              0
                                          ? ' USD '
                                          : ' ريال ',
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      color: kMainColor,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'المتبقي',
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      color: kMainColor,
                                      fontSize: 12),
                                ),
                                SizedBox(width: 4),
                                if (widget.invoice.total != null &&
                                    widget.invoice.amountPaid != null)
                                  Text(
                                    formatNumber(((num.tryParse(widget
                                                    .invoice.total
                                                    ?.toString() ??
                                                '0') ??
                                            0) -
                                        (num.tryParse(widget.invoice.amountPaid
                                                    ?.toString() ??
                                                '0') ??
                                            0))),
                                    style: TextStyle(
                                        fontFamily: kfontfamily2,
                                        color: kMainColor,
                                        fontSize: 12),
                                  ),
                                Text(
                                  widget.invoice.currency_name == null
                                      ? 'ريال'
                                      : int.parse(widget.invoice.currency_name
                                                  .toString()) ==
                                              0
                                          ? ' USD '
                                          : ' ريال ',
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      color: kMainColor,
                                      fontSize: 12),
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
                                Text(
                                  'المدفوع',
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      color: kMainColor,
                                      fontSize: 12),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  formatNumber(num.tryParse(
                                          widget.invoice.amountPaid ?? '0') ??
                                      0),
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      color: kMainColor,
                                      fontSize: 12),
                                ),
                                Text(
                                  widget.invoice.currency_name == null
                                      ? 'ريال'
                                      : int.parse(widget.invoice.currency_name
                                                  .toString()) ==
                                              0
                                          ? ' USD '
                                          : ' ريال ',
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      color: kMainColor,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'التجديد السنوي',
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      color: kMainColor,
                                      fontSize: 12),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  formatNumber(num.tryParse(
                                          widget.invoice.renewYear ?? '0') ??
                                      0),
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      color: kMainColor,
                                      fontSize: 12),
                                ),
                                Text(
                                  widget.invoice.currency_name == null
                                      ? 'ريال'
                                      : int.parse(widget.invoice.currency_name
                                                  .toString()) ==
                                              0
                                          ? ' USD '
                                          : ' ريال ',
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      color: kMainColor,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Row(

                        //   children: [
                        //     new IconButton(
                        //       icon: Icon(
                        //         Icons.edit,
                        //         color: kMainColor,
                        //       ),
                        //       onPressed: () {
                        //         Navigator.push(
                        //             context,
                        //             CupertinoPageRoute(
                        //                 builder: (context) => addinvoice(
                        //                       //edit invoice
                        //                       itemClient: widget.itemClient,
                        //                       // iduser: widget.itemProd.fkIdUser,
                        //                       // idClient: widget.itemProd.fkIdClient,
                        //                       invoice: widget.itemProd,
                        //                       // indexinvoice: widget.indexinvoice)
                        //                     )));
                        //       },
                        //       //onPressed: BOOKMARK,
                        //     ),

                        //   ],
                        // )
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
                        child: Text(
                      WithdrawalStatus
                          .values[int.parse(widget.invoice.approveBackDone!)]
                          .text,
                      style: context.textTheme.titleSmall!.copyWith(
                          color: Colors.white, fontFamily: kfontfamily2),
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

  Widget statusClientChip(StatusClient statusClient) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
          color: statusClient.color, borderRadius: BorderRadius.circular(10)),
      child: Text(
        statusClient.text,
        style: TextStyle(
            fontFamily: kfontfamily,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }
}
