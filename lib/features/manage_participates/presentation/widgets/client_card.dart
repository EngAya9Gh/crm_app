
import 'package:crm_smart/constants.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import '../../data/models/participate_client_model.dart';


class ClientCard extends StatefulWidget {
  ClientCard({Key? key, required this.client}) : super(key: key);
  ParticipateClientModel client;

  @override
  State<ClientCard> createState() => _ClientCardState();
}

class _ClientCardState extends State<ClientCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: () {

     },
     child:
     Container(
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(10).r,
         boxShadow: <BoxShadow>[
           BoxShadow(
             offset: Offset(1.0, 1.0),
             blurRadius: 8.0,
             color: Colors.black87.withOpacity(0.1),
           ),
         ],
       ),
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Expanded(
                   child: Text(
                     widget.client.nameEnterprise.toString(),
                     style: TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2),
                   ),
                 ),
                 // 1001 comment if and icon because tag not defined 
                //  if ((widget.clientModel.tag ?? false) && context.read<PrivilegeCubit>().checkPrivilege('133'))
                //    Icon(
                //      CupertinoIcons.checkmark_seal_fill,
                //      color: Colors.amber,
                //    )
               ],
             ),
            //  if(widget.client.datePrice!=null)
            //  Text( // 1001 comment  because dateCreate not defined 
            //    DateTime.tryParse(widget.client.dateCreate!) != null
            //        ? intl.DateFormat("dd MMMM yyyy, hh:mm a").format(DateTime.parse(widget.client.dateCreate!))
            //        : widget.client.dateCreate.toString(),
            //    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2, color: kMainColor),
            //    textDirection: TextDirection.ltr,
            //  ),
           ],
         ),
       ),
     ),
      );
  }
}
