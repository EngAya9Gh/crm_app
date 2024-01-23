import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../pages/action_client_page.dart';

class CardClient extends StatefulWidget {
  CardClient({Key? key, required this.clientModel, required this.isSwitch})
      : super(key: key);
  ClientModel clientModel;
  final bool isSwitch;

  @override
  State<CardClient> createState() => _CardClientState();
}

class _CardClientState extends State<CardClient> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.isSwitch,
      child: Slidable(
        key: ValueKey(widget.clientModel.idClients),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.35,
          children: [
            SlidableAction(
              onPressed: widget.isSwitch
                  ? null
                  : (actionContext) async {
                      ClientModel clientModel = await Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              ActionClientPage(client: widget.clientModel),
                        ),
                      );
                      setState(() {
                        widget.clientModel = clientModel;
                      });
                    },
              backgroundColor: context.colorScheme.primaryContainer,
              foregroundColor: Colors.white,
              icon: Icons.edit_rounded,
              label: 'تعديل',
            ),
          ],
        ),
        child: InkWell(
          onTap: widget.isSwitch
              ? null
              : () {
                  // context.read<UserProvider>().changeClientClassificationTypeStatus(clientModel.type_classification!=null?clientModel.type_classification!:"");
                  // context.read<UserProvider>().changeClientRegistrationTypeStatus(clientModel.type_record!=null?clientModel.type_record!:"");

                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ProfileClient(
                            idClient: widget.clientModel.idClients.toString()),
                      ));
                },
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
                      if ((widget.clientModel.tag ?? false) &&
                          context.read<PrivilegeCubit>().checkPrivilege('133'))
                        Icon(
                          CupertinoIcons.checkmark_seal_fill,
                          color: Colors.amber,
                        )
                    ],
                  ),
                  Text(
                    DateTime.tryParse(widget.clientModel.dateCreate!) != null
                        ? intl.DateFormat("dd MMMM yyyy, hh:mm a").format(
                            DateTime.parse(widget.clientModel.dateCreate!))
                        : widget.clientModel.dateCreate.toString(),
                    textAlign:
                        widget.isSwitch ? TextAlign.left : TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: kfontfamily2,
                        color: kMainColor),
                    textDirection: TextDirection.ltr,
                  ),
                  if (widget.isSwitch == true)
                    SizedBox(
                      height: 10,
                    ),
                  if (widget.isSwitch == true)
                    Row(
                      children: [
                        Text(
                          widget.clientModel.nameCity ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: kfontfamily2,
                              color: kMainColor),
                          textDirection: TextDirection.ltr,
                        ),
                        Spacer(),
                        Text(
                          widget.clientModel.nameRegion ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: kfontfamily2,
                              color: kMainColor),
                          textDirection: TextDirection.ltr,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
