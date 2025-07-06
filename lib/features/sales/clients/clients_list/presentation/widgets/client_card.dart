import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/client/client_source_enum.dart';
import '../../../../../../core/common/enums/client/subscribing_intention_level_enum.dart';
import '../../../../../../core/common/extensions/build_context.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/client_card_preferences.dart';
import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/common/widgets/app_status_chip.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../ui/screen/client/client_profile.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../pages/client_add_edit_page.dart';
import '../providers/client_card_preferences_provider.dart';

class CardClient extends StatefulWidget {
  CardClient({Key? key, required this.clientModel, this.widget})
      : super(key: key);
  ClientModel clientModel;
  final Widget? widget;
  @override
  State<CardClient> createState() => _CardClientState();
}

class _CardClientState extends State<CardClient> {
  late Future<ClientCardPreferences> _preferencesFuture;

  @override
  void initState() {
    super.initState();
    _preferencesFuture = ClientCardPreferences.load();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientCardPreferencesProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final preferences = provider.preferences;
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
                              if (widget.clientModel.sourcclient != null) ...[
                                AppIcon(
                                  ClientSourceEnum.getSourceIcon(
                                      widget.clientModel.sourcclient),
                                  color: ClientSourceEnum.getSourceColor(
                                      widget.clientModel.sourcclient),
                                  size: 25,
                                ),
                              ],
                              SizedBox(width: 10),
                              Expanded(
                                child: AppText(
                                  widget.clientModel.nameEnterprise,
                                  fontSize: 16.scaleFontSize,
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
                              if (widget.clientModel.nameRegion != null &&
                                  context
                                      .read<PrivilegesCubit>()
                                      .checkPrivilege('8')) ...[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: AppText(
                                    fontSize: 14.scaleFontSize,
                                    widget.clientModel.name_city != null
                                        ? widget.clientModel.nameRegion
                                                .toString() +
                                            '/' +
                                            widget.clientModel.name_city
                                                .toString()
                                        : widget.clientModel.nameRegion
                                            .toString(),
                                    color: AppColors.primaryMain,
                                  ),
                                ),
                              ] else if (widget.clientModel.name_city != null)
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: AppStatusChip(
                                    fontSize: 14.scaleFontSize,
                                    status:
                                        widget.clientModel.name_city.toString(),
                                    color: AppColors.secondaryMain,
                                  ),
                                ),
                            ],
                          ),
                          5.height,
                          Row(
                            children: [
                              AppText(
                                DateTime.tryParse(
                                            widget.clientModel.dateCreate!) !=
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
                              if (widget
                                      .clientModel.subscribingIntentionLevel !=
                                  null) ...[
                                AppIcon(
                                  Icons.flag,
                                  color: widget.clientModel
                                      .subscribingIntentionLevel?.color,
                                ),
                              ],
                            ],
                          ),
                          Row(
                            children: [
                              if (preferences.showNameUser &&
                                  widget.clientModel.nameUser != null)
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: AppStatusChip(
                                    fontSize: 12,
                                    status:
                                        widget.clientModel.nameUser.toString(),
                                    color: preferences.nameUserColor ,
                                  ),
                                ),
                              if (preferences.showTypeClient &&
                                  widget.clientModel.typeClient != null)
                                Align(

                                  alignment: Alignment.topLeft,
                                  child: AppStatusChip(
                                    fontSize: 12,
                                    status: widget.clientModel.typeClient
                                        .toString(),
                                    color:preferences.typeClientColor,
                                  ),
                                ),
                              if (preferences.showMobile &&
                                  widget.clientModel.mobile != null)
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: AppStatusChip(
                                    fontSize: 12,
                                    status:
                                        widget.clientModel.mobile.toString(),
                                    color: preferences.mobileColor//AppColors.textPrimary,
                                  ),
                                ),
                              if (preferences.showTypeRecord &&
                                  widget.clientModel.type_record != null && widget.clientModel.type_record!.isNotEmpty)
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: AppStatusChip(
                                    fontSize: 12,
                                    status: widget.clientModel.type_record
                                        .toString(),
                                    color:preferences.typeRecordColor  //AppColors.secondaryAltLight,
                                  ),
                                ),
                              if (preferences.showclassfication &&
                                  widget.clientModel.type_classification != null)
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: AppStatusChip(
                                    fontSize: 12,
                                    status: widget.clientModel.type_classification
                                        .toString(),
                                    color:preferences.classficationColor  //AppColors.secondaryAltLight,
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
