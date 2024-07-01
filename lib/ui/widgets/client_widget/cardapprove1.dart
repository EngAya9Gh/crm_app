import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../../model/invoiceModel.dart';
import '../../../model/usermodel.dart';
import '../../screen/client/clients.dart';
import '../../../view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class cardapprove1 extends StatelessWidget {
  cardapprove1({Key? key, required this.itemapprove, required this.type})
      : super(key: key);
  late InvoiceModel itemapprove;
  String type;
  late UserModel current;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    current = Provider.of<UserProvider>(context).currentUser;
    return Container(
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
          onTap: () {
            //pushReplacement
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => client_dashboard(
                          typeinvoice: type,
                          invoiceModel: itemapprove,
                        )));
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            type == 'f'
                                ? itemapprove.name_regoin_invoice.toString()
                                : itemapprove.name_regoin_invoice.toString(),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            itemapprove.name_enterprise.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontFamily: kfontfamily2,
                            ),
                          ),
                          itemapprove.cancel_approvment!=null?
                          itemapprove.cancel_approvment.toString()=='1'?
                          Icon(
                           Icons.access_time_filled_rounded,
                            color: Colors.amber,
                            size: 17.sp,
                          ):Container()
                          :Container()

                        ],
                      ),

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
