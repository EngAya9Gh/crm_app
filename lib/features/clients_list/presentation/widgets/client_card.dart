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

import '../../../../view_model/privilge_vm.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../pages/action_client_page.dart';

class CardClient extends StatelessWidget {
  CardClient({Key? key, required this.clientModel}) : super(key: key);
  final ClientsListResponse clientModel;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(clientModel.idClients),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.35,
        children: [
          SlidableAction(
            onPressed: (actionContext) async {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ActionClientPage(client: clientModel),
                  ));
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
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ProfileClient(idClient: clientModel.idClients.toString()),
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
                        clientModel.nameEnterprise.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2),
                      ),
                    ),
                    if ((clientModel.tag ?? false) && context.read<PrivilegeCubit>().checkPrivilege('133'))
                      Icon(
                        CupertinoIcons.checkmark_seal_fill,
                        color: Colors.amber,
                      )
                  ],
                ),
                Text(
                  DateTime.tryParse(clientModel.dateCreate!) != null
                      ? intl.DateFormat("dd MMMM yyyy, hh:mm a").format(DateTime.parse(clientModel.dateCreate!))
                      : clientModel.dateCreate.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2, color: kMainColor),
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
