import 'package:crm_smart/constants.dart';
import 'package:crm_smart/helper/number_formatter.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/models/profile_invoice_model.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void dispose() {
    super.dispose();
    // BlocListener?.cancelSubscription(); // Assuming you have a reference to the subscription
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: _scaffoldKey,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: InkWell(
          onTap: () => widget.openInvoice(widget.invoice.idInvoice.toString()),
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
                              widget.invoice.nameRegoin.toString(),
                              style: TextStyle(
                                  fontFamily: kfontfamily,
                                  color: kMainColor,
                                  fontSize: 12),
                            ),
                            Text(
                              widget.invoice.dateApprove != null
                                  ? widget.invoice.dateApprove.toString()
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
                            if (widget.invoice.addressInvoice != null)
                              Expanded(
                                child: Text(
                                  widget.invoice.addressInvoice.toString(),
                                  style: TextStyle(
                                      fontFamily: kfontfamily2,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            else
                              Spacer(),
                            if (widget.invoice.isApprove == '1' &&
                                widget.invoice.stateclient == 'مشترك')
                              statusClientChip(StatusClient.subscriber)
                            else if (widget.invoice.isApprove != '1' &&
                                widget.invoice.stateclient == 'مشترك')
                              statusClientChip(StatusClient.unsupported)
                            else if (widget.invoice.stateclient == 'منسحب')
                              statusClientChip(StatusClient.withdrawn)
                            else
                              SizedBox.shrink(),
                          ],
                        ),
                        SizedBox(height: 3),
                        if (widget.invoice.nameClient != null)
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
                                  "${widget.invoice.nameClient.toString()}",
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
                            if (widget.invoice.total != null)
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
                                    widget.invoice.currencyName == null
                                        ? 'ريال'
                                        : int.parse(widget.invoice.currencyName
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
                            if (widget.invoice.total != null &&
                                widget.invoice.amountPaid != null)
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
                                          (num.tryParse(widget
                                                      .invoice.amountPaid
                                                      ?.toString() ??
                                                  '0') ??
                                              0))),
                                      style: TextStyle(
                                          fontFamily: kfontfamily2,
                                          color: kMainColor,
                                          fontSize: 12),
                                    ),
                                  Text(
                                    widget.invoice.currencyName == null
                                        ? 'ريال'
                                        : int.parse(widget.invoice.currencyName
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
                            if (widget.invoice.amountPaid != null)
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
                                    widget.invoice.currencyName == null
                                        ? 'ريال'
                                        : int.parse(widget.invoice.currencyName
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
                            if (widget.invoice.renewYear != null)
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
                                    widget.invoice.currencyName == null
                                        ? 'ريال'
                                        : int.parse(widget.invoice.currencyName
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
                      ],
                    ),
                  ),
                ),
                // if (widget.invoice.approveBackDone != null && widget.isFromWithdrawalsInvoicesList)
                //   Container(
                //     width: double.infinity,
                //     height: 30,
                //     decoration: BoxDecoration(
                //       color: WithdrawalStatus.values[int.parse(widget.invoice.approveBackDone!)].color,
                //       boxShadow: <BoxShadow>[
                //         BoxShadow(
                //           offset: Offset(1.0, 1.0),
                //           blurRadius: 8.0,
                //           color: Colors.black87.withOpacity(0.2),
                //         ),
                //       ],
                //       borderRadius:
                //           BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                //     ),
                //     child: Center(
                //         child: Text(
                //       WithdrawalStatus.values[int.parse(widget.invoice.approveBackDone!)].text,
                //       style: context.textTheme.titleSmall!.copyWith(color: Colors.white, fontFamily: kfontfamily2),
                //     )),
                //   ),
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
