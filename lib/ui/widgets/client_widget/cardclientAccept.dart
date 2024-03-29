import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardClientAccept extends StatelessWidget {
  cardClientAccept(
      { Key? key,
       // required this.iduser,
        required this.iteminvoice}) : super(key: key);
  //ClientModel itemClient;
  InvoiceModel iteminvoice;
  //String iduser;

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
                        idClient:
                        iteminvoice.fkIdClient.toString())
                  //   editclient(
                  // itemClient: itemClient,
                  // fkclient: itemClient.idClients.toString(),
                  // fkuser: itemClient.fkUser.toString(),)
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color:Colors.white,

            ),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
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
                  //Row(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
