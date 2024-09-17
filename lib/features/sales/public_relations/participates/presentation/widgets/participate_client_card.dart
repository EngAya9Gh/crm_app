import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../ui/screen/client/client_profile.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
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
    return AppCardContainer(
      onTap: () {
        AppNavigator.go(
          ClientProfile(idClient: widget.client.idClients.toString()),
          isNew: false,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText(
                  widget.client.nameEnterprise.toString(),
                  fontWeight: FontWeight.bold,
                ),
              ),
              if ((widget.client.tag ?? false) &&
                  context.read<PrivilegesCubit>().checkPrivilege('133'))
                AppIcon(
                  CupertinoIcons.checkmark_seal_fill,
                  color: AppColors.secondaryColor,
                )
            ],
          ),
          10.height,
          if (widget.client.datePrice != null)
            AppText(
              DateTime.tryParse(widget.client.dateCreate!) != null
                  ? intl.DateFormat("dd MMMM yyyy, hh:mm a")
                      .format(DateTime.parse(widget.client.dateCreate!))
                  : widget.client.dateCreate.toString(),
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              textDirection: TextDirection.ltr,
            ),
        ],
      ),
    );
  }
}
