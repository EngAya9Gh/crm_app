import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/config/navigator/app_routes_paths.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/data/models/elevation_model.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/domain/use_cases/process_system_rating_use_case.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/presentation/manager/sys_support_rating_bloc.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/presentation/widgets/elevation_sys_support_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../app/presentation/widgets/app_text.dart';

class ElevationSysOrSupportCard extends StatelessWidget {
  const ElevationSysOrSupportCard({
    super.key,
    required this.elevationModel,
    required this.tabElevationIndex,
  });

  final ElevationModel elevationModel;
  final int tabElevationIndex;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () {
        AppNavigator.go(
            ElevationSysSupportView(
              elevationModel: elevationModel,
            ),
            name: AppRoutesPaths.careSubSections.sysSupportRatingView,
            extra: elevationModel);
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
                    AppText(
                      elevationModel.nameEnterprise,
                      color: AppColors.primaryMain,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
              if (elevationModel.rateDate?.isNotEmpty ?? false)
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        elevationModel.rateDate,
                        color: AppColors.primaryMain,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          8.height,
          // if (tabElevationIndex == 1)
          AppText(
            elevationModel.question,
            fontWeight: FontWeight.bold,
          ),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "التقييم :",
                fontWeight: FontWeight.bold,
              ),
              10.width,
              RatingBar.builder(
                initialRating: elevationModel.rate == null
                    ? 0.0
                    : double.parse(elevationModel.rate.toString()),
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
              )
            ],
          ),
          8.height,
          if ((elevationModel.ratingReason?.isNotEmpty ?? false) ||
              (elevationModel.message?.isNotEmpty ?? false))
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'سبب التقييم : ',
                  fontWeight: FontWeight.bold,
                ),
                Expanded(
                    child: AppText(
                  elevationModel.message ??
                      elevationModel.ratingReason ??
                      'لايوجد',
                  fontSize: 16,
                )),
              ],
            ),

          16.verticalSpace,
          if (elevationModel.should_processed!)
            SizedBox(
              width: double.infinity,
              child: AppElevatedButton(
                text: 'تم التواصل',
                onPressed: () {
                  _showCommentDialog(context);
                },
                backgroundColor: AppColors.primaryMain,
              ),
            ),
        ],
      ),
    );
  }

  // دالة لعرض حوار إدخال التعليق
  void _showCommentDialog(BuildContext context) {
    final TextEditingController _commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: AppText('إضافة تعليق'),
          content: TextField(
            controller: _commentController,
            decoration: InputDecoration(
              hintText: 'أدخل تعليقك هنا...',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: AppText('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                if (_commentController.text.isNotEmpty) {
                  // استدعاء حدث معالجة التقييم
                  context.read<SysSupportRatingBloc>().add(
                        ProcessSystemRatingEvent(
                          params: ProcessSystemRatingParams(
                            ratingId: elevationModel.id!,
                            comment: _commentController.text,
                          ),
                        ),
                      );
                  Navigator.of(context).pop();
                }
              },
              child: AppText('تأكيد'),
            ),
          ],
        );
      },
    );
  }
}
