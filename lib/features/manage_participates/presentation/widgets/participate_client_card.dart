
import 'package:crm_smart/constants.dart';
import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../ui/screen/client/profileclient.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../data/models/participate_client_model.dart';


class ParticipateClientCard extends StatefulWidget {
  ParticipateClientCard({Key? key, required this.client}) : super(key: key);
 final ParticipateClientModel client;
  @override
  State<ParticipateClientCard> createState() => _ParticipateClientCardState();
}

class _ParticipateClientCardState extends State<ParticipateClientCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: () {
         Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ProfileClient(idClient: widget.client.idClients.toString()),
              ));

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
                 if ((widget.client.tag ?? false) && context.read<PrivilegeCubit>().checkPrivilege('133'))
                   Icon(
                     CupertinoIcons.checkmark_seal_fill,
                     color: Colors.amber,
                   )
               ],
             ),
             if(widget.client.datePrice!=null)
             Text( // 1001 comment  because dateCreate not defined 
               DateTime.tryParse(widget.client.dateCreate!) != null
                   ? intl.DateFormat("dd MMMM yyyy, hh:mm a").format(DateTime.parse(widget.client.dateCreate!))
                   : widget.client.dateCreate.toString(),
               style: TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2, color: kMainColor),
               textDirection: TextDirection.ltr,
             ),
           ],
         ),
       ),
     ),
      );
  }
}
