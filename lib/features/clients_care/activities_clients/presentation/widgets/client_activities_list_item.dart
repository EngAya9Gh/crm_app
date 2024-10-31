import 'package:crm_smart/core/common/extensions/build_context.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../../core/common/widgets/app_status_chip.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/client_activity_model.dart';
import 'package:intl/intl.dart' as intl;


class ClientActivityListItem extends StatelessWidget {
  final ClientActivityModel activity;

  const ClientActivityListItem({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(activity.id),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.35,
        dragDismissible: true,
        children: [
          SlidableAction(
            onPressed: (actionContext)  async {
              // ClientActivityModel? result =
              // await AppNavigator.go(
              //   AddClientContactPage(clientContact: activity),
              //   name: AppRoutesNames.salesInternalRoutes.addContact,
              //   isNew: false,
              // );
              // if(result!=null){
              //   context.read<ClientsContactsBloc>().add(const GetAllClientsContactsEvent(page: 1));
              // }
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

        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              activity.nameEnterprise,
              color: AppColors.primaryMain,
              maxLines: 1,
            ),
            10.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: AppText(
                      activity.name,
                      maxLines: 1,
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
                      activity.updatedAt==null?"":intl.DateFormat("dd MMMM, hh:mm a").format(activity.updatedAt!),
                      overflow: TextOverflow.ellipsis,
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