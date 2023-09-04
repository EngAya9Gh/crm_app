

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/invoiceModel.dart';
import '../../screen/invoice/invoiceView.dart';
import '../../screen/invoice/view_delete.dart';
import 'Card_invoice_client.dart';

class card_deleted extends StatelessWidget {
  card_deleted({required this.card, Key? key}) : super(key: key);
  InvoiceModel card;
  final List<int> colorCodes = <int>[400, 400, 75];

  @override
  Widget build(BuildContext context) {

    return Container(
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) =>
                    view_deleted(
                         invoice: card),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.delete,size: 15,color: Colors.grey.shade400),
                      Text(
                        "محذوفة",
                        style: TextStyle(fontFamily: kfontfamily2, color: Colors.redAccent,fontWeight: FontWeight.w700, fontSize: 12),
                      ),
                    ],
                  ),
                  Text(
                    card.date_approve != null
                        ? card.date_approve.toString()
                        : card.dateCreate.toString(),
                    style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if(card.idInvoice != null)
                    Text(
                      "${card.idInvoice}#  ",
                      style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold,color: Ktoast),
                    ),
                  if (card.address_invoice != null)
                    Expanded(
                      child: Text(
                        card.address_invoice.toString(),
                        style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.bold),
                      ),
                    )
                  else
                    Spacer(),
                  if (card.isApprove == '1' && card.stateclient == 'مشترك')
                    statusClientChip(StatusClient.subscriber)
                  else if (card.isApprove != '1' && card.stateclient == 'مشترك')
                    statusClientChip(StatusClient.unsupported)
                  else if (card.stateclient == 'منسحب')
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
                        card.total.toString(),
                        style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                      ),
                      Text(
                        card.currency_name == null
                            ? 'ريال'
                            : int.parse(card.currency_name.toString()) == 0
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
                      if (card.total != null && card.amountPaid != null)
                        Text(
                          ((num.tryParse(card.total?.toString() ?? '0') ?? 0) -
                              (num.tryParse(card.amountPaid?.toString() ?? '0') ?? 0))
                              .toStringAsFixed(2),
                          style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                        ),
                      Text(
                        card.currency_name == null
                            ? 'ريال'
                            : int.parse(card.currency_name.toString()) == 0
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
                        (card.amountPaid.toString()),
                        style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                      ),
                      Text(
                        card.currency_name == null
                            ? 'ريال'
                            : int.parse(card.currency_name.toString()) == 0
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
                        card.renewYear.toString(),
                        style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                      ),
                      Text(
                        card.currency_name == null
                            ? 'ريال'
                            : int.parse(card.currency_name.toString()) == 0
                            ? ' USD '
                            : ' ريال ',
                        style: TextStyle(fontFamily: kfontfamily2, color: kMainColor, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              // Text(
              //     card.name_enterprise.toString(),style: TextStyle(color: Colors.black54)
              // ),
              // //SizedBox(width: 4,),
              // Text(
              //     card.date_delete.toString(),style: TextStyle(color: Colors.black54),
              // ),
              // //SizedBox(width: 4,),
              // Text(
              //     card.nameUser.toString(),style: TextStyle(color: Colors.black54)
              // ),
            ],
          ),
        ),
      ),
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
