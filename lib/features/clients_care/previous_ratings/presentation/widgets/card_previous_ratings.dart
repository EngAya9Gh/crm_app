import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/common/widgets/non_agent_client.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../model/communication_modle.dart';
import '../../../../../ui/screen/care/app_rate_widget.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'previous_ratings_list.dart';

class CardPreviousRatings extends StatelessWidget {
  const CardPreviousRatings({
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
          PreviousRatingsList(communication: communication),
          isNew: false,
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
                        color: AppColors.primaryMain,
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
                    AppText("عدد مرات التقييم : " +
                        communication.ratings.length.toString()),
                    communication.type_install == '2'
                        ? _firstInstall(context)
                        : _secondInstall(context),
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
                        color: AppColors.primaryMain,
                      ),
                    ],
                    if (communication.dateNext != null) ...[
                      AppText(
                        HelperFunctions.formatDate(
                          communication.dateNext.toString(),
                        ),
                        color: AppColors.primaryMain,
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
                Expanded(
                  child: AppRateWidget(
                    title: 'التقييم',
                    rateValue: double.tryParse(
                            communication.ratings.first.newRate ?? '0') ??
                        0.0,
                    initialRating: double.tryParse(
                            communication.ratings.first.newRate ?? '0') ??
                        0.0,
                    isReadOnly: true,
                  ),
                ),
              ],
              if (_showTagIcon(context))
                AppIcon(
                  CupertinoIcons.checkmark_seal_fill,
                  color: AppColors.secondaryMain,
                )
            ],
          ),
        ],
      ),
    );
  }

  bool _showRateBar() {
    return communication.dateCommunication != null &&
        communication.ratings.isNotEmpty;
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

  Widget _secondInstall(BuildContext context) {
    String text = "";
    if (communication.typeCommuncation == 'ترحيب') {
      text = communication.date_approve.toString();
    } else if (communication.type_install == '1' &&
        communication.dateCommunication == null) {
      text = communication.dateinstall_done.toString();
    } else {
      text = communication.dateCommunication.toString();
    }

    if (text == "null") return SizedBox.shrink();

    return AppText(
      text,
      color: AppColors.primaryMain,
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
    );
  }

  Widget _firstInstall(BuildContext context) {
    final String? text = communication.dateCommunication == null
        ? communication.date_last_com_install.toString()
        : communication.dateCommunication.toString();

    if (text == null || text == "null") return SizedBox.shrink();

    return AppText(
      communication.dateCommunication == null
          ? communication.date_last_com_install.toString()
          : communication.dateCommunication.toString(),
      color: AppColors.primaryMain,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.start,
    );
  }
}
