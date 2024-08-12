import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../../constants.dart';
import '../../../../../../core/common/enums/client/subscribing_intention_level_enum.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/utils/extensions/build_context.dart';
import '../../../../../../ui/screen/client/profileclient.dart';
import '../../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../pages/client_add_edit_page.dart';

class CardClient extends StatefulWidget {
  CardClient({Key? key, required this.clientModel}) : super(key: key);
  ClientModel clientModel;

  @override
  State<CardClient> createState() => _CardClientState();
}

class _CardClientState extends State<CardClient> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.clientModel.idClients),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.35,
        children: [
          SlidableAction(
            onPressed: (actionContext) async {
              ClientModel? clientModel = await Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) =>
                      ClientAddEditPage(client: widget.clientModel),
                ),
              );
              if (clientModel != null) {
                setState(() {
                  widget.clientModel = clientModel;
                });
              }
            },
            backgroundColor: context.colorScheme.primaryContainer,
            foregroundColor: Colors.white,
            icon: Icons.edit_rounded,
            label: 'تعديل',
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
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
                  children: [
                    Expanded(
                      child: Text(
                        widget.clientModel.nameEnterprise.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: kfontfamily2,
                        ),
                      ),
                    ),
                    Text(
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
                    if ((widget.clientModel.tag ?? false) &&
                        context
                            .read<PrivilegeCubit>()
                            .checkPrivilege('133')) ...[
                      SizedBox(width: 10),
                      Icon(
                        CupertinoIcons.checkmark_seal_fill,
                        color: Colors.amber,
                      )
                    ],
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: kfontfamily2,
                      ),
                    ),
                    // Text(
                    //   "${widget.clientModel.subscribingIntentionLevel ??
                    //       SubscribingIntentionLevelEnum.normal.name}",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontFamily: kfontfamily2,
                    //   ),
                    // ),
                    widget.clientModel.subscribingIntentionLevel != null
                        ? Icon(
                            Icons.flag,
                            color: widget
                                .clientModel.subscribingIntentionLevel?.color,
                            size: 20.sp,
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
