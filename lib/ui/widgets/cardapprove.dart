

import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/approvemodel.dart';
import 'package:crm_smart/model/notificationModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardapprove extends StatelessWidget {
  cardapprove({Key? key, required this.itemapprove}) : super(key: key);
  late ApproveModel itemapprove;
  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          textDirection: TextDirection.rtl,
          direction: Axis.vertical,
          children: [
           Column(
            children: [
              Row(
                children: [
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
                      color: kMainColor,
                    ),

                    child: Text(itemapprove.name_enterprise,
                    //   style:
                    // TextStyle(color: kWhiteColor,
                    //     fontWeight: FontWeight.bold,
                    //     fontFamily: kfontfamily2,fontSize: 30),
                    ),
                  ),
                  Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(itemapprove.nameUser,
                          // style: TextStyle(
                          //   fontFamily: kfontfamily2),
                        ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           ElevatedButton(style: ButtonStyle(
                               backgroundColor: MaterialStateProperty
                                   .all(kMainColor)),
                               onPressed: () {},
                               child: Text('Approve')),
                           SizedBox(width: 4,),
                           ElevatedButton(style: ButtonStyle(
                               backgroundColor: MaterialStateProperty
                                   .all(Colors.redAccent)),
                               onPressed: () {},
                               child: Text('Refuse',style:
                               TextStyle(color: kWhiteColor),)),
                         ],
                       )
                        // Text(itemapprove,style: TextStyle(fontFamily: kfontfamily2),),
                      ]),
                ],
              ),
              Row(),
            ],
          ),
        ]),
      ),
    );
  }
}
