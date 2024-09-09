import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../../core/common/enums/client/subscribing_intention_level_enum.dart';
import '../../../../../../core/common/extensions/build_context.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../ui/screen/client/client_profile.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
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
        dragDismissible: true,
        children: [
          SlidableAction(
            onPressed: (actionContext) async {
              ClientModel? clientModel = await AppNavigator.push(
                ClientAddEditPage(client: widget.clientModel),
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
            spacing: 5,
            autoClose: true,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          AppNavigator.push(
            ClientProfile(idClient: widget.clientModel.idClients),
            name: AppRoutesNames
                .clientProfileInClientsSubSections.clientProfileInClientsList,
            pathParameters: {'idClient': widget.clientModel.idClients!},
          );
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
                      child: AppText(
                        widget.clientModel.nameEnterprise.toString(),
                        style: AppStyles.textStyle,
                      ),
                    ),
                    AppText(
                      DateTime.tryParse(widget.clientModel.dateCreate!) != null
                          ? intl.DateFormat("dd MMMM yyyy, hh:mm a").format(
                              DateTime.parse(widget.clientModel.dateCreate!))
                          : widget.clientModel.dateCreate.toString(),
                      style: AppStyles.textStyle
                          .copyWith(color: AppColors.primaryColor),
                      textDirection: TextDirection.ltr,
                    ),
                    if ((widget.clientModel.tag ?? false) &&
                        context
                            .read<PrivilegesCubit>()
                            .checkPrivilege('133')) ...[
                      SizedBox(width: 10),
                      Icon(
                        CupertinoIcons.checkmark_seal_fill,
                        color: Colors.amber,
                        size: (25.0).scaleFontSize,
                      )
                    ],
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      '',
                      style: AppStyles.textStyle,
                    ),
                    widget.clientModel.subscribingIntentionLevel != null
                        ? Icon(
                            Icons.flag,
                            color: widget
                                .clientModel.subscribingIntentionLevel?.color,
                            size: (25.0).scaleFontSize,
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
