
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/ui/screen/client/detail_client.dart';
import 'package:crm_smart/ui/screen/client/editClient.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/invoice/addInvoice.dart';
import 'package:crm_smart/ui/screen/invoice/invoces.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custom_button_new.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class cardAccept extends StatelessWidget {
  cardAccept(
      { Key? key,
        // required this.iduser,
        required this.itemClient}) : super(key: key);
  ClientModel itemClient;
  //InvoiceModel iteminvoice;
  //String iduser;

  @override
  Widget build(BuildContext context) {
    //العملاء المشتركين
    return
      Container(

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
                MaterialPageRoute(builder: (context) =>
                    ProfileClient(
                       // tabindex:2, //move to tab support in profile client
                        idclient:
                        itemClient.idClients.toString())
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //       iteminvoice.date_approve.toString(),
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontFamily: kfontfamily2,color: kMainColor),),
                  //   ],
                  // ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(itemClient.nameEnterprise.toString(),
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
