import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/approvemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/notificationModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/client/clients.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/view_model/approve_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/notify_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class cardapprove1 extends StatelessWidget {
  cardapprove1({Key? key, required this.itemapprove}) : super(key: key);
  late InvoiceModel itemapprove;

  late UserModel current ;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    current = Provider.of<user_vm_provider>(context).currentUser;
    return
      Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
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
          onTap: (){//pushReplacement
            Navigator.push(context,
                MaterialPageRoute(builder:
                    (context) =>
                        client_dashboard(
                           invoiceModel: itemapprove,)));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            //height: 70,//MediaQuery.of(context).size.height*0.15,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            itemapprove.name_regoin.toString(),
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: kfontfamily2,
                                color: kMainColor),
                          ),
                          Text(
                            itemapprove.dateCreate.toString(),
                            style: TextStyle(
                                fontSize: 12,
                               // fontWeight: FontWeight.bold,
                                fontFamily: kfontfamily2,
                                color: kMainColor),
                          ),
                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            itemapprove.name_enterprise.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: kfontfamily2,
                         ),
                          ),
                          // Text(
                          //   itemapprove.nameUser.toString(),
                          //   style: TextStyle(fontFamily: kfontfamily2),
                          // ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   //crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     ElevatedButton(
                      //         style: ButtonStyle(
                      //             backgroundColor:
                      //                 MaterialStateProperty.all(kMainColor)),
                      //         onPressed: () async{
                      //           bool result = await showDialog(
                      //             context: context,
                      //             builder: (context) {
                      //               return AlertDialog(
                      //                 title: Text(''),
                      //                 content: Text('تأكيد العملية'),
                      //                 actions: <Widget>[
                      //                   new ElevatedButton(
                      //                     style: ButtonStyle(
                      //                         backgroundColor: MaterialStateProperty.all(
                      //                             kMainColor)),
                      //                     onPressed: () {
                      //                       Navigator.of(context,
                      //                           rootNavigator: true)
                      //                           .pop(
                      //                           false); // dismisses only the dialog and returns false
                      //                     },
                      //                     child: Text('لا'),
                      //                   ),
                      //                   ElevatedButton(
                      //                     style: ButtonStyle(
                      //                         backgroundColor: MaterialStateProperty.all(
                      //                             kMainColor)),
                      //                     onPressed: () async {
                      //                       Provider.of<client_vm>(context, listen: false)
                      //                           .setApproveclient_vm({
                      //                         'idApproveClient':itemapprove.idApproveClient,
                      //                         "fk_user":itemapprove.fkUser,//صاحب العميل
                      //                         "fk_regoin":itemapprove.fk_regoin,
                      //                         "regoin":itemapprove.nameRegoin,
                      //                         "fk_country":itemapprove.fk_country,
                      //                         "isApprove": "1",
                      //                         'fk_invoice':itemapprove.fk_invoice,
                      //                         "name_enterprise":itemapprove.name_enterprise,
                      //                         "fkusername":itemapprove.nameUser, //موظف المبيعات
                      //                         //"message":"",//
                      //                         "nameuserApproved":current.nameUser,
                      //                         "iduser_approve": current.idUser//معتمد الاشتراك
                      //                       }, itemapprove.fkClient).then((value) => value!=false?
                      //                       Provider.of<approve_vm>(context,listen: false)
                      //                           .removeApproveClient(itemapprove.idApproveClient)
                      //                           :  _scaffoldKey.currentState!.showSnackBar(
                      //                           SnackBar(content: Text('هناك مشكلة ما')))
                      //                       );
                      //                       Navigator.of(context,
                      //                           rootNavigator: true)
                      //                           .pop(true);
                      //                     },
                      //                     child: Text('نعم'),
                      //                   ),
                      //                 ],
                      //               );
                      //             },
                      //           );
                      //           // update client to approved client
                      //
                      //         },
                      //         child: Text('Approve')),
                      //     SizedBox(
                      //       width: 4,
                      //     ),
                      //     ElevatedButton(
                      //         style: ButtonStyle(
                      //             backgroundColor: MaterialStateProperty.all(
                      //                 Colors.redAccent)),
                      //         onPressed: () async{
                      //           bool result = await showDialog(
                      //             context: context,
                      //             builder: (context) {
                      //               return AlertDialog(
                      //                 title: Text(''),
                      //                 content: Text('تأكيد العملية'),
                      //                 actions: <Widget>[
                      //                   new ElevatedButton(
                      //                     style: ButtonStyle(
                      //                         backgroundColor: MaterialStateProperty.all(
                      //                             kMainColor)),
                      //                     onPressed: () {
                      //                       Navigator.of(context,
                      //                           rootNavigator: true)
                      //                           .pop(
                      //                           false); // dismisses only the dialog and returns false
                      //                     },
                      //                     child: Text('لا'),
                      //                   ),
                      //                   ElevatedButton(
                      //                     style: ButtonStyle(
                      //                         backgroundColor: MaterialStateProperty.all(
                      //                             kMainColor)),
                      //                     onPressed: () async {
                      //                       Provider.of<client_vm>(context, listen: false)
                      //                           .setApproveclient_vm({
                      //                         'idApproveClient':itemapprove.idApproveClient,
                      //                         "fk_user":itemapprove.fkUser,
                      //                         "fk_regoin":itemapprove.fk_regoin,
                      //                         "regoin":itemapprove.nameRegoin,
                      //                         "fk_country":itemapprove.fk_country,
                      //                         "isApprove": "0",
                      //                         "name_enterprise":itemapprove.name_enterprise,
                      //                         "fkusername":itemapprove.nameUser, //موظف المبيعات
                      //                         //"message":"",//
                      //                         "nameuserApproved":current.nameUser,
                      //                         "iduser_approve": current.idUser//معتمد الاشتراك
                      //                       }, itemapprove.fkClient)
                      //                           .then((value) =>
                      //                       value!=false?
                      //                       Provider.of<approve_vm>(context,listen: false)
                      //                           .removeApproveClient(itemapprove.idApproveClient)
                      //                           :   _scaffoldKey.currentState!.showSnackBar(
                      //                           SnackBar(content: Text('هناك مشكلة ما'))
                      //                       )
                      //                       );
                      //                       Navigator.of(context,
                      //                           rootNavigator: true)
                      //                           .pop(true);
                      //                     },
                      //                     child: Text('نعم'),
                      //                   ),
                      //                 ],
                      //               );
                      //             },
                      //           );
                      //           //send notification
                      //
                      //         },
                      //         child: Text('Refuse')),
                      //   ],
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    //});
  }
}
