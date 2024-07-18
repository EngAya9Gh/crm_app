import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/lastCommentClientModel.dart';
import '../../../../../ui/screen/client/profileclient.dart';
import '../../../../app/presentation/widgets/app_text.dart';

class LatestUpdateCard extends StatelessWidget {
  const LatestUpdateCard({super.key, required this.latestUpdate});

  final LastCommentClientModel latestUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 8.0,
            color: Colors.black87.withOpacity(0.2),
          ),
        ],
        color: Colors.white30,
      ),
      child: Center(
        child: InkWell(
          onTap: () {
            AppNavigator.push(ProfileClient(
              tabIndex: 2,
              client: latestUpdate.clientObject,
              idClient: latestUpdate.clientObject.idClients,
            ));
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              //height: 70,//MediaQuery.of(context).size.height*0.15,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              latestUpdate.clientObject.name_regoin.toString(),
                              style: _buildTextStyle(context),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              child: AppText(
                                latestUpdate.clientObject.nameEnterprise ??
                                    latestUpdate.clientObject.nameClient!,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppText(
                              (_daysText()),
                              style: _buildTextStyle(context),
                            ),
                            AppText(
                              'مضى على آخر تعليق',
                              style: _buildTextStyle(context),
                            ),
                            // if (isMarketing) ...[
                            if (true) ...[
                              AppText(
                                'عمر التفاوض ${latestUpdate.ageClient}',
                                style: _buildTextStyle(context),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _daysText() {
    return int.parse(latestUpdate.hoursLastComment.toString()) < 0
        ? 'لا يوجد اي تعليق'
        : latestUpdate.hoursLastComment.toString() + ' يوم ';
  }

  TextStyle? _buildTextStyle(BuildContext context) {
    return context.textTheme.bodyMedium?.copyWith(
      fontSize: 12.sp,
      color: kMainColor,
    );
  }
}
