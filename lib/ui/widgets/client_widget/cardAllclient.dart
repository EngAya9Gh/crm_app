import 'package:crm_smart/core/common/models/client_model.dart' as cl;
import 'package:crm_smart/ui/screen/client/profile_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart' as intl;

import '../../../core/common/models/client_model.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import '../../../core/utils/extensions/build_context.dart';
import '../../../features/sales/clients/clients_list/presentation/pages/client_add_edit_page.dart';
import '../../../view_model/client_vm.dart';

class CardAllClient extends StatelessWidget {
  CardAllClient({Key? key, required this.clientModel}) : super(key: key);
  final ClientModel clientModel;

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
              final client = cl.ClientModel(
                NameReason_reject: clientModel.NameReason_reject,
                date_price: clientModel.date_price,
                date_changetype: clientModel.date_changetype,
                offer_price: clientModel.offer_price,
                location: clientModel.location,
                email: clientModel.email,
                typeClient: clientModel.typeClient,
                isApprove: clientModel.isApprove,
                fkUser: clientModel.fkUser,
                fkcountry: clientModel.fkcountry,
                activityTypeFk: clientModel.NameReason_reject,
                activity_type_title: clientModel.activity_type_title,
                address_client: clientModel.address_client,
                amountPaid: clientModel.amountPaid,
                city: clientModel.city,
                dateCreate: clientModel.dateCreate,
                dateTransfer: clientModel.dateTransfer,
                date_visit_Client: clientModel.date_visit_Client,
                fkRejectClient: clientModel.fkRejectClient,
                descActivController: clientModel.descActivController,
                fkRegoin: clientModel.fkRegoin,
                fkClientSource: clientModel.fkClientSource,
                idClients: clientModel.idClients,
                fkusertrasfer: clientModel.fkusertrasfer,
                ismarketing: clientModel.ismarketing,
                idMainCity: clientModel.idMainCity,
                mobile: clientModel.mobile,
                mobileuser: clientModel.mobileuser,
                nameAdduser: clientModel.nameAdduser,
                name_city: clientModel.name_city,
                nameClient: clientModel.nameClient,
                NameClient_recomand: clientModel.NameClient_recomand,
                nameCountry: clientModel.nameCountry,
                nameEnterprise: clientModel.nameEnterprise,
                namemaincity: clientModel.namemaincity,
                nameRegion: clientModel.nameRegion,
                nameUser: clientModel.nameUser,
                nameuserdoning: clientModel.nameuserdoning,
                nameusertransfer: clientModel.nameusertransfer,
                phone: clientModel.phone,
                presystem: clientModel.presystem,
                presystemtitle: clientModel.presystemtitle,
                reasonChange: clientModel.reasonChange,
                nameTransferTo: clientModel.nameTransferTo,
                transferTo: clientModel.transferTo,
                size_activity: clientModel.size_activity,
                sourcclient: clientModel.sourcclient,
                tag: clientModel.tag,
                total: clientModel.total,
                total_paid: clientModel.total_paid,
                typeJob: clientModel.typeJob,
                userAdd: clientModel.userAdd,
                user_do: clientModel.user_do,
              );

              final cl.ClientModel? result = await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ClientAddEditPage(client: client),
                  ));

              if (result != null) {
                final clientConvert = ClientModel(
                  NameReason_reject: result.NameReason_reject,
                  date_price: result.date_price,
                  date_changetype: result.date_changetype,
                  offer_price: result.offer_price,
                  location: result.location,
                  email: result.email,
                  typeClient: result.typeClient,
                  isApprove: result.isApprove,
                  fkUser: result.fkUser,
                  fkcountry: result.fkcountry,
                  activityTypeFk: result.activityTypeFk,
                  activity_type_title: result.activity_type_title,
                  address_client: result.address_client,
                  amountPaid: result.amountPaid,
                  city: result.city,
                  dateCreate: result.dateCreate,
                  dateTransfer: result.dateTransfer,
                  date_visit_Client: result.date_visit_Client,
                  fkRejectClient: result.fkRejectClient,
                  descActivController: result.descActivController,
                  fkRegoin: result.fkRegoin,
                  fkClientSource: result.fkClientSource,
                  idClients: result.idClients,
                  fkusertrasfer: result.fkusertrasfer,
                  ismarketing: result.ismarketing,
                  idMainCity: result.idMainCity,
                  mobile: result.mobile,
                  mobileuser: result.mobileuser,
                  nameAdduser: result.nameAdduser,
                  name_city: result.name_city,
                  nameClient: result.nameClient,
                  NameClient_recomand: result.NameClient_recomand,
                  nameCountry: result.nameCountry,
                  nameEnterprise: result.nameEnterprise,
                  namemaincity: result.namemaincity,
                  nameRegion: result.nameRegion,
                  nameUser: result.nameUser,
                  nameuserdoning: result.nameuserdoning,
                  nameusertransfer: result.nameusertransfer,
                  phone: result.phone,
                  presystem: result.presystem,
                  presystemtitle: result.presystemtitle,
                  reasonChange: result.reasonChange,
                  nameTransferTo: result.nameTransferTo,
                  transferTo: result.transferTo,
                  size_activity: result.size_activity,
                  sourcclient: result.sourcclient,
                  tag: result.tag,
                  total: result.total,
                  total_paid: result.total_paid,
                  typeJob: result.typeJob,
                  userAdd: result.userAdd,
                  user_do: result.user_do,
                );

                context
                    .read<ClientProvider>()
                    .onUpdateListsMarketing(clientConvert);
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
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) =>
                    ProfileClient(idClient: clientModel.idClients.toString()),
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
                Text(
                  DateTime.tryParse(clientModel.dateCreate!) != null
                      ? intl.DateFormat("dd MMMM yyyy, hh:mm a")
                          .format(DateTime.parse(clientModel.dateCreate!))
                      : clientModel.dateCreate.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.fontFamily2,
                      color: AppColors.kMainColor),
                  textDirection: TextDirection.ltr,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          clientModel.nameEnterprise.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFonts.fontFamily2),
                        ),
                      ),
                      if (clientModel.tag ?? false)
                        Icon(
                          CupertinoIcons.checkmark_seal_fill,
                          color: Colors.amber,
                        )
                    ]),
                //Row(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
