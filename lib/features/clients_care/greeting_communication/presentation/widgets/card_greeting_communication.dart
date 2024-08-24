import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/helpers/is_star_client_communication.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/communication_modle.dart';
import '../../../../../ui/screen/client/profile_client.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';

class CardGreetingCommunication extends StatelessWidget {
  const CardGreetingCommunication({
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
        AppNavigator.push(ProfileClient(
          idClient: communication.fkClient,
          tabIndex: 4,
          tabCareIndex: tabCareIndex,
          idCommunication: communication.idCommunication,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
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
                      if (_showStar()) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.label_important,
                              color: Colors.amberAccent,
                              size: (20.0).scaleIconsSize,
                            ),
                            2.width,
                            AppText("عميل غير مرتبط بوكيل"),
                          ],
                        ),
                      ],
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
                      communication.type_install == '2'
                          ? _firstInstall(context)
                          : _secondInstall(context),
                      if (communication.hoursdelaylabel != null) ...[
                        AppText(
                          int.parse(communication.hoursdelaylabel.toString()) <
                                  0
                              ? ' تأخر عن التواصل  ' +
                                  (int.parse(communication.hoursdelaylabel
                                              .toString()) *
                                          -1)
                                      .toString() +
                                  ' يوم '
                              : ' باقي ' +
                                  communication.hoursdelaylabel.toString() +
                                  ' يوم ',
                          fontSize: 16,
                          fontFamily: AppFonts.fontFamily2,
                        ),
                      ],
                      if (communication.dateNext != null) ...[
                        AppText(
                          HelperFunctions.formatDate(
                            communication.dateNext.toString(),
                          ),
                          color: AppColors.primaryColor,
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
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _showRateBar() {
    return communication.typeCommuncation == 'تركيب' &&
        communication.dateCommunication != null;
  }

  bool _showTagIcon(BuildContext context) {
    return (communication.tag ?? false) &&
        context.read<PrivilegeCubit>().checkPrivilege('133');
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
      color: AppColors.primaryColor,
      fontSize: 18,
    );
  }

  AppText _firstInstall(BuildContext context) {
    return AppText(
      communication.dateCommunication == null
          ? communication.date_last_com_install.toString()
          : communication.dateCommunication.toString(),
      color: AppColors.primaryColor,
      fontSize: 18,
    );
  }

  bool _showStar() {
    return isStarClientCommunication(
      typeSeller: communication.typeSeller,
      fkRegion: communication.fk_regoin,
    );
  }
}
