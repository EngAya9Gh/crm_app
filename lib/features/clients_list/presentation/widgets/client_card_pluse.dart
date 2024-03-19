import 'package:crm_smart/constants.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';

class CardClient_pluse extends StatefulWidget {
  CardClient_pluse({Key? key, required this.clientModel}) : super(key: key);
  ClientModel clientModel;

  @override
  State<CardClient_pluse> createState() => _CardClient_pluseState();
}

class _CardClient_pluseState extends State<CardClient_pluse> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
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
                      widget.clientModel.nameEnterprise.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: kfontfamily2),
                    ),
                  ),
                  Text(
                    widget.clientModel.typeClient.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: kfontfamily2),
                  ),
                  if ((widget.clientModel.tag ?? false) &&
                      context.read<PrivilegeCubit>().checkPrivilege('133'))
                    Icon(
                      CupertinoIcons.checkmark_seal_fill,
                      color: Colors.amber,
                    )
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.clientModel.nameCity.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: kfontfamily2),
                  ),
                  Expanded(
                    child: Text(
                      DateTime.tryParse(widget.clientModel.dateCreate!) != null
                          ? intl.DateFormat("dd MMMM yyyy, hh:mm a").format(
                              DateTime.parse(widget.clientModel.dateCreate!))
                          : widget.clientModel.dateCreate.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: kfontfamily2,
                          color: kMainColor),
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.clientModel.nameRegion.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: kfontfamily2),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      widget.clientModel.activityTypeTitle == null
                          ? ''
                          : widget.clientModel.activityTypeTitle.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: kfontfamily2),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
