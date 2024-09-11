import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/widgets/non_agent_client.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/config/navigator/app_routes_names.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../model/communication_modle.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';

class CardInstallQuality extends StatelessWidget {
  const CardInstallQuality({
    super.key,
    required this.communication,
    required this.tabCareIndex,
  });

  final CommunicationModel communication;
  final int tabCareIndex;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () {
        AppNavigator.go(
          ClientProfile(
            idClient: communication.fkClient,
            tabIndex: 4,
            tabCareIndex: tabCareIndex,
            idCommunication: communication.idCommunication,
          ),
          name: AppRoutesNames.clientProfile.inCareInstallQuality,
          pathParameters: {'idClient': communication.fkClient.toString()},
          extra: {
            'tabIndex': 4,
            'tabCareIndex': tabCareIndex,
            'idCommunication': communication.idCommunication,
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NonAgentClient(communication: communication),
                    if (communication.dateCommunication == null) ...[
                      AppText(
                        communication.name_regoin,
                        color: AppColors.primaryColor,
                        fontSize: 18,
                      ),
                    ],
                    AppText(communication.nameEnterprise),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _prepareDate(context),
                    if (communication.dateCommunication == null) ...[
                      AppText(
                        int.parse(communication.hoursdelaylabel.toString()) < 0
                            ? ' تأخر عن التواصل  ' +
                                (int.parse(communication.hoursdelaylabel
                                            .toString()) *
                                        -1)
                                    .toString() +
                                ' يوم '
                            : ' باقي ' +
                                communication.hoursdelaylabel.toString() +
                                ' يوم ',
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                    ],
                    if (communication.dateNext != null) ...[
                      AppText(
                        HelperFunctions.formatDate(
                          communication.dateNext.toString(),
                        ),
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: _buildAlignment(context),
            children: [
              if (_showRateBar()) ...[
                RatingBar.builder(
                  initialRating: communication.rate == null
                      ? 0.0
                      : double.parse(communication.rate.toString()),
                  itemSize: 30,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemBuilder: (context, _) {
                    return Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: (25.0).scaleIconsSize,
                    );
                  },
                  onRatingUpdate: (double value) {},
                ),
              ],
              if (_showTagIcon(context))
                Icon(
                  CupertinoIcons.checkmark_seal_fill,
                  color: Colors.amber,
                  size: (25.0).scaleIconsSize,
                ),
            ],
          ),
        ],
      ),
    );
  }

  bool _showTagIcon(BuildContext context) {
    return (communication.tag ?? false) &&
        context.read<PrivilegesCubit>().checkPrivilege('133');
  }

  MainAxisAlignment _buildAlignment(BuildContext context) {
    if (_showTagIcon(context) && _showRateBar())
      return MainAxisAlignment.spaceBetween;

    if (_showTagIcon(context)) return MainAxisAlignment.end;

    return MainAxisAlignment.start;
  }

  bool _showRateBar() {
    return communication.dateCommunication != null;
  }

  AppText _prepareDate(BuildContext context) {
    return AppText(
      communication.dateinstall_done != null
          ? communication.dateinstall_done
          : communication.date_last_com_install,
      color: AppColors.primaryColor,
      fontSize: 18,
    );
  }
}
