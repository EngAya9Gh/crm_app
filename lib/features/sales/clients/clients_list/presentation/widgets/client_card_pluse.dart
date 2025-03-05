import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';

class CardClient_pluse extends StatefulWidget {
  CardClient_pluse({Key? key, required this.clientModel, this.widget}) : super(key: key);
  ClientModel clientModel;
  final Widget? widget;

  @override
  State<CardClient_pluse> createState() => _CardClient_pluseState();
}

class _CardClient_pluseState extends State<CardClient_pluse> {
  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      child: Row(
        children: [
          widget.widget ?? SizedBox.shrink(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppText(widget.clientModel.nameEnterprise),
                    ),
                    AppText(widget.clientModel.typeClient),
                    if ((widget.clientModel.tag ?? false) && context.read<PrivilegesCubit>().checkPrivilege('133'))
                      AppIcon(
                        CupertinoIcons.checkmark_seal_fill,
                        color: Colors.amber,
                      ),
                  ],
                ),
                Row(
                  children: [
                    AppText(
                      widget.clientModel.name_city.toString(),
                      style: AppStyles.textStyle,
                    ),
                    Expanded(
                      child: AppText(
                        DateTime.tryParse(widget.clientModel.dateCreate!) != null
                            ? intl.DateFormat("dd MMMM yyyy, hh:mm a").format(DateTime.parse(widget.clientModel.dateCreate!))
                            : widget.clientModel.dateCreate.toString(),
                        color: AppColors.primaryMain,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: AppText(
                        widget.clientModel.nameRegion.toString(),
                      ),
                    ),
                    Flexible(
                      child: AppText(
                        widget.clientModel.activity_type_title == null ? '' : widget.clientModel.activity_type_title.toString(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
