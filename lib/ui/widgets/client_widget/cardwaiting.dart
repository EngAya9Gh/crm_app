//cardWaiting
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardWaiting extends StatelessWidget {
  cardWaiting(
      { Key? key,
        required this.iteminvoice}) : super(key: key);

  InvoiceModel iteminvoice;

  @override
  Widget build(BuildContext context) {
    //العملاء المشتركين
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(0)
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 8.0,
            color: Colors.black87.withOpacity(0.2),
          ),
        ],
        color:  Colors.white30,
      ),
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) =>
                    ProfileClient(
                        tabIndex:3, //move to tab support in profile client
                        idClient:
                        iteminvoice.fkIdClient.toString())
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color:Colors.white,

            ),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        iteminvoice.date_approve.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: kfontfamily2,color: kMainColor),),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(iteminvoice.name_enterprise.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: kfontfamily2),),
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
