import 'package:crm_smart/core/common/extensions/build_context.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/sales/clients/add_client_contact/presentation/pages/add_client_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../../core/common/widgets/app_status_chip.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../../ui/screen/client/client_profile.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/client_contact_model.dart';
import 'package:intl/intl.dart' as intl;

import '../manager/clients_contacts_bloc.dart';

class ClientContactListItem extends StatelessWidget {
  final ClientContactModel contact;

  const ClientContactListItem({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(contact.id),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.35,
        dragDismissible: true,
        children: [
          SlidableAction(
            onPressed: (actionContext)  async {
              ClientContactModel? result =
              await AppNavigator.go(
                AddClientContactPage(clientContact: contact),
                name: AppRoutesNames.salesInternalRoutes.addContact,
                isNew: false,
              );
              if(result!=null){
                context.read<ClientsContactsBloc>().add(const GetAllClientsContactsEvent(page: 1));
              }
            },
            backgroundColor: context.colorScheme.primaryContainer,
            foregroundColor: Colors.white,
            icon: Icons.edit_rounded,
            label: 'تعديل',
            spacing: 5,
            autoClose: true,
          ),
        ],
      ),
      child: AppCardContainer(
        onTap: () {
          if(contact.client !=null){
            AppNavigator.go(
              ClientProfile(idClient:contact.client!.idClients),
              name: AppRoutesNames.clientProfile.inClientsList,
              pathParameters: {
                'idClient': contact.client!.idClients.toString()
              },
            );
          }

        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AppText(
                    contact.name,color: AppColors.primaryMain,
                    maxLines: 1,
                  ),
                ),
                10.width,
                contact.type==null?SizedBox():AppStatusChip(
                  status: contact.type!,
                  color: ContactTypeRoleEnumExtension.fromValue(contact.type!).color,
                )
              ],
            ),
            10.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: AppText(
                      intl.DateFormat("dd MMMM yyyy, hh:mm a").format(contact.updatedAt),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                10.width,
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerEnd,
                    child: AppText(
                      contact.contactValue,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),
            ],
        ),
      ),
    );

  }
}