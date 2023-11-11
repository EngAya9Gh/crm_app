import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart' as intl;
import 'package:crm_smart/features/clients_list/data/models/clients_list_response.dart' as cl;
import '../../../features/clients_list/presentation/pages/action_client_page.dart';
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
                nameReasonReject: clientModel.NameReason_reject,
                datePrice: clientModel.date_price,
                dateChangeType: clientModel.dateChangetype,
                offerPrice: clientModel.offer_price,
                location: clientModel.location,
                email: clientModel.email,
                typeClient: clientModel.typeClient,
                isApprove: clientModel.isApprove,
                fkUser: clientModel.fkUser,
                fkCountry: clientModel.fkcountry,
                activityTypeFk: clientModel.activity_type_fk,
                activityTypeTitle: clientModel.activity_type_title,
                addressClient: clientModel.address_client,
                amountPaid: clientModel.amount_paid,
                city: clientModel.city,
                dateCreate: clientModel.dateCreate,
                dateTransfer: clientModel.dateTransfer,
                dateVisitClient: clientModel.date_visit_Client,
                rejectId: clientModel.fk_rejectClient,
                descriptionActiveController: clientModel.descActivController,
                fkRegion: clientModel.fkRegoin,
                fkClientSource: clientModel.fk_client_source,
                idClients: clientModel.idClients,
                fkUserTrasfer: clientModel.fkusertrasfer,
                isMarketing: clientModel.ismarketing,
                idMainCity: clientModel.id_maincity,
                mobile: clientModel.mobile,
                mobileUser: clientModel.mobileuser,
                nameAdduser: clientModel.nameAdduser,
                nameCity: clientModel.name_city,
                nameClient: clientModel.nameClient,
                nameClientRecommend: clientModel.NameClient_recomand,
                nameCountry: clientModel.nameCountry,
                nameEnterprise: clientModel.nameEnterprise,
                nameMainCity: clientModel.namemaincity,
                nameRegion: clientModel.name_regoin,
                nameUser: clientModel.nameUser,
                nameUserDoing: clientModel.nameuserdoning,
                nameUserTransfer: clientModel.nameusertransfer,
                phone: clientModel.phone,
                preSystem: clientModel.presystem,
                preSystemTitle: clientModel.presystemtitle,
                reasonChange: clientModel.reasonChange,
                reasonTransfer: clientModel.reasonTransfer,
                sizeActivity: clientModel.size_activity,
                sourceClient: clientModel.sourcclient,
                tag: clientModel.tag,
                total: clientModel.total,
                totalPaid: clientModel.total_paid,
                typeJob: clientModel.typeJob,
                userAdd: clientModel.user_add,
                userDo: clientModel.user_do,
              );

              final cl.ClientModel? result = await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ActionClientPage(client: client),
                  ));

              if (result != null) {
                final clientConvert = ClientModel(
                  NameReason_reject: result.nameReasonReject,
                  date_price: result.datePrice,
                  dateChangetype: result.dateChangeType,
                  offer_price: result.offerPrice,
                  location: result.location,
                  email: result.email,
                  typeClient: result.typeClient,
                  isApprove: result.isApprove,
                  fkUser: result.fkUser,
                  fkcountry: result.fkCountry,
                  activity_type_fk: result.activityTypeFk,
                  activity_type_title: result.activityTypeTitle,
                  address_client: result.addressClient,
                  amount_paid: result.amountPaid,
                  city: result.city,
                  dateCreate: result.dateCreate,
                  dateTransfer: result.dateTransfer,
                  date_visit_Client: result.dateVisitClient,
                  fk_rejectClient: result.rejectId,
                  descActivController: result.descriptionActiveController,
                  fkRegoin: result.fkRegion,
                  fk_client_source: result.fkClientSource,
                  idClients: result.idClients,
                  fkusertrasfer: result.fkUserTrasfer,
                  ismarketing: result.isMarketing,
                  id_maincity: result.idMainCity,
                  mobile: result.mobile,
                  mobileuser: result.mobileUser,
                  nameAdduser: result.nameAdduser,
                  name_city: result.nameCity,
                  nameClient: result.nameClient,
                  NameClient_recomand: result.nameClientRecommend,
                  nameCountry: result.nameCountry,
                  nameEnterprise: result.nameEnterprise,
                  namemaincity: result.nameMainCity,
                  name_regoin: result.nameRegion,
                  nameUser: result.nameUser,
                  nameuserdoning: result.nameUserDoing,
                  nameusertransfer: result.nameUserTransfer,
                  phone: result.phone,
                  presystem: result.preSystem,
                  presystemtitle: result.preSystemTitle,
                  reasonChange: result.reasonChange,
                  reasonTransfer: result.reasonTransfer,
                  size_activity: result.sizeActivity,
                  sourcclient: result.sourceClient,
                  tag: result.tag,
                  total: result.total,
                  total_paid: result.totalPaid,
                  typeJob: result.typeJob,
                  user_add: result.userAdd,
                  user_do: result.userDo,
                );

                context.read<ClientProvider>().onUpdateListsMarketing(clientConvert);
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
                Text(
                  DateTime.tryParse(clientModel.dateCreate!) != null
                      ? intl.DateFormat("dd MMMM yyyy, hh:mm a").format(DateTime.parse(clientModel.dateCreate!))
                      : clientModel.dateCreate.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2, color: kMainColor),
                  textDirection: TextDirection.ltr,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Expanded(
                    child: Text(
                      clientModel.nameEnterprise.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: kfontfamily2),
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
