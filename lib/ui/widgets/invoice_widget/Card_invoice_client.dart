import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/invoice/invoiceView.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

enum StatusClient { subscriber, withdrawn, unsupported }

extension on StatusClient {
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
    required this.itemProd,
    Key? key,
  }) : super(key: key);
  final InvoiceModel itemProd;
  final String type;

  @override
  _CardInvoiceClientState createState() => _CardInvoiceClientState();
}

class _CardInvoiceClientState extends State<CardInvoiceClient> {
  late UserModel _currentUser;

  @override
  Widget build(BuildContext context) {
    _currentUser = Provider.of<user_vm_provider>(context, listen: true).currentUser;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => widget.type == 'profile'
                    ? ProfileClient(tabIndex: 1, idClient: widget.itemProd.fkIdClient.toString())
                    : InvoiceView(invoice: widget.itemProd),
              ),
            );
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
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
                borderRadius: BorderRadius.all(Radius.circular(10)),
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
                          widget.itemProd.name_regoin_invoice.toString(),
                          style: TextStyle(fontFamily: kfontfamily, color: kMainColor, fontSize: 12),
                        ),
                        Text(
                          widget.itemProd.date_approve != null
                              ? widget.itemProd.date_approve.toString()
                              : widget.itemProd.dateCreate.toString(),
                          style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.itemProd.address_invoice != null)
                          Expanded(
                            child: Text(
                              widget.itemProd.address_invoice.toString(),
                              style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                            ),
                          )
                        else
                          Spacer(),
                        if (widget.itemProd.isApprove == '1' && widget.itemProd.stateclient == 'مشترك')
                          statusClientChip(StatusClient.subscriber)
                        else if (widget.itemProd.isApprove != '1' && widget.itemProd.stateclient == 'مشترك')
                          statusClientChip(StatusClient.unsupported)
                        else if (widget.itemProd.stateclient == 'منسحب')
                          statusClientChip(StatusClient.withdrawn)
                        else
                          SizedBox.shrink(),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'الإجمالي',
                              style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                            ),
                            SizedBox(width: 4),
                            Text(
                              widget.itemProd.total.toString(),
                              style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                            ),
                            Text(
                              widget.itemProd.currency_name == null
                                  ? 'ريال'
                                  : int.parse(widget.itemProd.currency_name.toString()) == 0
                                      ? ' USD '
                                      : ' ريال ',
                              style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'المتبقي',
                              style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                            ),
                            SizedBox(width: 4),
                            if (widget.itemProd.total != null && widget.itemProd.amountPaid != null)
                              Text(
                                ((num.tryParse(widget.itemProd.total?.toString() ?? '0') ?? 0) -
                                        (num.tryParse(widget.itemProd.amountPaid?.toString() ?? '0') ?? 0))
                                    .toStringAsFixed(2),
                                style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                              ),
                            Text(
                              widget.itemProd.currency_name == null
                                  ? 'ريال'
                                  : int.parse(widget.itemProd.currency_name.toString()) == 0
                                      ? ' USD '
                                      : ' ريال ',
                              style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
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
                              style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                            ),
                            SizedBox(width: 4),
                            Text(
                              (widget.itemProd.amountPaid.toString()),
                              style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                            ),
                            Text(
                              widget.itemProd.currency_name == null
                                  ? 'ريال'
                                  : int.parse(widget.itemProd.currency_name.toString()) == 0
                                      ? ' USD '
                                      : ' ريال ',
                              style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'التجديد السنوي',
                              style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                            ),
                            SizedBox(width: 4),
                            Text(
                              widget.itemProd.renewYear.toString(),
                              style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                            ),
                            Text(
                              widget.itemProd.currency_name == null
                                  ? 'ريال'
                                  : int.parse(widget.itemProd.currency_name.toString()) == 0
                                      ? ' USD '
                                      : ' ريال ',
                              style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
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
                    //             MaterialPageRoute(
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
          ),
        ),
        //  ),
      ),
    );
  }

  Widget statusClientChip(StatusClient statusClient) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(color: statusClient.color, borderRadius: BorderRadius.circular(10)),
      child: Text(
        statusClient.text,
        style: TextStyle(fontFamily: kfontfamily, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
