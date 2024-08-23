import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../features/sales/clients/client_dashboard.dart';
import '../../../model/invoiceModel.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/user_vm_provider.dart';

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
                    builder: (context) => ClientDashboard(
                          typeInvoice: type,
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
                                fontFamily: AppFonts.fontFamily2,
                                color: AppColors.primaryColor),
                          ),
                          Text(
                            itemapprove.dateCreate.toString(),
                            style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                fontFamily: AppFonts.fontFamily2,
                                color: AppColors.primaryColor),
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
                              fontFamily: AppFonts.fontFamily2,
                            ),
                          ),
                          itemapprove.cancel_approvment != null
                              ? itemapprove.cancel_approvment.toString() == '1'
                                  ? Icon(
                                      Icons.access_time_filled_rounded,
                                      color: Colors.amber,
                                      size: 17.sp,
                                    )
                                  : Container()
                              : Container()
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
