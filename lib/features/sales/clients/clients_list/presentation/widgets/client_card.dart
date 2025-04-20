import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
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
import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../ui/screen/client/client_profile.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../pages/client_add_edit_page.dart';

class CardClient extends StatefulWidget {
  CardClient({Key? key, required this.clientModel, this.widget})
      : super(key: key);
  ClientModel clientModel;
  final Widget? widget;
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
              ClientModel? clientModel = await AppNavigator.go(
                ClientAddEditPage(client: widget.clientModel),
                isNew: false,
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
      child: AppCardContainer(
        onTap: () {
          AppNavigator.go(
            ClientProfile(idClient: widget.clientModel.idClients),
            name: AppRoutesNames.clientProfile.inClientsList,
            pathParameters: {
              'idClient': widget.clientModel.idClients.toString()
            },
          );
        },
        child: Column(
          children: [
            Row(
              children: [
                widget.widget ?? SizedBox.shrink(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppText(
                              widget.clientModel.nameEnterprise,
                              fontSize: 15.scaleFontSize,
                            ),
                          ),
                          if ((widget.clientModel.tag ?? false) &&
                              context
                                  .read<PrivilegesCubit>()
                                  .checkPrivilege('133')) ...[
                            SizedBox(width: 10),
                            AppIcon(
                              CupertinoIcons.checkmark_seal_fill,
                              color: AppColors.secondaryMain,
                            ),
                          ],
                        ],
                      ),
                      5.height,
                      Row(
                        children: [
                          AppText(
                            DateTime.tryParse(widget.clientModel.dateCreate!) !=
                                    null
                                ? intl.DateFormat("dd MMMM yyyy, hh:mm a")
                                    .format(DateTime.parse(
                                        widget.clientModel.dateCreate!))
                                : widget.clientModel.dateCreate.toString(),
                            color: AppColors.primaryMain,
                            fontSize: 12.sp,
                            textDirection: TextDirection.ltr,
                          ),
                          Spacer(),
                          if (widget.clientModel.subscribingIntentionLevel !=
                              null) ...[
                            AppIcon(
                              Icons.flag,
                              color: widget
                                  .clientModel.subscribingIntentionLevel?.color,
                            ),
                          ],
                        ],
                      ),
                    ],
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
