import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/clientmodel.dart';
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

import '../../../function_global.dart';

class cardClientnew extends StatelessWidget {
  cardClientnew(
      { Key? key,
        required this.iduser,
        required this.itemClient}) : super(key: key);
  ClientModel itemClient;
  String iduser;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.only(bottomRight: Radius.circular(30)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 8.0,
            color: Colors.black87.withOpacity(0.2),
          ),
        ],
        color: Colors.white30,
      ),

      child: Center(
        child: InkWell(
          //splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    ProfileClient(
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
              color: Colors.white,
              borderRadius: BorderRadius.all( Radius.circular(5)),),
            //height: 125,//MediaQuery.of(context).size.height*0.15,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(itemClient.typeClient.toString(),
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,

                            fontFamily: kfontfamily2,color: kMainColor),),
                      itemClient.dateCreate==null?
                      Text(''):
                      Text(   itemClient.dateCreate.toString(),
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,

                            fontFamily: kfontfamily2,color: kMainColor),),

                    ],
                  ),
                  //SizedBox(height:2,),
                  Row(
                   //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                   children: [
                   itemClient.nameEnterprise.toString().length > 45 ?
                   Text('''
${itemClient.nameEnterprise.toString().substring(0, 45)}
${itemClient.nameEnterprise.toString().substring(45,itemClient.nameEnterprise.toString().length)}
                          ''',  style: TextStyle(
                       fontFamily: kfontfamily2,
                   fontWeight: FontWeight.bold))
                       :Text(itemClient.nameEnterprise.toString(),  style: TextStyle(
                       fontFamily: kfontfamily2,fontWeight: FontWeight.bold)),

                 ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemClient.name_regoin.toString(),
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,

                            color: kMainColor,
                            fontFamily: kfontfamily2),),

                      itemClient.total_paid!=null?
                      Text(' المتبقي ' +
                        itemClient.total_paid.toString(),
                        style: TextStyle(
                          color: kMainColor,
                            fontSize: 11,                             fontWeight: FontWeight.bold,

                            fontFamily: kfontfamily2),)
                          : Text(
                        '' ,
                        style: TextStyle(
                            color: kMainColor,
                            fontSize: 11,                             fontWeight: FontWeight.bold,

                            fontFamily: kfontfamily2),),

                      Text(
                          getnameshort(itemClient.nameUser.toString())
                       ,
                        style: TextStyle(
                            fontSize: 11,

                            color: kMainColor,
                             fontWeight: FontWeight.bold,
                            fontFamily: kfontfamily2 ),),

                    ],
                  ),

                ],),
            ),
          ),
        ),),
    );
    //});
  }
}
