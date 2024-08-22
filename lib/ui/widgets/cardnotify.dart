import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../core/config/app_dynamic_links.dart';
import '../../core/utils/app_colors.dart';
import '../../model/notificationModel.dart';

class cardnotify extends StatelessWidget {
  cardnotify({Key? key, required this.itemNotify}) : super(key: key);
  late NotificationModel itemNotify;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: itemNotify.isread==0?Colors.black12: Colors.white30,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(0)),
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
            // ApproveRequest,Transfer,Late,ApproveDone,ApproveRefuse,InvoiceDeleted
            AppDynamicLinks.routeNotifyTo(
                itemNotify.typeNotify, context, null, itemNotify.data);
          },
          child: Container(
            decoration: BoxDecoration(
              color: itemNotify.isread == 0 ? Colors.black12 : Colors.white,

              //borderRadius: BorderRadius.all( Radius.circular(5)),
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
                        itemNotify.dateNotify,
                        style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontFamily: kfontfamily2,
                            color: AppColors.kMainColor),
                      ),
                    ],
                  ),

                  // Row(
                  //   children: [
                  //     Container(
                  //
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.all(Radius.circular(15)),
                  //         boxShadow: <BoxShadow>[
                  //           BoxShadow(
                  //             offset: Offset(1.0, 1.0),
                  //             blurRadius: 8.0,
                  //             color: Colors.black87.withOpacity(0.2),
                  //           ),
                  //         ],
                  //         color: AppColors.kMainColor,
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(top: 3,bottom: 3, left:6,right: 6),
                  //         child: Text(showtext(itemNotify.typeNotify),style:
                  //         TextStyle(
                  //           color: AppColors.kWhiteColor,
                  //             //fontWeight: FontWeight.bold,
                  //             fontFamily: kfontfamily3),
                  //
                  //     ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            itemNotify.message,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: kfontfamily2),
                          ),
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
