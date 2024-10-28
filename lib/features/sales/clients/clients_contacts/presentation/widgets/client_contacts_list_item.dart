import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/client_contact_model.dart';
import 'package:intl/intl.dart' as intl;

class ClientContactListItem extends StatelessWidget {
  final ClientContactModel contact;

  const ClientContactListItem({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () {

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppText(
                  contact.name,color: AppColors.primaryMain,
                ),
              ),
              10.width,
              AppText(
                contact.contactType,
              ),
            ],
          ),
          10.height,
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppText(
                  intl.DateFormat("dd MMMM yyyy, hh:mm a").format(contact.updatedAt),
                ),
              ),
              10.width,
              AppText(
                contact.contactValue,
              ),
            ],
          ),
          ],
      ),
    );

  }
}