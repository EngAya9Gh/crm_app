import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/communication_modle.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
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
    final bool showStar =
        communication.typeSeller != '1' && communication.fk_regoin == 11;
    return InkWell(
      onTap: () {
        AppNavigator.push(PreviousRatingsList(communication: communication));
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.5),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                        if (showStar) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.workspace_premium,
                                color: Colors.amber,
                              ),
                              AppText("عميل غير مرتبط بوكيل "),
                            ],
                          ),
                        ],
                        if (communication.dateCommunication == null) ...[
                          AppText(
                            communication.name_regoin.toString(),
                            style: context.textTheme.titleSmall?.copyWith(
                              color: kMainColor,
                            ),
                          ),
                        ],
                        AppText(
                          communication.nameEnterprise.toString(),
                          style: context.textTheme.bodyMedium,
                        ),
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
                            int.parse(communication.hoursdelaylabel
                                        .toString()) <
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
                            style: context.textTheme.bodySmall?.copyWith(
                              color: kMainColor,
                            ),
                          ),
                        ],
                        if (communication.dateNext != null) ...[
                          AppText(
                            HelperFunctions.formatDate(
                              communication.dateNext.toString(),
                            ),
                            style: context.textTheme.titleSmall?.copyWith(
                              color: kMainColor,
                            ),
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
                      initialRating: communication.ratings.last.newRate == null
                          ? 0.0
                          : double.parse(
                              communication.ratings.last.newRate.toString()),
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
                        );
                      },
                      onRatingUpdate: (double value) {},
                    ),
                  ],
                  if (_showTagIcon(context))
                    Icon(
                      CupertinoIcons.checkmark_seal_fill,
                      color: Colors.amber,
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _showRateBar() {
    return communication.dateCommunication != null &&
        communication.ratings.isNotEmpty;
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
      style: context.textTheme.titleSmall?.copyWith(color: kMainColor),
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
        style: context.textTheme.titleSmall?.copyWith(
          color: kMainColor,
        ));
  }
}
