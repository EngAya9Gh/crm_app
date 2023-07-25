

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:flutter/material.dart';

import '../../../model/invoiceModel.dart';
import '../../screen/invoice/invoiceView.dart';
import '../../screen/invoice/view_delete.dart';

class card_deleted extends StatelessWidget {
  card_deleted({required this.card, Key? key}) : super(key: key);
  InvoiceModel card;
  final List<int> colorCodes = <int>[400, 400, 75];

  @override
  Widget build(BuildContext context) {

    return Container(
    height: 50,
    color: Colors.amber[colorCodes[1]],
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    view_deleted(
                         invoice: card),
              ),
            );
          },
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        card.name_enterprise.toString(),style: TextStyle(color: kWhiteColor)
                    ),
                    //SizedBox(width: 4,),
                    Text(
                        card.date_delete.toString(),style: TextStyle(color: kWhiteColor),
                    ),
                    //SizedBox(width: 4,),
                    Text(
                        card.nameUser.toString(),style: TextStyle(color: kWhiteColor)
                    ),
                  ],
                ),
              )),
        ),
      ),
    ),
  );
  }
}
