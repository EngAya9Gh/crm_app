

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:flutter/material.dart';

class card_deleted extends StatelessWidget {
  card_deleted({required this.card, Key? key}) : super(key: key);
  DeletedinvoiceModel card;
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
        child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    card.nameEnterprise.toString(),style: TextStyle(color: kWhiteColor)
                ),
                SizedBox(width: 4,),
                Text(
                    card.dateDelete.toString(),style: TextStyle(color: kWhiteColor),
                ),
                SizedBox(width: 4,),
                Text(
                    card.nameUser.toString(),style: TextStyle(color: kWhiteColor)
                ),
              ],
            )),
      ),
    ),
  );
  }
}
